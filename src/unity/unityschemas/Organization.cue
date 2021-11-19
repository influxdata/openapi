package unityschemas

Organization: {
	type: "object"
	properties: {
		idpeId: {
			type:        "string"
			description: "idpe ID of the org"
		}
		id: {
			type:        "number"
			description: "quartz ID of the org"
		}
		name: {
			type:        "string"
			description: "name of the org"
		}
		region: {
			type:        "string"
			description: "region of the org"
		}
		provider: {
			type:        "string"
			description: "provider of the org"
		}
		date: {
			type:        "string"
			description: "date org was created"
		}
		account: $ref: "./RelatedAccount.yml"
	}
	required: ["account", "id", "idpeId", "region", "provider", "date"]
}
