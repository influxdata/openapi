package schemas

ColumnSemanticType: {
	type:     "string"
	nullable: false
	enum: [
		"timestamp",
		"tag",
		"field",
	]
}
