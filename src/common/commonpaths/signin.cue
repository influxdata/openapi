package commonpaths

import "github.com/influxdata/openapi/src/common/commonparameters"

import "github.com/influxdata/openapi/src/common/commonschemas"

signin: post: {
	operationId: "PostSignin"
	summary:     "Create a user session."
	description: "Authenticates ***Basic Auth*** credentials for a user. If successful, creates a new UI session for the user."
	tags: [
		"Signin",
	]
	security: [{
		BasicAuthentication: [

		]}]
	parameters: [{
		commonparameters.TraceSpan.#Ref
	}]
	responses: {
		"204": description: "Success. User authenticated."
		"401": {
			description: "Unauthorized access."
			content: "application/json": schema: commonschemas.Error.#Ref
		}
		"403": {
			description: "User account is disabled."
			content: "application/json": schema: commonschemas.Error.#Ref
		}
		default: {
			description: "Unsuccessful authentication."
			content: "application/json": schema: commonschemas.Error.#Ref
		}
	}
}
