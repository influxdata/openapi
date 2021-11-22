package contracts

import (
	"github.com/influxdata/openapi/src/svc/pinneditemsd/pinneditemsdschemas"
	"github.com/influxdata/openapi/src/svc/pinneditemsd/pinneditemsdrequestBodies"
	"github.com/influxdata/openapi/src/svc/pinneditemsd/notebooksdpaths"
	"github.com/influxdata/openapi/src/common/commonschemas"
	"github.com/influxdata/openapi/src/common/commonresponses"
)

all: "svc-pinneditemsd": {
	openapi: "3.0.0"
	info: {
		title:   "pinneditemsd"
		version: "1.0.0"
	}
	servers: [{
		url: "/api/v2private"
	}]
	paths: {
		"/pinned":      notebooksdpaths.pinned
		"/pinned/{id}": notebooksdpaths.pinned_id
	}
	components: {
		requestBodies: PinnedItemParams: pinneditemsdrequestBodies.PinnedItemParams
		schemas: {
			PinnedItem:      pinneditemsdschemas.PinnedItem
			PinnedItemArray: pinneditemsdschemas.PinnedItemArray
			Error:           commonschemas.Error
		}
		responses: {
			NoContent:   commonresponses.NoContent
			ServerError: commonresponses.ServerError
		}
	}
}
