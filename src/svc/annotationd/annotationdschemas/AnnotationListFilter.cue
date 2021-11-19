package annotationdschemas

AnnotationListFilter: allOf: [{
	$ref: "../schemas/BasicFilter.yml"
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
