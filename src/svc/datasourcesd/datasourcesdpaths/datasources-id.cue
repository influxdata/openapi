package datasourcesdpaths

import "github.com/influxdata/openapi/src/svc/datasourcesd/datasourcesdschemas"

"datasources-id": {
	delete: {
		operationId: "delete-orgs-orgID-datasources-datasourceID"
		description: "Delete the datasource and stop the telegraf plugin"
		responses: "200": description: "OK"
	}
	get: {
		operationId: "get-orgs-orgID-datasources-datasourceID"
		responses: "200": {
			description: "OK"
			content: "application/json": schema: datasourcesdschemas.Datasource.#Ref
		}
		description: "Get a datasource for this organization"
	}
}
