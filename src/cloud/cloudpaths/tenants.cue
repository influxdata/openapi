package cloudpaths

import (
	"github.com/influxdata/openapi/src/common/commonresponses"

	"github.com/influxdata/openapi/src/cloud/cloudschemas"

)

tenants: post: {
	summary: "This is a temporary, experimental, soon to be depricated API for Quartz"
	requestBody: {
		description: "the parameters for the org to be created, including limits"
		required:    true
		content: "application/json": schema: cloudschemas.OrganizationRequest.#Ref
	}
	responses: {
		"201": {
			description: "The created organization and the initial bucket"
			content: "application/json": schema: cloudschemas.OrganizationResponse
		}
		"400": {
			description: "The requested changes were invalid"
			content: "application/json": schema: cloudschemas.InvalidRequestError.#Ref
		}
		"401": {
			description: "Credentials not provided"
			content: "application/json": schema: cloudschemas.UnauthorizedRequestError.#Ref
		}
		"403": {
			description: "Insufficient credentials to create an organization"
			content: "application/json": schema: cloudschemas.ForbiddenRequestError.#Ref
		}
		default: {
			description: "unexpected error"
			commonresponses.ServerError.#Ref
		}
	}
}
