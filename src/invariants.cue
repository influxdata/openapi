package contracts

import ( "github.com/influxdata/openapi/src/common/commonresponses"

	// The idea is that this file can contain invariants we want to assert about
	// our APIs, such as consistent error return types.
)

#Invariants: {
	paths: [string]: [string]: responses: default: commonresponses.ServerError.#Ref
}
