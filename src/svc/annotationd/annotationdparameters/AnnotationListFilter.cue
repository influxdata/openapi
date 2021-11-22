package annotationdparameters

import (
	"github.com/influxdata/openapi/src/svc/annotationd/annotationdschemas"
)

AnnotationListFilter: {
	in:          "query"
	name:        "AnnotationListFilter"
	required:    false
	description: "Filter for returned annotations"
	schema:      annotationdschemas.AnnotationListFilter.#Ref
}
