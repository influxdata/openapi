package commonschemas

Organizations: {
	type: "object"
	properties: {
		links: Links.#Ref
		orgs: {
			type: "array"
			items: Organization.#Ref
		}
	}
}
