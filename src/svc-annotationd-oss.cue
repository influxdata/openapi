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
		url: "/api/v2private"
	}]
	paths: {
		"/annotations":                annotationdosspaths.annotations.#Ref
		"/annotations/{annotationID}": annotationdpaths.annotation.#Ref
		"/streams":                    annotationdosspaths.streams.#Ref
		"/streams/{streamID}":         annotationdpaths.stream.#Ref
	}
	components: {
		parameters: {
			AnnotationListFilter:   annotationdparameters.AnnotationListFilter
			AnnotationDeleteFilter: annotationdparameters.AnnotationDeleteFilter
			StreamListFilter:       annotationdparameters.StreamListFilter
			StreamDeleteFilter:     annotationdparameters.StreamDeleteFilter
		}
		schemas: {
			AnnotationListFilter:   annotationdschemas.AnnotationListFilter
			AnnotationDeleteFilter: annotationdschemas.AnnotationDeleteFilter
			BasicFilter:            annotationdschemas.BasicFilter
			AnnotationList:         annotationdschemas.AnnotationList
			AnnotationEventList:    annotationdschemas.AnnotationEventList
			AnnotationEvent:        annotationdschemas.AnnotationEvent
			AnnotationCreateList:   annotationdschemas.AnnotationCreateList
			AnnotationCreate:       annotationdschemas.AnnotationCreate
			Annotation:             annotationdschemas.Annotation
			StreamListFilter:       annotationdschemas.StreamListFilter
			StreamDeleteFilter:     annotationdschemas.StreamDeleteFilter
			StreamList:             annotationdschemas.StreamList
			Stream:                 annotationdschemas.Stream
			ReadStream:             annotationdschemas.ReadStream
			Error:                  commonschemas.Error
		}
		responses: {
			NoContent:   commonresponses.NoContent
			ServerError: commonresponses.ServerError
		}
	}
}
