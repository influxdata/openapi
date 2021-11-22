package commonpaths

import (
	"github.com/influxdata/openapi/src/common/commonresponses"
	"github.com/influxdata/openapi/src/common/commonparameters"
	"github.com/influxdata/openapi/src/common/commonschemas"
)

setup: {
	get: {
		operationId: "GetSetup"
		tags: [
			"Setup",
		]
		summary:     "Check if database has default user, org, bucket"
		description: "Returns `true` if no default user, organization, or bucket has been created."
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}]
		responses: "200": {
			description: "allowed true or false"
			content: "application/json": schema: commonschemas.IsOnboarding.#Ref
		}
	}
	post: {
		operationId: "PostSetup"
		tags: [
			"Setup",
		]
		summary:     "Set up initial user, org and bucket"
		description: "Post an onboarding request to set up initial user, org and bucket."
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}]
		requestBody: {
			description: "Source to create"
			required:    true
			content: "application/json": schema: commonschemas.OnboardingRequest.#Ref
		}
		responses: {
			"201": {
				description: "Created default user, bucket, org"
				content: "application/json": schema: commonschemas.OnboardingResponse.#Ref
			}
			default: {
				description: "Unexpected error"
				commonresponses.ServerError.#Ref
			}
		}
	}
}
