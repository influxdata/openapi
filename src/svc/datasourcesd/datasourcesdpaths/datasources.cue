package datasourcesdpaths

import (
	"github.com/influxdata/openapi/src/svc/datasourcesd/datasourcesdschemas"

)

datasources: {
	get: {
		operationId: "get-datasources"
		responses: "200": {
			description: "OK"
			content: "application/json": schema: {
				type:  "array"
				items: datasourcesdschemas.Datasource.#Ref
			}
		}
		description: "Get a list of datasources for this organization"
	}
	post: {
		operationId: "post-datasources"
		responses: "200": {
			description: "OK"
			content: "application/json": schema: {
				type: "object"
				properties: {
					id: type: "string"
					endpoint: datasourcesdschemas.ListenerEndpoint.#Ref
				}
			}
		}
		description: "Create a datasource with a specific plugin configuration"
		requestBody: content: "application/json": schema: {
			type: "object"
			properties: {
				name: type:   "string"
				config: type: "object"
			}
		}
	}
}
