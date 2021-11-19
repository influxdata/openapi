package annotationdschemas

AnnotationEvent: allOf: [{
	$ref: "../schemas/Annotation.yml"
}, {
	type: "object"
	properties: {
		stream: type: "string"
		id: type:     "string"
	}
}]
