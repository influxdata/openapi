package invocablescriptsschemas

Script: {
	properties: {
		id: {
			readOnly: true
			type:     "string"
		}
		name: type: "string"
		description: type: "string"
		orgID: type: "string"
		script: {
			description: "script to be executed"
			type:        "string"
		}
		language: ScriptLanguage.#Ref
		url: {
			type:        "string"
			description: "invocation endpoint address"
		}
		createdAt: {
			type:     "string"
			format:   "date-time"
			readOnly: true
		}
		updatedAt: {
			type:     "string"
			format:   "date-time"
			readOnly: true
		}
	}
	required: ["name", "orgID", "script"]
}
