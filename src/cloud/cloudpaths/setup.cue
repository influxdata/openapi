package cloudpaths

import "github.com/influxdata/openapi/src/common/commonschemas"

import "github.com/influxdata/openapi/src/common/commonresponses"

import "github.com/influxdata/openapi/src/common/commonparameters"

import "github.com/influxdata/openapi/src/cloud/cloudschemas"

setup: {
	get: {
		operationId: "GetSetup"
		tags: [
			"Setup",
		]
		summary:     "Retrieve setup status"
		description: "Check if setup is allowed. Returns `true` if no default user, organization, or bucket have been created."
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}]
		responses: "200": {
			description: "Setup is allowed, true or false"
			content: "application/json": schema: commonschemas.IsOnboarding.#Ref
		}
	}
	post: {
		operationId: "PostSetup"
		tags: [
			"Setup",
		]
		summary:     "Create an initial user, organization, and bucket"
		description: "Post an onboarding request to create an initial user, organization, and bucket."
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}]
		requestBody: {
			description: "Source to create"
			required:    true
			content: "application/json": schema: cloudschemas.OnboardingRequest.#Ref
		}
		responses: {
			"201": {
				description: "The created default user, bucket, and organization"
				content: "application/json": schema: cloudschemas.OnboardingResponse.#Ref
			}
			default: {
				description: "Unexpected error"
				commonresponses.ServerError.#Ref
			}
		}
	}
}
