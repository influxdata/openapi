package commonschemas

GeoPointMapViewLayer: allOf: [{
	GeoViewLayerProperties.#Ref
}, {
	type: "object"
	required: ["colorField", "colorDimension", "colors"]
	properties: {
		colorField: {
			type:        "string"
			description: "Marker color field"
		}
		colorDimension: Axis.#Ref
		colors: {
			description: "Colors define color encoding of data into a visualization"
			type:        "array"
			items: DashboardColor.#Ref
		}
		isClustered: {
			description: "Cluster close markers together"
			type:        "boolean"
		}
		tooltipColumns: {
			description: "An array for which columns to display in tooltip"
			type:        "array"
			items: type: "string"
		}
	}
}]
