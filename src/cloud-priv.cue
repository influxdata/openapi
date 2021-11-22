package contracts

import (
	"github.com/influxdata/openapi/src/common/commonschemas"

	"github.com/influxdata/openapi/src/common/commonresponses"

	"github.com/influxdata/openapi/src/cloud/cloudschemas"

	"github.com/influxdata/openapi/src/cloud/cloudpaths"

)

all: "cloud-priv": {
	openapi: "3.0.0"
	info: {
		title:   "IDPE-exclusive API endpoints"
		version: "2.3.3"
	}
	servers: [{
		description: """
			V2 Private is not necessarily private in the sense that the world cannot view it,
			but defines routes that are of little use to the world (quartz-specific routes that
			require a super token (`/setup/user`)), or routes that are not yet guaranteed to
			not change.
			"""

		url: "/api/v2private"
	}]
	paths: {
		"/oauth/clientConfig":         cloudpaths.oauth_clientConfig
		"/flags":                      cloudpaths.flags
		"/limitevents":                cloudpaths.limitevents
		"/orgs/{orgID}/limits":        cloudpaths.orgs_orgID_limits
		"/orgs/{orgID}/limits/status": cloudpaths.orgs_orgID_limits_status
		"/orgs/{orgID}/settings":      cloudpaths.orgs_orgID_settings
		"/tenants":                    cloudpaths.tenants
		"/setup/user":                 cloudpaths.setup_user
	}
	components: {
		schemas: {
			OnboardingRequest:        cloudschemas.OnboardingRequest
			OnboardingResponse:       cloudschemas.OnboardingResponse
			InvalidRequestError:      cloudschemas.InvalidRequestError
			UnauthorizedRequestError: cloudschemas.UnauthorizedRequestError
			ForbiddenRequestError:    cloudschemas.ForbiddenRequestError
			Error:                    commonschemas.Error
			OAuthClientConfig:        cloudschemas.OAuthClientConfig
			LimitEvent:               cloudschemas.LimitEvent
			LimitEvents:              cloudschemas.LimitEvents
			LimitStatuses:            cloudschemas.LimitStatuses
			LimitStatus:              cloudschemas.LimitStatus
			Limit:                    cloudschemas.Limit
			OrgSettings:              cloudschemas.OrgSettings
			OrgSetting:               cloudschemas.OrgSetting
			Link:                     commonschemas.Link
			Links:                    commonschemas.Links
			OrganizationRequest:      cloudschemas.OrganizationRequest
		}
		responses: ServerError: commonresponses.ServerError
	}
}
