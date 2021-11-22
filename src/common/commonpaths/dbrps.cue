package commonpaths

import (
	"github.com/influxdata/openapi/src/common/commonparameters"
	"github.com/influxdata/openapi/src/common/commonschemas"
)

dbrps: {
	get: {
		operationId: "GetDBRPs"
		tags: [
			"DBRPs",
		]
		summary: "List database retention policy mappings"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:          "query"
			name:        "orgID"
			description: "Specifies the organization ID to filter on"
			schema: type: "string"
		}, {
			in:          "query"
			name:        "org"
			description: "Specifies the organization name to filter on"
			schema: type: "string"
		}, {
			in:          "query"
			name:        "id"
			description: "Specifies the mapping ID to filter on"
			schema: type: "string"
		}, {
			in:          "query"
			name:        "bucketID"
			description: "Specifies the bucket ID to filter on"
			schema: type: "string"
		}, {
			in:          "query"
			name:        "default"
			description: "Specifies filtering on default"
			schema: type: "boolean"
		}, {
			in:          "query"
			name:        "db"
			description: "Specifies the database to filter on"
			schema: type: "string"
		}, {
			in:          "query"
			name:        "rp"
			description: "Specifies the retention policy to filter on"
			schema: type: "string"
		}]
		responses: {
			"200": {
				description: "Success. Returns a list of database retention policy mappings."
				content: "application/json": schema: commonschemas.DBRPs.#Ref
			}
			"400": {
				description: "Bad request. The request has one or more invalid parameters."
				content: "application/json": schema: commonschemas.Error.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
	post: {
		operationId: "PostDBRP"
		tags: [
			"DBRPs",
		]
		summary: "Add a database retention policy mapping"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}]
		requestBody: {
			description: "The database retention policy mapping to add"
			required:    true
			content: "application/json": schema: commonschemas.DBRPCreate.#Ref
		}
		responses: {
			"201": {
				description: "Created. Returns the created database retention policy mapping."
				content: "application/json": schema: commonschemas.DBRP.#Ref
			}
			"400": {
				description: "Bad request. The mapping in the request has one or more invalid IDs."
				content: "application/json": schema: commonschemas.Error.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
}
