package schemas

DBRPUpdate: properties: {
	retention_policy: {
		type:        "string"
		description: "InfluxDB v1 retention policy"
	}
	default: type: "boolean"
}
