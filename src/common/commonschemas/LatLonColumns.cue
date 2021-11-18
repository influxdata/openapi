package commonschemas

LatLonColumns: {
	description: "Object type to define lat/lon columns"
	type:        "object"
	required: ["lat", "lon"]
	properties: {
		lat: LatLonColumn.#Ref
		lon: LatLonColumn.#Ref
	}
}
