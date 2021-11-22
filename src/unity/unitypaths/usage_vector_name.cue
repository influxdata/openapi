package unitypaths

import (
	"github.com/influxdata/openapi/src/unity/unityschemas"
	"github.com/influxdata/openapi/src/common/commonresponses"
)
usage_vector_name: get: {
	operationId: "GetUsagetype"
	tags: [
		"Usage",
	]
	parameters: [{
		in:       "path"
		name:     "vector_name"
		required: true
		schema: unityschemas.VectorName.#Ref
		description: "The name of the UsageVector to query."
		example:     "reads_gb"
	}, {
		in:   "query"
		name: "range"
		schema: unityschemas.TimeRange.#Ref
	}]
	responses: {
		"200": {
			description: "Usage history for account"
			content: "application/csv": schema: {
				type: "string"
				example: """
					#group,false,false,true,false,false
					#datatype,string,long,string,dateTime:RFC3339,long
					#default,reads_gb,,,,
					,result,table,_field,_time,_value
					,,0,reads_gb,2021-01-13T22:05:00Z,120

					"""
			}
		}

		"400": {
			description: "Invalid query param name - Bad request"
			commonresponses.ServerError.#Ref
		}
		"401": {
			description: "Unauthorized"
			commonresponses.ServerError.#Ref
		}
		"404": {
			description: "Invalid vector_name or start or User/Org not found"
			commonresponses.ServerError.#Ref
		}
		default: {
			description: "Unexpected error"
			commonresponses.ServerError.#Ref
		}
	}
}
