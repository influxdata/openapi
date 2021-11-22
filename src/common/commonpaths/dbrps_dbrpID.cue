package commonpaths

import (
	"github.com/influxdata/openapi/src/common/commonparameters"

	"github.com/influxdata/openapi/src/common/commonschemas"

)

dbrps_dbrpID: {
	get: {
		operationId: "GetDBRPsID"
		tags: [
			"DBRPs",
		]
		summary: "Retrieve a database retention policy mapping"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:          "query"
			name:        "orgID"
			description: "Specifies the organization ID of the mapping"
			schema: type: "string"
		}, {
			in:          "query"
			name:        "org"
			description: "Specifies the organization name of the mapping"
			schema: type: "string"
		}, {
			in:   "path"
			name: "dbrpID"
			schema: type: "string"
			required:    true
			description: "The database retention policy mapping ID"
		}]
		responses: {
			"200": {
				description: "The database retention policy requested"
				content: "application/json": schema: commonschemas.DBRPGet.#Ref
			}
			"400": {
				description: "if any of the IDs passed is invalid"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
	patch: {
		operationId: "PatchDBRPID"
		tags: [
			"DBRPs",
		]
		summary: "Update a database retention policy mapping"
		requestBody: {
			description: "Database retention policy update to apply"
			required:    true
			content: "application/json": schema: commonschemas.DBRPUpdate.#Ref
		}
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:          "query"
			name:        "orgID"
			description: "Specifies the organization ID of the mapping"
			schema: type: "string"
		}, {
			in:          "query"
			name:        "org"
			description: "Specifies the organization name of the mapping"
			schema: type: "string"
		}, {
			in:   "path"
			name: "dbrpID"
			schema: type: "string"
			required:    true
			description: "The database retention policy mapping."
		}]
		responses: {
			"200": {
				description: "An updated mapping"
				content: "application/json": schema: commonschemas.DBRPGet.#Ref
			}
			"404": {
				description: "The mapping was not found"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
			"400": {
				description: "if any of the IDs passed is invalid"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
	delete: {
		operationId: "DeleteDBRPID"
		tags: [
			"DBRPs",
		]
		summary: "Delete a database retention policy"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:          "query"
			name:        "orgID"
			description: "Specifies the organization ID of the mapping"
			schema: type: "string"
		}, {
			in:          "query"
			name:        "org"
			description: "Specifies the organization name of the mapping"
			schema: type: "string"
		}, {
			in:   "path"
			name: "dbrpID"
			schema: type: "string"
			required:    true
			description: "The database retention policy mapping"
		}]
		responses: {
			"204": description: "Delete has been accepted"
			"400": {
				description: "if any of the IDs passed is invalid"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
}
