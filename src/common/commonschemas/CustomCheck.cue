package commonschemas

CustomCheck: allOf: [{
	CheckBase.#Ref
}, {
	type: "object"
	properties: type: {
		type: "string"
		enum: ["custom"]
	}
	required: ["type"]
}]
