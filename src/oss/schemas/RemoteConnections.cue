package schemas

RemoteConnections: {
	type: "object"
	properties: {
		// TODO(danmoran): Add pagination / links?
		remotes: {
			type: "array"
			items: $ref: "./RemoteConnection.yml"
		}
	}
}
