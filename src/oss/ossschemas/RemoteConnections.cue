package ossschemas

RemoteConnections: {
	type: "object"
	properties: {
		// TODO(danmoran): Add pagination / links?
		remotes: {
			type:  "array"
			items: RemoteConnection.#Ref
		}
	}
}
