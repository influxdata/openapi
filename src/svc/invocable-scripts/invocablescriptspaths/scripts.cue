package invocablescriptspaths

import "github.com/influxdata/openapi/src/svc/invocable-scripts/invocablescriptsschemas"

import "github.com/influxdata/openapi/src/common/commonresponses"

scripts: {
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
				content: "application/json": schema: invocablescriptsschemas.Scripts.#Ref
			}
			default: {
				description: "Unexpected error"
				commonresponses.ServerError.#Ref
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
			content: "application/json": schema: invocablescriptsschemas.ScriptCreateRequest.#Ref
		}
		responses: {
			"201": {
				description: "The created script."
				content: "application/json": schema: invocablescriptsschemas.Script.#Ref
			}
			default: {
				description: "Unexpected error"
				commonresponses.ServerError.#Ref
			}
		}
	}
}
