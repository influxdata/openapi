package paths

annotation: {
	get: {
		tags: [
			"Annotations",
		]
		summary: "Retrieve an annotation"
		parameters: [{
			in:          "path"
			name:        "annotationID"
			description: "The identifier of the annotation."
			required:    true
			schema: type: "string"
		}]
		responses: {
			"200": {
				description: "The annotation details"
				content: "application/json": schema: $ref: "../schemas/AnnotationEvent.yml"
			}
			"400": $ref: "../../../common/responses/ServerError.yml"
			"401": $ref: "../../../common/responses/ServerError.yml"
			"404": $ref: "../../../common/responses/ServerError.yml"
			"500": $ref: "../../../common/responses/ServerError.yml"
		}
	}
	put: {
		tags: [
			"Annotations",
		]
		operationId: "updateAnnotation"
		summary:     "Update an annotation"
		parameters: [{
			in:          "path"
			name:        "annotationID"
			description: "The identifier of the annotation."
			required:    true
			schema: type: "string"
		}]
		requestBody: {
			description: "Annotation to store"
			content: "application/json": schema: $ref: "../schemas/AnnotationCreate.yml"
		}
		responses: {
			"200": {
				description: "The updated annotation"
				content: "application/json": schema: $ref: "../schemas/AnnotationEvent.yml"
			}
			"400": $ref: "../../../common/responses/ServerError.yml"
			"401": $ref: "../../../common/responses/ServerError.yml"
			"404": $ref: "../../../common/responses/ServerError.yml"
			"500": $ref: "../../../common/responses/ServerError.yml"
		}
	}
	delete: {
		tags: [
			"Annotations",
		]
		operationId: "deleteAnnotation"
		summary:     "Delete an annotation by ID"
		parameters: [{
			in:          "path"
			name:        "annotationID"
			description: "The identifier of the annotation."
			required:    true
			schema: type: "string"
		}]
		responses: {
			"204": $ref: "../../../common/responses/NoContent.yml"
			"400": $ref: "../../../common/responses/ServerError.yml"
			"401": $ref: "../../../common/responses/ServerError.yml"
			"500": $ref: "../../../common/responses/ServerError.yml"
		}
	}
}
