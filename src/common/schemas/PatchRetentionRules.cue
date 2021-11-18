package schemas

PatchRetentionRules: {
	type:        "array"
	description: "Updates to rules to expire or retain data. No rules means no updates."
	items: $ref: "./PatchRetentionRule.yml"
}
