package contracts

import ( "github.com/influxdata/openapi/src/common/commonresponses"

	// The idea is that this file can contain invariants we want to assert about
	// our APIs, such as consistent error return types.
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
