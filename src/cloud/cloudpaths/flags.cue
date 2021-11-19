package cloudpaths

flags: get: {
	tags: [
		"Public Flags",
	]
	summary: "Retrieve public/preauth feature flags"
	responses: {
		"200": {
			description: "Pre-authentication exposed feature flags"
			content: "application/json": schema: $ref: "../../common/schemas/Flags.yml"
		}
		default: {
			description: "unexpected error"
			$ref:        "../../common/responses/ServerError.yml"
		}
	}
}
