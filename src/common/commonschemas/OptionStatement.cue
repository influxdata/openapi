package commonschemas

OptionStatement: {
	description: "A single variable declaration"
	type:        "object"
	properties: {
		type: $ref: "./NodeType.yml"
		assignment: $ref: "./VariableOrMemberAssignment.yml"
	}
}
