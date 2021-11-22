package contracts

import (
	"github.com/influxdata/openapi/src/svc/annotationd/annotationdschemas"
	"github.com/influxdata/openapi/src/svc/annotationd/annotationdpaths"
	"github.com/influxdata/openapi/src/svc/annotationd/annotationdparameters"
	"github.com/influxdata/openapi/src/common/commonschemas"
	"github.com/influxdata/openapi/src/common/commonresponses"
)

all: "svc-annotationd": {
	openapi: "3.0.0"
	info: {
		title:   "Annotations service"
		version: "0.2.3"
	}
	servers: [{
		url: "/api/v2private"
	}]
	paths: {
		"/annotations":                annotationdpaths.annotations
		"/annotations/{annotationID}": annotationdpaths.annotation
		"/streams":                    annotationdpaths.streams
		"/streams/{streamID}":         annotationdpaths.stream
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
			AnnotationResponse:     annotationdschemas.AnnotationResponse
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
