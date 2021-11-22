package contracts

import (
	"github.com/influxdata/openapi/src/common/commonresponses"

)

import commonpkg "github.com/influxdata/openapi/src/common"

all: common: {
	let common1 = commonpkg & {
		#DocsURL: #CommonDocsURL
	}
	openapi: "3.0.0"
	info: {
		title:   "Influx Common API"
		version: "2.0.1"
	}
	servers: [{
		url: "/api/v2"
	}]
	paths: common1.#Paths
	components: {
		parameters: common1.#Parameters
		schemas:    common1.#Schemas
		responses: ServerError: commonresponses.ServerError
	}
}
