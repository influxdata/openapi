package commonschemas

GeoViewProperties: {
	type: "object"
	required: ["type", "shape", "queries", "note", "showNoteWhenEmpty", "center", "zoom", "allowPanAndZoom", "detectCoordinateFields", "layers"]
	properties: {
		type: {
			type: "string"
			enum: ["geo"]
		}
		queries: {
			type: "array"
			items: DashboardQuery.#Ref
		}
		shape: {
			type: "string"
			enum: ["chronograf-v2"]
		}
		center: {
			description: "Coordinates of the center of the map"
			type:        "object"
			required: ["lat", "lon"]
			properties: {
				lat: {
					description: "Latitude of the center of the map"
					type:        "number"
					format:      "double"
				}
				lon: {
					description: "Longitude of the center of the map"
					type:        "number"
					format:      "double"
				}
			}
		}
		zoom: {
			description: "Zoom level used for initial display of the map"
			type:        "number"
			format:      "double"
			minimum:     1
			maximum:     28
		}
		allowPanAndZoom: {
			description: "If true, map zoom and pan controls are enabled on the dashboard view"
			type:        "boolean"
			default:     true
		}
		detectCoordinateFields: {
			description: "If true, search results get automatically regroupped so that lon,lat and value are treated as columns"
			type:        "boolean"
			default:     true
		}
		useS2CellID: {
			description: "If true, S2 column is used to calculate lat/lon"
			type:        "boolean"
		}
		s2Column: {
			description: "String to define the column"
			type:        "string"
		}
		latLonColumns: LatLonColumns.#Ref
		mapStyle: {
			description: "Define map type - regular, satellite etc."
			type:        "string"
		}
		note: type: "string"
		showNoteWhenEmpty: {
			description: "If true, will display note when empty"
			type:        "boolean"
		}
		colors: {
			description: "Colors define color encoding of data into a visualization"
			type:        "array"
			items: DashboardColor.#Ref
		}
		layers: {
			description: "List of individual layers shown in the map"
			type:        "array"
			items: GeoViewLayer.#Ref
		}
	}
}
