package contracts

import "github.com/influxdata/openapi/src/quartz/quartzschemas"

import "github.com/influxdata/openapi/src/quartz/quartzpaths"

import "github.com/influxdata/openapi/src/common/commonschemas"

import "github.com/influxdata/openapi/src/common/commonresponses"

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
		"/orgs":                quartzpaths.orgs.#Ref
		"/orgs/{orgID}":        quartzpaths.org.#Ref
		"/orgs/{orgID}/limits": quartzpaths.orgLimits.#Ref
	}
	components: {
		securitySchemes: bearerAuth: {
			type:   "http"
			scheme: "bearer"
		}
		schemas: {
			BucketLimits:               quartzschemas.BucketLimits.#Ref
			CheckLimits:                quartzschemas.CheckLimits.#Ref
			DashboardLimits:            quartzschemas.DashboardLimits.#Ref
			Error:                      commonschemas.Error.#Ref
			Limit:                      quartzschemas.Limit.#Ref
			NotificationEndpointLimits: quartzschemas.NotificationEndpointLimits.#Ref
			NotificationRuleLimits:     quartzschemas.NotificationRuleLimits.#Ref
			OrganizationRequest:        quartzschemas.OrganizationRequest.#Ref
			OrganizationWithToken:      quartzschemas.OrganizationWithToken.#Ref
			Organization:               quartzschemas.Organization.#Ref
			Organizations:              quartzschemas.Organizations.#Ref
			OrgLimits:                  quartzschemas.OrgLimits.#Ref
			RateLimits:                 quartzschemas.RateLimits.#Ref
			RestrictedLimit:            quartzschemas.RestrictedLimit.#Ref
			TaskLimits:                 quartzschemas.TaskLimits.#Ref
			Unlimited:                  quartzschemas.Unlimited.#Ref
		}
		responses: {
			NoContent:   commonresponses.NoContent.#Ref
			ServerError: commonresponses.ServerError.#Ref
		}
	}
}
