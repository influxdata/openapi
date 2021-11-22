package pinneditemsdrequestBodies

import (
	"github.com/influxdata/openapi/src/svc/pinneditemsd/pinneditemsdschemas"

)
PinnedItemParams: {
	description: "Pinned Item record"
	required:    false
	content: "application/json": schema: pinneditemsdschemas.PinnedItem.#Ref
}
