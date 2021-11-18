package commonschemas

GeoViewLayer: {
	type: "object"
	oneOf: [{
		GeoCircleViewLayer.#Ref
	}, {
		GeoHeatMapViewLayer.#Ref
	}, {
		GeoPointMapViewLayer.#Ref
	}, {
		GeoTrackMapViewLayer.#Ref
	}]
}
