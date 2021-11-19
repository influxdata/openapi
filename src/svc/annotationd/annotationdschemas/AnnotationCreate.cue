package annotationdschemas

AnnotationCreate: allOf: [{
	$ref: "../schemas/Annotation.yml"
}, {
	type: "object"
	properties: stream: type: "string"
}]
