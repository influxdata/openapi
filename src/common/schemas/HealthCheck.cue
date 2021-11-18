package schemas

HealthCheck: {
	type: "object"
	required: [
		"name",
		"status",
	]
	properties: {
		name: type: "string"
		message: type: "string"
		checks: {
			type: "array"
			items: $ref: "./HealthCheck.yml"
		}
		status: $ref: "./HealthCheckStatus.yml"
		version: type: "string"
		commit: type: "string"
	}
}
