package cloudpaths

import (
	"github.com/influxdata/openapi/src/common/commonschemas"

	"github.com/influxdata/openapi/src/cloud/cloudschemas"

)

measurements_measurementID: {
	summary: "Bucket Schema"
	get: {
		summary:     "Retrieve measurement schema information"
		operationId: "getMeasurementSchema"
		parameters: [{
			in:          "query"
			name:        "org"
			description: "The name of the organization."
			schema: type: "string"
		}, {
			in:          "query"
			name:        "orgID"
			description: "The identifier of the organization."
			schema: type: "string"
		}, {
			in:          "path"
			name:        "bucketID"
			description: "The identifier of the bucket."
			schema: type: "string"
			required: true
		}, {
			in:          "path"
			name:        "measurementID"
			description: "The identifier of the measurement."
			schema: type: "string"
			required: true
		}]
		tags: [
			"Bucket Schemas",
		]
		responses: "200": {
			description: "Schema definition for a single measurement"
			headers: ETag: {
				description: "The current version of the measurement schema"
				schema: type: "string"
			}

			content: "application/json": schema: cloudschemas.MeasurementSchema.#Ref
		}
	}
	patch: {
		summary:     "Update a measurement schema"
		operationId: "updateMeasurementSchema"
		parameters: [{
			in:          "query"
			name:        "org"
			description: "The name of the organization."
			schema: type: "string"
		}, {
			in:          "query"
			name:        "orgID"
			description: "The identifier of the organization."
			schema: type: "string"
		}, {
			in:          "path"
			name:        "bucketID"
			description: "The identifier of the bucket."
			schema: type: "string"
			required: true
		}, {
			in:          "path"
			name:        "measurementID"
			description: "The identifier of the measurement."
			schema: type: "string"
			required: true
		}]
		tags: [
			"Bucket Schemas",
		]
		requestBody: content: "application/json": schema: cloudschemas.MeasurementSchemaUpdateRequest.#Ref
		responses: {
			"200": {
				description: "The updated measurement schema"
				content: "application/json": schema: cloudschemas.MeasurementSchema.#Ref
			}
			"400": {
				description: "Client error updating measurement schema"
				content: "application/json": {
					examples: missingColumnsExample: {
						summary:     "Deleted columns"
						description: "The error returned when the request body does not contain all the columns from the source."

						value: {
							code:    "invalid"
							message: "Unable to delete columns from schema"
						}
					}
					schema: commonschemas.Error.#Ref
				}
			}
		}
	}
}
