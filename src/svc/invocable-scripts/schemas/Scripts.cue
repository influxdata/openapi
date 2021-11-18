package schemas

Scripts: {
	type: "object"
	properties: scripts: {
		type: "array"
		items: $ref: "./Script.yml"
	}
}
