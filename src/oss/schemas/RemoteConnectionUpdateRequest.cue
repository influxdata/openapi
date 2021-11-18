package schemas

RemoteConnectionUpdateRequest: {
	type: "object"
	properties: {
		name: type: "string"
		description: type: "string"
		remoteURL: {
			type:   "string"
			format: "uri"
		}
		remoteAPIToken: type: "string"
		remoteOrgID: type: "string"
		allowInsecureTLS: {
			type:    "boolean"
			default: false
		}
	}
}
