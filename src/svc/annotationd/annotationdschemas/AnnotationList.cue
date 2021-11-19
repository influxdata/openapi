package annotationdschemas

AnnotationList: {
	type: "array"
	items: {
		type: "object"
		properties: {
			stream: type: "string"
			annotations: {
				type: "array"
				items: AnnotationResponse.#Ref
			}
		}
	}
}
