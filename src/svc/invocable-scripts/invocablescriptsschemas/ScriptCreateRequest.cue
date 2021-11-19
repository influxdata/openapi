package invocablescriptsschemas

ScriptCreateRequest: {
	type: "object"
	properties: {
		name: {
			description: "The name of the script. The name must be unique within the organization."
			type:        "string"
		}
		description: type: "string"
		script: {
			description: "The script to execute."
			type:        "string"
		}
		language: ScriptLanguage.#Ref
	}
	required: ["name", "script", "language", "description"]
}
