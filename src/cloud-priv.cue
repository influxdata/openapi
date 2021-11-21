package contracts

import "github.com/influxdata/openapi/src/common/commonschemas"

import "github.com/influxdata/openapi/src/common/commonresponses"

import "github.com/influxdata/openapi/src/cloud/cloudschemas"

import "github.com/influxdata/openapi/src/cloud/cloudpaths"

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
		"/oauth/clientConfig":         cloudpaths.oauth_clientConfig.#Ref
		"/flags":                      cloudpaths.flags.#Ref
		"/limitevents":                cloudpaths.limitevents.#Ref
		"/orgs/{orgID}/limits":        cloudpaths.orgs_orgID_limits.#Ref
		"/orgs/{orgID}/limits/status": cloudpaths.orgs_orgID_limits_status.#Ref
		"/orgs/{orgID}/settings":      cloudpaths.orgs_orgID_settings.#Ref
		"/tenants":                    cloudpaths.tenants.#Ref
		"/setup/user":                 cloudpaths.setup_user.#Ref
	}
	components: {
		schemas: {
			OnboardingRequest:        cloudschemas.OnboardingRequest.#Ref
			OnboardingResponse:       cloudschemas.OnboardingResponse.#Ref
			InvalidRequestError:      cloudschemas.InvalidRequestError.#Ref
			UnauthorizedRequestError: cloudschemas.UnauthorizedRequestError.#Ref
			ForbiddenRequestError:    cloudschemas.ForbiddenRequestError.#Ref
			Error:                    commonschemas.Error.#Ref
			OAuthClientConfig:        cloudschemas.OAuthClientConfig.#Ref
			LimitEvent:               cloudschemas.LimitEvent.#Ref
			LimitEvents:              cloudschemas.LimitEvents.#Ref
			LimitStatuses:            cloudschemas.LimitStatuses.#Ref
			LimitStatus:              cloudschemas.LimitStatus.#Ref
			Limit:                    cloudschemas.Limit.#Ref
			OrgSettings:              cloudschemas.OrgSettings.#Ref
			OrgSetting:               cloudschemas.OrgSetting.#Ref
			Link:                     commonschemas.Link.#Ref
			Links:                    commonschemas.Links.#Ref
			OrganizationRequest:      cloudschemas.OrganizationRequest.#Ref
		}
		responses: ServerError: commonresponses.ServerError.#Ref
	}
}
