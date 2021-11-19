package datasourcesdschemas

ListenerEndpoint: {
	title:       "ListenerEndpoint"
	type:        "object"
	description: "describes a route for an incoming request to a specific telegraf instance and port on a pod"
	properties: {
		id: type:           "integer"
		orgID: type:        "string"
		serviceID: type:    "string"
		datasourceID: type: "string"
		externalURL: type:  "string"
		internalIP: type:   "string"
		internalPort: type: "integer"
	}
}
