package cloudschemas

MeasurementSchema: {
	description: "The schema definition for a single measurement"
	type:        "object"
	example: {
		id:       "1a3c5e7f9b0a8642"
		orgID:    "0a3c5e7f9b0a0001"
		bucketID: "ba3c5e7f9b0a0010"
		name:     "cpu"
		columns: [{
			name: "time"
			type: "timestamp"
		}, {
			name: "host"
			type: "tag"
		}, {
			name: "region"
			type: "tag"
		}, {
			name:     "usage_user"
			type:     "field"
			dataType: "float"
		}, {
			name:     "usage_user"
			type:     "field"
			dataType: "float"
		}]
		createdAt: "2021-01-21T00:48:40.993Z"
		updatedAt: "2021-01-21T00:48:40.993Z"
	}
	required: ["id", "name", "columns", "createdAt", "updatedAt"]
	properties: {
		id: {
			type:     "string"
			readOnly: true
		}
		orgID: {
			type:        "string"
			description: "ID of organization that the measurement schema is associated with."
		}
		bucketID: {
			type:        "string"
			description: "ID of the bucket that the measurement schema is associated with."
		}
		name: {
			type:     "string"
			nullable: false
		}
		columns: {
			description: "An ordered collection of column definitions"

			type:  "array"
			items: MeasurementSchemaColumn.#Ref
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
}
