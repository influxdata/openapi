package contracts

"svc-datasourcesd": {
	openapi: "3.0.0"
	info: {
		title:   "Cloud Data Sources Service"
		version: "1.0"
	}
	servers: [{
		url: "/"
	}]
	paths: {
		"/datasources": $ref:                "./svc/datasourcesd/paths/datasources.yml"
		"/datasources/{datasourceID}": $ref: "./svc/datasourcesd/paths/datasources-id.yml"
		"/webhooks/{token}": $ref:           "./svc/datasourcesd/paths/webhooks.yml"
	}
	components: schemas: {
		Datasource: $ref:       "./svc/datasourcesd/schemas/Datasource.yml"
		ListenerEndpoint: $ref: "./svc/datasourcesd/schemas/ListenerEndpoint.yml"
		Service: $ref:          "./svc/datasourcesd/schemas/Service.yml"
	}
}
