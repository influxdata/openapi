package commonschemas

LatLonColumns: {
	description: "Object type to define lat/lon columns"
	type:        "object"
	required: ["lat", "lon"]
	properties: {
		lat: $ref: "./LatLonColumn.yml"
		lon: $ref: "./LatLonColumn.yml"
	}
}
