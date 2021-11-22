package contracts

import (
	"github.com/influxdata/openapi/src/quartz/quartzschemas"

	"github.com/influxdata/openapi/src/quartz/quartzpaths"

	"github.com/influxdata/openapi/src/common/commonschemas"

	"github.com/influxdata/openapi/src/common/commonresponses"

)

all: "quartz-oem": {
	openapi: "3.0.0"
	info: {
		title:   "QuartzPublicAPI"
		version: "0.1.0"
	}
	servers: [{
		url: "/api/v2"
	}]
	security: [{
		bearerAuth: [

		]}]
	paths: {
		"/orgs":                quartzpaths.orgs
		"/orgs/{orgID}":        quartzpaths.org
		"/orgs/{orgID}/limits": quartzpaths.orgLimits
	}
	components: {
		securitySchemes: bearerAuth: {
			type:   "http"
			scheme: "bearer"
		}
		schemas: {
			BucketLimits:               quartzschemas.BucketLimits
			CheckLimits:                quartzschemas.CheckLimits
			DashboardLimits:            quartzschemas.DashboardLimits
			Error:                      commonschemas.Error
			Limit:                      quartzschemas.Limit
			NotificationEndpointLimits: quartzschemas.NotificationEndpointLimits
			NotificationRuleLimits:     quartzschemas.NotificationRuleLimits
			OrganizationRequest:        quartzschemas.OrganizationRequest
			OrganizationWithToken:      quartzschemas.OrganizationWithToken
			Organization:               quartzschemas.Organization
			Organizations:              quartzschemas.Organizations
			OrgLimits:                  quartzschemas.OrgLimits
			RateLimits:                 quartzschemas.RateLimits
			RestrictedLimit:            quartzschemas.RestrictedLimit
			TaskLimits:                 quartzschemas.TaskLimits
			Unlimited:                  quartzschemas.Unlimited
		}
		responses: {
			NoContent:   commonresponses.NoContent
			ServerError: commonresponses.ServerError
		}
	}
}
