package contracts

import "github.com/influxdata/openapi/src/svc/pinneditemsd/pinneditemsdschemas"

import "github.com/influxdata/openapi/src/svc/pinneditemsd/pinneditemsdrequestBodies"

import "github.com/influxdata/openapi/src/svc/pinneditemsd/notebooksdpaths"

import "github.com/influxdata/openapi/src/common/commonschemas"

import "github.com/influxdata/openapi/src/common/commonresponses"

"svc-pinneditemsd": {
	openapi: "3.0.0"
	info: {
		title:   "pinneditemsd"
		version: "1.0.0"
	}
	servers: [{
		url: "/"
	}]
	paths: {
		"/pinned": notebooksdpaths.pinned.#Ref
		"/pinned/{id}": notebooksdpaths.pinned_id.#Ref
	}
	components: {
		requestBodies: PinnedItemParams: pinneditemsdrequestBodies.PinnedItemParams.#Ref
		schemas: {
			PinnedItem: pinneditemsdschemas.pinnedItem.#Ref
			PinnedItemArray: pinneditemsdschemas.pinnedItemArray.#Ref
			Error: commonschemas.Error.#Ref
		}
		responses: {
			NoContent: commonresponses.NoContent.#Ref
			ServerError: commonresponses.ServerError.#Ref
		}
	}
}
