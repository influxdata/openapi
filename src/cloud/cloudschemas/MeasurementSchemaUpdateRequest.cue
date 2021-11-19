package cloudschemas

MeasurementSchemaUpdateRequest: {
	description: "Update an existing measurement schema"
	type:        "object"
	example: columns: [{
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
	required: ["columns"]
	properties: columns: {
		description: "An ordered collection of column definitions"

		type: "array"
		items: MeasurementSchemaColumn.#Ref
	}
}
