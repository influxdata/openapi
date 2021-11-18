package schemas

LimitEvents: {
	type: "object"
	properties: {
		links: $ref: "../../common/schemas/Links.yml"
		events: {
			type: "array"
			items: $ref: "./LimitEvent.yml"
		}
	}
}
