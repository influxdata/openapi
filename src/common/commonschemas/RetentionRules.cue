package commonschemas

RetentionRules: {
	type:        "array"
	description: "Rules to expire or retain data.  No rules means data never expires."
	items:       *RetentionRule.#Ref | RetentionRule
}
