package contracts

import "github.com/influxdata/openapi/src/common"

"common": {
	openapi: "3.0.0"
	info: {
		title:   "Influx Common API"
		version: "2.0.1"
	}
	servers: [{
		url: "/api/v2"
	}]
	paths: common.#Paths
	components: {
		parameters: common.#Parameters
		schemas: common.#Schemas
		responses: ServerError: $ref: "./common/responses/ServerError.yml"
	}
}
