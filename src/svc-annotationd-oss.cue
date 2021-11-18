package contracts

"svc-annotationd-oss": {
	openapi: "3.0.0"
	info: {
		title:   "Annotations service"
		version: "0.2.3"
	}
	servers: [{
		url: "/"
	}]
	paths: {
		"/annotations": $ref: "./svc/annotationd-oss/paths/annotations.yml"
		"/annotations/{annotationID}": $ref: "./svc/annotationd/paths/annotation.yml"
		"/streams": $ref: "./svc/annotationd-oss/paths/streams.yml"
		"/streams/{streamID}": $ref: "./svc/annotationd/paths/stream.yml"
	}
	components: {
		parameters: {
			AnnotationListFilter: $ref: "./svc/annotationd/parameters/AnnotationListFilter.yml"
			AnnotationDeleteFilter: $ref: "./svc/annotationd/parameters/AnnotationDeleteFilter.yml"
			StreamListFilter: $ref: "./svc/annotationd/parameters/StreamListFilter.yml"
			StreamDeleteFilter: $ref: "./svc/annotationd/parameters/StreamDeleteFilter.yml"
		}
		schemas: {
			AnnotationListFilter: $ref: "./svc/annotationd/schemas/AnnotationListFilter.yml"
			AnnotationDeleteFilter: $ref: "./svc/annotationd/schemas/AnnotationDeleteFilter.yml"
			BasicFilter: $ref: "./svc/annotationd/schemas/BasicFilter.yml"
			AnnotationList: $ref: "./svc/annotationd/schemas/AnnotationList.yml"
			AnnotationEventList: $ref: "./svc/annotationd/schemas/AnnotationEventList.yml"
			AnnotationEvent: $ref: "./svc/annotationd/schemas/AnnotationEvent.yml"
			AnnotationCreateList: $ref: "./svc/annotationd/schemas/AnnotationCreateList.yml"
			AnnotationCreate: $ref: "./svc/annotationd/schemas/AnnotationCreate.yml"
			Annotation: $ref: "./svc/annotationd/schemas/Annotation.yml"
			StreamListFilter: $ref: "./svc/annotationd/schemas/StreamListFilter.yml"
			StreamDeleteFilter: $ref: "./svc/annotationd/schemas/StreamDeleteFilter.yml"
			StreamList: $ref: "./svc/annotationd/schemas/StreamList.yml"
			Stream: $ref: "./svc/annotationd/schemas/Stream.yml"
			ReadStream: $ref: "./svc/annotationd/schemas/ReadStream.yml"
			Error: $ref: "./common/schemas/Error.yml"
		}
		responses: {
			NoContent: $ref: "./common/responses/NoContent.yml"
			ServerError: $ref: "./common/responses/ServerError.yml"
		}
	}
}
