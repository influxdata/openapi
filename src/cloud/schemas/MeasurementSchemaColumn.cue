package schemas

MeasurementSchemaColumn: {
	description: "Definition of a measurement column"
	example: {
		name: "time"
		type: "timestamp"
	}
	type: "object"
	required: ["name", "type"]
	properties: {
		name: type:     "string"
		type: $ref:     "./ColumnSemanticType.yml"
		dataType: $ref: "./ColumnDataType.yml"
	}
}
