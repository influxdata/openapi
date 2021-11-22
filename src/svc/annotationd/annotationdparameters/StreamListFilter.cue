package annotationdparameters

import (
	"github.com/influxdata/openapi/src/svc/annotationd/annotationdschemas"

)

StreamListFilter: {
	in:          "query"
	name:        "StreamListFilter"
	required:    false
	description: "Filter for returned streams"
	schema:      annotationdschemas.StreamListFilter.#Ref
}
