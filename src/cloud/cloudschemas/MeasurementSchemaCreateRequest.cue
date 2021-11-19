package cloudschemas

MeasurementSchemaCreateRequest: {
	description: "Create a new measurement schema"
	type:        "object"
	example: {
		name: "cpu"
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
	}
	required: ["name", "columns"]
	properties: {
		name: type: "string"
		columns: {
			description: "An ordered collection of column definitions"

			type: "array"
			items: $ref: "./MeasurementSchemaColumn.yml"
		}
	}
}
