package contracts

import (
	"github.com/influxdata/openapi/src/svc/mapsd/mapsdschemas"

	"github.com/influxdata/openapi/src/svc/mapsd/mapsdpaths"

	"github.com/influxdata/openapi/src/common/commonschemas"

	"github.com/influxdata/openapi/src/common/commonresponses"

)

all: "svc-mapsd": {
	openapi: "3.0.0"
	info: {
		title:   "Maps service"
		version: "0.1.0"
	}
	servers: [{
		url: "/api/v2/maps"
	}]
	paths: "/mapToken": mapsdpaths.mapToken
	components: {
		schemas: {
			Token: mapsdschemas.Token
			Error: commonschemas.Error
		}
		responses: ServerError: commonresponses.ServerError
	}
}
