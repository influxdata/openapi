package annotationdparameters

import "github.com/influxdata/openapi/src/svc/annotationd/annotationdschemas"

AnnotationDeleteFilter: {
	in:          "query"
	name:        "AnnotationDeleteFilter"
	required:    true
	description: "Annotations to delete"
	schema: annotationdschemas.AnnotationDeleteFilter.#Ref
}
