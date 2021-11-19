package annotationdschemas

AnnotationListFilter: allOf: [{
	BasicFilter.#Ref
}, {
	type: "object"
	properties: {
		stickerIncludes: {
			type: "object"
			additionalProperties: type: "string"
		}
		streamIncludes: {
			type: "array"
			items: type: "string"
		}
	}
}]
