package paths

orgs_orgID_limits_status: get: {
	tags: [
		"Limits",
	]
	summary: "Get current limit status for an org"
	parameters: [{
		in:   "path"
		name: "orgID"
		schema: type: "string"
		required:    true
		description: "The identifier of the organization."
	}]
	responses: {
		"200": {
			description: "Current limit status"
			content: "application/json": schema: $ref: "../schemas/LimitStatuses.yml"
		}
		default: {
			description: "unexpected error"
			$ref:        "../../common/responses/ServerError.yml"
		}
	}
}
