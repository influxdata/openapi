package old

datasourcesd: {
	openapi: "3.0.0"
	info: {
		title:   "Cloud Data Sources Service"
		version: "1.0"
	}
	servers: [{
		url: "/"
	}]
	paths: {
		"/datasources": {
			get: {
				operationId: "get-datasources"
				responses: "200": {
					description: "OK"
					content: "application/json": schema: {
						type: "array"
						items: $ref: "#/components/schemas/Datasource"
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
							endpoint: $ref: "#/components/schemas/ListenerEndpoint"
						}
					}
				}
				description: "Create a datasource with a specific plugin configuration"
				requestBody: content: "application/json": schema: {
					type: "object"
					properties: {
						name: type: "string"
						config: type: "object"
					}
				}
			}
		}
		"/datasources/{datasourceID}": {
			delete: {
				operationId: "delete-orgs-orgID-datasources-datasourceID"
				description: "Delete the datasource and stop the telegraf plugin"
				responses: "200": description: "OK"
			}
			get: {
				operationId: "get-orgs-orgID-datasources-datasourceID"
				responses: "200": {
					description: "OK"
					content: "application/json": schema: $ref: "#/components/schemas/Datasource"
				}
				description: "Get a datasource for this organization"
			}
		}
		"/webhooks/{token}": post: {
			summary:     "handler for incoming webhook posts from the web"
			operationId: "post-webhooks-token"
			description: "A post operation coming from the web. body could be anything. Requests will be routed to the right Datasource"
			responses: "200": description: "OK"
		}
	}
	components: schemas: {
		Datasource: {
			title:       "Datasource"
			type:        "object"
			description: "Data Source containing telegraf plugin name and configuration"
			properties: {
				id: {
					type:     "integer"
					readOnly: true
				}
				orgID: type: "string"
				name: type: "string"
				config: {
					type:        "object"
					description: "an object containing the configuration for the plugin"
				}
				createdBy: {
					type:     "string"
					readOnly: true
				}
				createdAt: {
					type:     "string"
					readOnly: true
				}
				state: {
					type: "string"
					enum: [
						"running",
						"paused",
					]
					readOnly: true
				}
			}
			required: [
				"orgID",
				"name",
			]
		}
		ListenerEndpoint: {
			title:       "ListenerEndpoint"
			type:        "object"
			description: "describes a route for an incoming request to a specific telegraf instance and port on a pod"
			properties: {
				id: type: "integer"
				orgID: type: "string"
				serviceID: type: "string"
				datasourceID: type: "string"
				externalURL: type: "string"
				internalIP: type: "string"
				internalPort: type: "integer"
			}
		}
		Service: {
			title:       "Service"
			type:        "object"
			description: "describes a telegraf instance we want to be running, maps 1:1 with k8s services, which should typically be backed by one pod. "
			properties: {
				id: type: "integer"
				name: type: "string"
				orgID: type: "string"
				datasourceID: type: "integer"
				nextFreePort: {
					type:        "integer"
					description: "keeps track of what ports are available to assign. incremented atomically"
				}
			}
			required: [
				"name",
				"orgID",
			]
		}
	}
}
