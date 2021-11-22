package cloudschemas

LimitStatuses: {
	type: "object"
	properties: {
		read:        LimitStatus.#Ref
		write:       LimitStatus.#Ref
		cardinality: LimitStatus.#Ref
	}
	required: ["read", "write", "cardinality"]
}
