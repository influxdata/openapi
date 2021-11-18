package commonschemas

LatLonColumn: {
	description: "Object type for key and column definitions"
	type:        "object"
	required: ["key", "column"]
	properties: {
		key: {
			description: "Key to determine whether the column is tag/field"
			type:        "string"
		}
		column: {
			description: "Column to look up Lat/Lon"
			type:        "string"
		}
	}
}
