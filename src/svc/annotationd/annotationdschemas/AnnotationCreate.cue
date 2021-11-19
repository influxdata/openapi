package annotationdschemas

AnnotationCreate: allOf: [{
	Annotation.#Ref
}, {
	type: "object"
	properties: stream: type: "string"
}]
