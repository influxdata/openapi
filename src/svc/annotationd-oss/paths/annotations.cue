package paths

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
			content: "application/json": schema: $ref: "../../annotationd/schemas/AnnotationCreateList.yml"
		}
		responses: {
			"200": {
				description: "Annotations created"
				content: "application/json": schema: $ref: "../../annotationd/schemas/AnnotationEventList.yml"
			}
			"204": $ref: "../../../common/responses/NoContent.yml"
			"400": $ref: "../../../common/responses/ServerError.yml"
			"401": $ref: "../../../common/responses/ServerError.yml"
			"500": $ref: "../../../common/responses/ServerError.yml"
		}
	}
	get: {
		tags: [
			"Annotations",
		]
		operationId: "listAnnotations"
		summary:     "List annotations"
		parameters: [{
			$ref: "../../annotationd/parameters/AnnotationListFilter.yml"
		}, {
			name: "orgID"
			in:   "query"
			schema: type: "string"
		}]
		responses: {
			"200": {
				description: "Optionally filtered list of annotations"
				content: "application/json": schema: $ref: "../../annotationd/schemas/AnnotationList.yml"
			}
			"400": $ref: "../../../common/responses/ServerError.yml"
			"401": $ref: "../../../common/responses/ServerError.yml"
			"500": $ref: "../../../common/responses/ServerError.yml"
		}
	}
	delete: {
		tags: [
			"Annotations",
		]
		operationId: "deleteAnnotations"
		summary:     "Delete annotation"
		parameters: [{
			$ref: "../../annotationd/parameters/AnnotationDeleteFilter.yml"
		}, {
			name: "orgID"
			in:   "query"
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
