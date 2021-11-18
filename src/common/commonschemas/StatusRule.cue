package commonschemas

StatusRule: {
	type: "object"
	properties: {
		currentLevel: RuleStatusLevel.#Ref
		previousLevel: RuleStatusLevel.#Ref
		count: type: "integer"
		period: type: "string"
	}
}
