package annotationdschemas

StreamListFilter: allOf: [{
	BasicFilter.#Ref
}, {
	type: "object"
	properties: {
		streamIncludes: {
			type: "array"
			items: type: "string"
		}
		allStreams: type: "boolean"
	}
}]
