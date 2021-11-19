package commonschemas

GeoCircleViewLayer: allOf: [{
	GeoViewLayerProperties.#Ref
}, {
	type: "object"
	required: ["radiusField", "radiusDimension", "colorField", "colorDimension", "colors"]
	properties: {
		radiusField: {
			type:        "string"
			description: "Radius field"
		}
		radiusDimension: Axis.#Ref
		colorField: {
			type:        "string"
			description: "Circle color field"
		}
		colorDimension: Axis.#Ref
		colors: {
			description: "Colors define color encoding of data into a visualization"
			type:        "array"
			items:       DashboardColor.#Ref
		}
		radius: {
			description: "Maximum radius size in pixels"
			type:        "integer"
		}
		interpolateColors: {
			description: "Interpolate circle color based on displayed value"
			type:        "boolean"
		}
	}
}]
