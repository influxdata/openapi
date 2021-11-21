package contracts

// The idea is that this file can contain invariants we want to assert about
// our APIs, such as consistent error return types.

import (
	"github.com/influxdata/openapi/src/common/commonresponses"
	"github.com/influxdata/openapi/src/old"
)

#Method: "post" | "get" | "put" | "delete" | "patch"

#Invariants: {
	paths: [string]: {
		[#Method]: {
			responses: {
				default: commonresponses.ServerError.#Ref | commonresponses.ServerError
				...
			}
			...
		}
		...
	}
	...
}

#All: all
#Old: old

#Both: #All & #Old
