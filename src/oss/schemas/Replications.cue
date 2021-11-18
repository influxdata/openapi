package schemas

Replications: {
	type: "object"
	properties: replications: {
		type: "array"
		items: $ref: "./Replication.yml"
	}
}
