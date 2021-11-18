package schemas

ScriptUpdateRequest: {
	type: "object"
	properties: {
		name: type: "string"
		description: type: "string"
		script: {
			description: "script is script to be executed"
			type:        "string"
		}
	}
}
