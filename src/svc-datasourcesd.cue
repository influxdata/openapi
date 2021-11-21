package contracts

import "github.com/influxdata/openapi/src/svc/datasourcesd/datasourcesdschemas"

import "github.com/influxdata/openapi/src/svc/datasourcesd/datasourcesdpaths"

"svc-datasourcesd": {
	openapi: "3.0.0"
	info: {
		title:   "Cloud Data Sources Service"
		version: "1.0"
	}
	servers: [{
		url: "/api/v2/datasources"
	}]
	paths: {
		"/datasources":                datasourcesdpaths.datasources.#Ref
		"/datasources/{datasourceID}": datasourcesdpaths."datasources-id".#Ref
		"/webhooks/{token}":           datasourcesdpaths.webhooks.#Ref
	}
	components: schemas: {
		Datasource:       datasourcesdschemas.Datasource.#Ref
		ListenerEndpoint: datasourcesdschemas.ListenerEndpoint.#Ref
		Service:          datasourcesdschemas.Service.#Ref
	}
}
