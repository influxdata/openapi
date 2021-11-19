package commonschemas

Dashboards: {
	type: "object"
	properties: {
		links: Links.#Ref
		dashboards: {
			type:  "array"
			items: Dashboard.#Ref
		}
	}
}
