package invocablescriptspaths

import (
	"github.com/influxdata/openapi/src/svc/invocable-scripts/invocablescriptsschemas"

	"github.com/influxdata/openapi/src/common/commonresponses"

)

scripts_scriptID: {
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
				content: "application/json": schema: invocablescriptsschemas.Script.#Ref
			}
			default: {
				description: "Unexpected error"
				commonresponses.ServerError.#Ref
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
			content: "application/json": schema: invocablescriptsschemas.ScriptUpdateRequest.#Ref
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
				content: "application/json": schema: invocablescriptsschemas.Script.#Ref
			}
			default: {
				description: "Unexpected error"
				commonresponses.ServerError.#Ref
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
				commonresponses.ServerError.#Ref
			}
		}
	}
}
