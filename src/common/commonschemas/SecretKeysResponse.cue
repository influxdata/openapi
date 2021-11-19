package commonschemas

SecretKeysResponse: allOf: [{
	SecretKeys.#Ref
}, {
	type: "object"
	properties: links: {
		readOnly: true
		type:     "object"
		properties: {
			self: type: "string"
			org: type:  "string"
		}
	}
}]
