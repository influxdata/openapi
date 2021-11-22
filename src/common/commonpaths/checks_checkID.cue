package commonpaths

import (
	"github.com/influxdata/openapi/src/common/commonparameters"
	"github.com/influxdata/openapi/src/common/commonschemas"
)

checks_checkID: {
	get: {
		operationId: "GetChecksID"
		tags: [
			"Checks",
		]
		summary: "Retrieve a check"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "checkID"
			schema: type: "string"
			required:    true
			description: "The check ID."
		}]
		responses: {
			"200": {
				description: "The check requested"
				content: "application/json": schema: commonschemas.Check.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
	put: {
		operationId: "PutChecksID"
		tags: [
			"Checks",
		]
		summary: "Update a check"
		requestBody: {
			description: "Check update to apply"
			required:    true
			content: "application/json": schema: commonschemas.Check.#Ref
		}
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "checkID"
			schema: type: "string"
			required:    true
			description: "The check ID."
		}]
		responses: {
			"200": {
				description: "An updated check"
				content: "application/json": schema: commonschemas.Check.#Ref
			}
			"404": {
				description: "The check was not found"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
	patch: {
		operationId: "PatchChecksID"
		tags: [
			"Checks",
		]
		summary: "Update a check"
		requestBody: {
			description: "Check update to apply"
			required:    true
			content: "application/json": schema: commonschemas.CheckPatch.#Ref
		}
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "checkID"
			schema: type: "string"
			required:    true
			description: "The check ID."
		}]
		responses: {
			"200": {
				description: "An updated check"
				content: "application/json": schema: commonschemas.Check.#Ref
			}
			"404": {
				description: "The check was not found"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
	delete: {
		operationId: "DeleteChecksID"
		tags: [
			"Checks",
		]
		summary: "Delete a check"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "checkID"
			schema: type: "string"
			required:    true
			description: "The check ID."
		}]
		responses: {
			"204": description: "Delete has been accepted"
			"404": {
				description: "The check was not found"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
}
