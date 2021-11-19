package cloudpaths

import "github.com/influxdata/openapi/src/common/commonresponses"

import "github.com/influxdata/openapi/src/cloud/cloudschemas"

oauth_clientConfig: get: {
	tags: [
		"OAuth",
	]
	summary: "Retrieve required OAuth client variables"
	parameters: [{
		in:   "query"
		name: "redirectTo"
		schema: type: "string"
		description: "optional parameter to redirect the user to after a successful login."
		required:    false
	}]
	responses: {
		"200": {
			description: "Required OAuth client variables"
			content: "application/json": schema: cloudschemas.OAuthClientConfig.#Ref
		}
		default: {
			description: "unexpected error"
			commonresponses.ServerError.#Ref
		}
	}
}
