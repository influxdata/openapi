package mapsdpaths

import "github.com/influxdata/openapi/src/svc/mapsd/mapsdschemas"

import "github.com/influxdata/openapi/src/common/commonresponses"

mapToken: get: {
	operationId: "getMapboxToken"
	responses: {
		"200": {
			description: "A temp token for Mapbox"
			content: "application/json": schema: mapsdschemas.Token.#Ref
		}
		"401": commonresponses.ServerError.#Ref
		"500": commonresponses.ServerError.#Ref
		default: commonresponses.ServerError.#Ref
	}
}
