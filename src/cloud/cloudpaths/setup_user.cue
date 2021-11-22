package cloudpaths

import (
	"github.com/influxdata/openapi/src/common/commonresponses"
	"github.com/influxdata/openapi/src/cloud/cloudschemas"
)

setup_user: post: {
	operationId: "PostSetupUser"
	tags: [
		"Setup",
	]
	summary:     "Create a new user, organization, and bucket"
	description: "Post an onboarding request to create a new user, organization, and bucket."
	requestBody: {
		description: "Source to create"
		required:    true
		content: "application/json": schema: cloudschemas.OnboardingRequest.#Ref
	}
	responses: {
		"201": {
			description: "The created default user, bucket, and organization."
			content: "application/json": schema: cloudschemas.OnboardingResponse.#Ref
		}
		default: {
			description: "Unexpected error"
			commonresponses.ServerError.#Ref
		}
	}
}
