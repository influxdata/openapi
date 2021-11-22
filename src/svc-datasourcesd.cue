package contracts

import (
	"github.com/influxdata/openapi/src/svc/datasourcesd/datasourcesdschemas"

	"github.com/influxdata/openapi/src/svc/datasourcesd/datasourcesdpaths"

)

all: "svc-datasourcesd": {
	openapi: "3.0.0"
	info: {
		title:   "Cloud Data Sources Service"
		version: "1.0"
	}
	servers: [{
		url: "/"
		// TODO the above should be like this in fact.
		// url: "/api/v2/datasources"
	}]
	paths: {
		"/datasources":                datasourcesdpaths.datasources
		"/datasources/{datasourceID}": datasourcesdpaths."datasources-id"
		"/webhooks/{token}":           datasourcesdpaths.webhooks
	}
	components: schemas: {
		Datasource:       datasourcesdschemas.Datasource
		ListenerEndpoint: datasourcesdschemas.ListenerEndpoint
		Service:          datasourcesdschemas.Service
	}
}
