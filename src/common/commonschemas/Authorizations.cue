package commonschemas

Authorizations: {
	type: "object"
	properties: {
		links: {
			readOnly: true
			Links.#Ref
		}
		authorizations: {
			type: "array"
			items: Authorization.#Ref
		}
	}
}
