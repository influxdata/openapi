package annotationdparameters

import "github.com/influxdata/openapi/src/svc/annotationd/annotationdschemas"

StreamDeleteFilter: {
	in:          "query"
	name:        "StreamDeleteFilter"
	required:    true
	description: "Stream to delete"
	schema: annotationdschemas.StreamDeleteFilter.#Ref
}
