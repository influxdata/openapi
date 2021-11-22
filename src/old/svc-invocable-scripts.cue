package old

"svc-invocable-scripts": {
	openapi: "3.0.0"
	info: {
		title:   "InfluxData Invocable Scripts API"
		version: "0.1.0"
		description: """
			Manage and execute scripts as API endpoints in InfluxDB.

			An API Invocable Script assigns your custom Flux script to a new InfluxDB API endpoint for your organization.
			Invocable scripts let you execute your script as an HTTP request to the endpoint.

			Invocable scripts accept parameters. Add parameter references in your script as `params.myparameter`.
			When you `invoke` your script, you send parameters as key-value pairs in the `params` object.
			InfluxDB executes your script with the key-value pairs as arguments and returns the result.

			For more information and examples, see [Invoke custom scripts](https://docs.influxdata.com/influxdb/cloud/api-guide/api-invocable-scripts).

			"""
	}

	servers: [{
		url: "/api/v2"
	}]
	paths: {
		"/scripts": {
			get: {
				operationId: "GetScripts"
				tags: [
					"Invocable Scripts",
				]
				summary: "List scripts"
				parameters: [{
					in:          "query"
					name:        "limit"
					description: "The number of scripts to return."
					required:    false
					schema: type: "integer"
				}, {
					in:          "query"
					name:        "offset"
					required:    false
					description: "The offset for pagination."
					schema: type: "integer"
				}]
				responses: {
					"200": {
						description: "The list of scripts."
						content: "application/json": schema: $ref: "#/components/schemas/Scripts"
					}
					default: {
						description: "Unexpected error"
						$ref:        "#/components/responses/ServerError"
					}
				}
			}
			post: {
				operationId: "PostScripts"
				tags: [
					"Invocable Scripts",
				]
				summary: "Create a script"
				requestBody: {
					description: "The script to create."
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/ScriptCreateRequest"
				}
				responses: {
					"201": {
						description: "The created script."
						content: "application/json": schema: $ref: "#/components/schemas/Script"
					}
					default: {
						description: "Unexpected error"
						$ref:        "#/components/responses/ServerError"
					}
				}
			}
		}
		"/scripts/{scriptID}": {
			get: {
				operationId: "GetScriptsID"
				tags: [
					"Invocable Scripts",
				]
				summary:     "Retrieve a script"
				description: "Uses script ID to retrieve details of an invocable script."
				parameters: [{
					in:   "path"
					name: "scriptID"
					schema: type: "string"
					required:    true
					description: "The script ID."
				}]
				responses: {
					"200": {
						description: "The requested script object."
						content: "application/json": schema: $ref: "#/components/schemas/Script"
					}
					default: {
						description: "Unexpected error"
						$ref:        "#/components/responses/ServerError"
					}
				}
			}
			patch: {
				operationId: "PatchScriptsID"
				tags: [
					"Invocable Scripts",
				]
				summary: "Update a script"
				description: """
					Updates properties (`name`, `description`, and `script`) of an invocable script.

					"""

				requestBody: {
					description: "Script update to apply"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/ScriptUpdateRequest"
				}
				parameters: [{
					in:   "path"
					name: "scriptID"
					schema: type: "string"
					required:    true
					description: "The script ID."
				}]
				responses: {
					"200": {
						description: "The updated script."
						content: "application/json": schema: $ref: "#/components/schemas/Script"
					}
					default: {
						description: "Unexpected error"
						$ref:        "#/components/responses/ServerError"
					}
				}
			}
			delete: {
				operationId: "DeleteScriptsID"
				tags: [
					"Invocable Scripts",
				]
				summary:     "Delete a script"
				description: "Deletes a script and all associated records."
				parameters: [{
					in:   "path"
					name: "scriptID"
					schema: type: "string"
					required:    true
					description: "The ID of the script to delete."
				}]
				responses: {
					"204": description: "The script is deleted."
					default: {
						description: "Unexpected error"
						$ref:        "#/components/responses/ServerError"
					}
				}
			}
		}
		"/scripts/{scriptID}/invoke": post: {
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
			requestBody: content: "application/json": schema: $ref: "#/components/schemas/ScriptInvocationParams"
			responses: {
				"200": {
					description: "The result of the script execution."
					content: "application/json": schema: $ref: "#/components/schemas/ScriptHTTPResponseData"
				}
				default: {
					description: "Unexpected error"
					$ref:        "#/components/responses/ServerError"
				}
			}
		}
	}
	components: {
		responses: ServerError: {
			description: "Non 2XX error response from server."
			content: "application/json": schema: $ref: "#/components/schemas/Error"
		}
		schemas: {
			Error: {
				properties: {
					code: {
						description: "code is the machine-readable error code."
						readOnly:    true
						type:        "string"
						enum: [
							"internal error",
							"not found",
							"conflict",
							"invalid",
							"unprocessable entity",
							"empty value",
							"unavailable",
							"forbidden",
							"too many requests",
							"unauthorized",
							"method not allowed",
							"request too large",
							"unsupported media type",
						]
					}
					message: {
						readOnly:    true
						description: "message is a human-readable message."
						type:        "string"
					}
					op: {
						readOnly:    true
						description: "op describes the logical code operation during error. Useful for debugging."
						type:        "string"
					}
					err: {
						readOnly:    true
						description: "err is a stack of errors that occurred during processing of the request. Useful for debugging."
						type:        "string"
					}
				}
				required: [
					"code",
					"message",
				]
			}
			Script: {
				properties: {
					id: {
						readOnly: true
						type:     "string"
					}
					name: type:        "string"
					description: type: "string"
					orgID: type:       "string"
					script: {
						description: "script to be executed"
						type:        "string"
					}
					language: $ref: "#/components/schemas/ScriptLanguage"
					url: {
						type:        "string"
						description: "invocation endpoint address"
					}
					createdAt: {
						type:     "string"
						format:   "date-time"
						readOnly: true
					}
					updatedAt: {
						type:     "string"
						format:   "date-time"
						readOnly: true
					}
				}
				required: [
					"name",
					"orgID",
					"script",
				]
			}
			Scripts: {
				type: "object"
				properties: scripts: {
					type: "array"
					items: $ref: "#/components/schemas/Script"
				}
			}
			ScriptCreateRequest: {
				type: "object"
				properties: {
					name: {
						description: "The name of the script. The name must be unique within the organization."
						type:        "string"
					}
					description: type: "string"
					script: {
						description: "The script to execute."
						type:        "string"
					}
					language: $ref: "#/components/schemas/ScriptLanguage"
				}
				required: [
					"name",
					"script",
					"language",
					"description",
				]
			}
			ScriptUpdateRequest: {
				type: "object"
				properties: {
					name: type:        "string"
					description: type: "string"
					script: {
						description: "script is script to be executed"
						type:        "string"
					}
				}
			}
			ScriptHTTPResponseData: {
				description: "The data sent in the response body when a script is invoked by an HTTP request. User defined and dynamic."
				type:        "string"
			}
			ScriptInvocationParams: {
				type: "object"
				properties: params: type: "object"
			}
			ScriptLanguage: {
				type: "string"
				enum: ["flux"]
			}
		}
	}
}
