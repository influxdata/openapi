package schemas

Authorizations: {
	type: "object"
	properties: {
		links: {
			readOnly: true
			$ref:     "../../common/schemas/Links.yml"
		}
		authorizations: {
			type: "array"
			items: $ref: "./Authorization.yml"
		}
	}
}
