package contracts

import "github.com/influxdata/openapi/src/svc/mapsd/mapsdschemas"

import "github.com/influxdata/openapi/src/svc/mapsd/mapsdpaths"

import "github.com/influxdata/openapi/src/common/commonschemas"

import "github.com/influxdata/openapi/src/common/commonresponses"

"svc-mapsd": {
	openapi: "3.0.0"
	info: {
		title:   "Maps service"
		version: "0.1.0"
	}
	servers: [{
		url: "/api/v1"
	}]
	paths: "/mapToken": mapsdpaths.mapToken.#Ref
	components: {
		schemas: {
			Token: mapsdschemas.Token.#Ref
			Error: commonschemas.Error.#Ref
		}
		responses: ServerError: commonresponses.ServerError.#Ref
	}
}
