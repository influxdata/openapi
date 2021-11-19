package annotationdschemas

AnnotationEvent: allOf: [{
	Annotation.#Ref
}, {
	type: "object"
	properties: {
		stream: type: "string"
		id: type:     "string"
	}
}]
