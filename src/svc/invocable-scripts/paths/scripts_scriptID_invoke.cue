package paths

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
	requestBody: content: "application/json": schema: $ref: "../schemas/ScriptInvocationParams.yml"
	responses: {
		"200": {
			description: "The result of the script execution."
			content: "application/json": schema: $ref: "../schemas/ScriptHTTPResponseData.yml"
		}
		default: {
			description: "Unexpected error"
			$ref:        "../../../common/responses/ServerError.yml"
		}
	}
}
