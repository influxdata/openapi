package commonpaths

import (
	"github.com/influxdata/openapi/src/common/commonresponses"

	"github.com/influxdata/openapi/src/common/commonparameters"

	"github.com/influxdata/openapi/src/common/commonschemas"

)

variables_variableID: {
	get: {
		operationId: "GetVariablesID"
		tags: [
			"Variables",
		]
		summary: "Retrieve a variable"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:       "path"
			name:     "variableID"
			required: true
			schema: type: "string"
			description: "The variable ID."
		}]
		responses: {
			"200": {
				description: "Variable found"
				content: "application/json": schema: commonschemas.Variable.#Ref
			}
			"404": {
				description: "Variable not found"
				commonresponses.ServerError.#Ref
			}
			default: {
				description: "Internal server error"
				commonresponses.ServerError.#Ref
			}
		}
	}
	delete: {
		operationId: "DeleteVariablesID"
		tags: [
			"Variables",
		]
		summary: "Delete a variable"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:       "path"
			name:     "variableID"
			required: true
			schema: type: "string"
			description: "The variable ID."
		}]
		responses: {
			"204": description: "Variable deleted"
			default: {
				description: "Internal server error"
				commonresponses.ServerError.#Ref
			}
		}
	}
	patch: {
		operationId: "PatchVariablesID"
		summary:     "Update a variable"
		tags: [
			"Variables",
		]
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:       "path"
			name:     "variableID"
			required: true
			schema: type: "string"
			description: "The variable ID."
		}]
		requestBody: {
			description: "Variable update to apply"
			required:    true
			content: "application/json": schema: commonschemas.Variable.#Ref
		}
		responses: {
			"200": {
				description: "Variable updated"
				content: "application/json": schema: commonschemas.Variable.#Ref
			}
			default: {
				description: "Internal server error"
				commonresponses.ServerError.#Ref
			}
		}
	}
	put: {
		operationId: "PutVariablesID"
		summary:     "Replace a variable"
		tags: [
			"Variables",
		]
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:       "path"
			name:     "variableID"
			required: true
			schema: type: "string"
			description: "The variable ID."
		}]
		requestBody: {
			description: "Variable to replace"
			required:    true
			content: "application/json": schema: commonschemas.Variable.#Ref
		}
		responses: {
			"200": {
				description: "Variable updated"
				content: "application/json": schema: commonschemas.Variable.#Ref
			}
			default: {
				description: "Internal server error"
				commonresponses.ServerError.#Ref
			}
		}
	}
}
