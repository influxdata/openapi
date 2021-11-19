package contracts

import "github.com/influxdata/openapi/src/svc/annotationd/annotationdschemas"

import "github.com/influxdata/openapi/src/svc/annotationd/annotationdpaths"

import "github.com/influxdata/openapi/src/svc/annotationd/annotationdparameters"

import "github.com/influxdata/openapi/src/svc/annotationd-oss/annotationdosspaths"

import "github.com/influxdata/openapi/src/common/commonschemas"

import "github.com/influxdata/openapi/src/common/commonresponses"

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
		"/annotations": annotationdosspaths.annotations.#Ref
		"/annotations/{annotationID}": annotationdpaths.annotation.#Ref
		"/streams": annotationdosspaths.streams.#Ref
		"/streams/{streamID}": annotationdpaths.stream.#Ref
	}
	components: {
		parameters: {
			AnnotationListFilter: annotationdparameters.AnnotationListFilter.#Ref
			AnnotationDeleteFilter: annotationdparameters.AnnotationDeleteFilter.#Ref
			StreamListFilter: annotationdparameters.StreamListFilter.#Ref
			StreamDeleteFilter: annotationdparameters.StreamDeleteFilter.#Ref
		}
		schemas: {
			AnnotationListFilter: annotationdschemas.AnnotationListFilter.#Ref
			AnnotationDeleteFilter: annotationdschemas.AnnotationDeleteFilter.#Ref
			BasicFilter: annotationdschemas.BasicFilter.#Ref
			AnnotationList: annotationdschemas.AnnotationList.#Ref
			AnnotationEventList: annotationdschemas.AnnotationEventList.#Ref
			AnnotationEvent: annotationdschemas.AnnotationEvent.#Ref
			AnnotationCreateList: annotationdschemas.AnnotationCreateList.#Ref
			AnnotationCreate: annotationdschemas.AnnotationCreate.#Ref
			Annotation: annotationdschemas.Annotation.#Ref
			StreamListFilter: annotationdschemas.StreamListFilter.#Ref
			StreamDeleteFilter: annotationdschemas.StreamDeleteFilter.#Ref
			StreamList: annotationdschemas.StreamList.#Ref
			Stream: annotationdschemas.Stream.#Ref
			ReadStream: annotationdschemas.ReadStream.#Ref
			Error: commonschemas.Error.#Ref
		}
		responses: {
			NoContent: commonresponses.NoContent.#Ref
			ServerError: commonresponses.ServerError.#Ref
		}
	}
}
