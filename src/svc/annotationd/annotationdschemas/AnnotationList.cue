package annotationdschemas

AnnotationList: {
	type: "array"
	items: {
		type: "object"
		properties: {
			stream: type: "string"
			annotations: {
				type: "array"
				// TODO why does openapi bundle produce different output
				// under different circumstances?
				items: *AnnotationResponse.#Ref | AnnotationResponse
			}
		}
	}
}
