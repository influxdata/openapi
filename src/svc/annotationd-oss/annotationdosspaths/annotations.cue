package annotationdosspaths

import "github.com/influxdata/openapi/src/svc/annotationd/annotationdschemas"

import "github.com/influxdata/openapi/src/svc/annotationd/annotationdparameters"

import "github.com/influxdata/openapi/src/common/commonresponses"

annotations: {
	post: {
		tags: [
			"Annotations",
		]
		operationId: "createAnnotations"
		summary:     "Create annotations"
		parameters: [{
			name: "orgID"
			in:   "query"
			schema: type: "string"
		}]
		requestBody: {
			description: "Annotations to create"
			content: "application/json": schema: annotationdschemas.AnnotationCreateList.#Ref
		}
		responses: {
			"200": {
				description: "Annotations created"
				content: "application/json": schema: annotationdschemas.AnnotationEventList.#Ref
			}
			"204": commonresponses.NoContent.#Ref
			"400": commonresponses.ServerError.#Ref
			"401": commonresponses.ServerError.#Ref
			"500": commonresponses.ServerError.#Ref
		}
	}
	get: {
		tags: [
			"Annotations",
		]
		operationId: "listAnnotations"
		summary:     "List annotations"
		parameters: [{
			annotationdparameters.AnnotationListFilter.#Ref
		}, {
			name: "orgID"
			in:   "query"
			schema: type: "string"
		}]
		responses: {
			"200": {
				description: "Optionally filtered list of annotations"
				content: "application/json": schema: annotationdschemas.AnnotationList.#Ref
			}
			"400": commonresponses.ServerError.#Ref
			"401": commonresponses.ServerError.#Ref
			"500": commonresponses.ServerError.#Ref
		}
	}
	delete: {
		tags: [
			"Annotations",
		]
		operationId: "deleteAnnotations"
		summary:     "Delete annotation"
		parameters: [{
			annotationdparameters.AnnotationDeleteFilter.#Ref
		}, {
			name: "orgID"
			in:   "query"
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
