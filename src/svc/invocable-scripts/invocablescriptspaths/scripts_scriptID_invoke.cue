package invocablescriptspaths

import "github.com/influxdata/openapi/src/svc/invocable-scripts/invocablescriptsschemas"

import "github.com/influxdata/openapi/src/common/commonresponses"

scripts_scriptID_invoke: post: {
	operationId: "PostScriptsIDInvoke"
	tags: [
		"Invocable Scripts",
	]
	summary:     "Invoke a script"
	description: "Invokes a script and substitutes `params` keys referenced in the script with `params` key-values sent in the request body."
	parameters: [{
		in:   "path"
		name: "scriptID"
		schema: type: "string"
		required: true
	}]
	requestBody: content: "application/json": schema: invocablescriptsschemas.ScriptInvocationParams.#Ref
	responses: {
		"200": {
			description: "The result of the script execution."
			content: "application/json": schema: invocablescriptsschemas.ScriptHTTPResponseData.#Ref
		}
		default: {
			description: "Unexpected error"
			commonresponses.ServerError.#Ref
		}
	}
}
