package quartzschemas

TaskLimits: {
	description: "Task limits"
	type:        "object"
	properties: maxTasks: {
		description: "Number of tasks allowed"
		example:     5
		oneOf: [{
			$ref: "./RestrictedLimit.yml"
		}, {
			$ref: "./Unlimited.yml"
		}, {
			$ref: "./Limit.yml"
		}]
	}
}
