package cloudpaths

import "github.com/influxdata/openapi/src/common/commonresponses"

import "github.com/influxdata/openapi/src/common/commonparameters"

import "github.com/influxdata/openapi/src/cloud/cloudschemas"

variables: {
	get: {
		operationId: "GetVariables"
		tags: [
			"Variables",
		]
		summary: "List all variables"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:          "query"
			name:        "org"
			description: "The name of the organization."
			schema: type: "string"
		}, {
			in:          "query"
			name:        "orgID"
			description: "The organization ID."
			schema: type: "string"
		}]
		responses: {
			"200": {
				description: "A list of variables for an organization."
				content: "application/json": schema: cloudschemas.Variables.#Ref
			}
			"400": {
				description: "Invalid request"
				commonresponses.ServerError.#Ref
			}
			default: {
				description: "Internal server error"
				commonresponses.ServerError.#Ref
			}
		}
	}
	post: {
		operationId: "PostVariables"
		summary:     "Create a variable"
		tags: [
			"Variables",
		]
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}]
		requestBody: {
			description: "Variable to create"
			required:    true
			content: "application/json": schema: cloudschemas.Variable.#Ref
		}
		responses: {
			"201": {
				description: "Variable created"
				content: "application/json": schema: cloudschemas.Variable.#Ref
			}
			default: {
				description: "Internal server error"
				commonresponses.ServerError.#Ref
			}
		}
	}
}
