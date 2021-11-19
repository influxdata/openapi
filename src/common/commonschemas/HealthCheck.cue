package commonschemas

HealthCheck: {
	type: "object"
	required: [
		"name",
		"status",
	]
	properties: {
		name: type:    "string"
		message: type: "string"
		checks: {
			type:  "array"
			items: HealthCheck.#Ref
		}
		status: HealthCheckStatus
		version: type: "string"
		commit: type:  "string"
	}
}
