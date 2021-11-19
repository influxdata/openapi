package commonschemas

GeoHeatMapViewLayer: allOf: [{
	GeoViewLayerProperties.#Ref
}, {
	type: "object"
	required: ["intensityField", "intensityDimension", "radius", "blur", "colors"]
	properties: {
		intensityField: {
			type:        "string"
			description: "Intensity field"
		}
		intensityDimension: Axis.#Ref
		radius: {
			description: "Radius size in pixels"
			type:        "integer"
		}
		blur: {
			description: "Blur for heatmap points"
			type:        "integer"
		}
		colors: {
			description: "Colors define color encoding of data into a visualization"
			type:        "array"
			items:       DashboardColor.#Ref
		}
	}
}]
