package commonschemas

DictItem: {
	description: "A key/value pair in a dictionary"
	type:        "object"
	properties: {
		type: NodeType.#Ref
		key:  Expression.#Ref
		val:  Expression.#Ref
	}
}
