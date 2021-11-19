package annotationdpaths

import "github.com/influxdata/openapi/src/svc/annotationd/annotationdschemas"

import "github.com/influxdata/openapi/src/common/commonresponses"

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
				content: "application/json": schema: annotationdschemas.AnnotationEvent.#Ref
			}
			"400": commonresponses.ServerError.#Ref
			"401": commonresponses.ServerError.#Ref
			"404": commonresponses.ServerError.#Ref
			"500": commonresponses.ServerError.#Ref
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
			content: "application/json": schema: annotationdschemas.AnnotationCreate.#Ref
		}
		responses: {
			"200": {
				description: "The updated annotation"
				content: "application/json": schema: annotationdschemas.AnnotationEvent.#Ref
			}
			"400": commonresponses.ServerError.#Ref
			"401": commonresponses.ServerError.#Ref
			"404": commonresponses.ServerError.#Ref
			"500": commonresponses.ServerError.#Ref
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
			"204": commonresponses.NoContent.#Ref
			"400": commonresponses.ServerError.#Ref
			"401": commonresponses.ServerError.#Ref
			"500": commonresponses.ServerError.#Ref
		}
	}
}
