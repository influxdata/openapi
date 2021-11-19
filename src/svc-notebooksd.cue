package contracts

import "github.com/influxdata/openapi/src/svc/notebooksd/notebooksdschemas"

import "github.com/influxdata/openapi/src/svc/notebooksd/notebooksdrequestBodies"

import "github.com/influxdata/openapi/src/svc/notebooksd/notebooksdpaths"

import "github.com/influxdata/openapi/src/common/commonschemas"

import "github.com/influxdata/openapi/src/common/commonresponses"

"svc-notebooksd": {
	openapi: "3.0.0"
	info: {
		title:   "notebooksd"
		version: "1.0.0"
	}
	servers: [{
		url: "/"
	}]
	paths: {
		"/notebooks": notebooksdpaths.notebooks.#Ref
		"/notebooks/{id}": notebooksdpaths.notebooks_id.#Ref
		"/notebooks/share": notebooksdpaths.notebooks_share.#Ref
		"/notebooks/share/{id}": notebooksdpaths.notebooks_share_id.#Ref
		"/api/share/{id}/query/{pipeID}": notebooksdpaths.api_share_id_query_pipeid.#Ref
		"/api/share/{id}": notebooksdpaths.api_share_id.#Ref
	}
	components: {
		requestBodies: {
			NotebookParams: notebooksdrequestBodies.NotebookParams.#Ref
			ShareParams: notebooksdrequestBodies.ShareParams.#Ref
		}
		schemas: {
			NotebookParams: notebooksdschemas.NotebookParams.#Ref
			Notebook: notebooksdschemas.Notebook.#Ref
			NotebookArray: notebooksdschemas.NotebookArray.#Ref
			Notebooks: notebooksdschemas.Notebooks.#Ref
			ShareParams: notebooksdschemas.ShareParams.#Ref
			Share: notebooksdschemas.Share.#Ref
			Shares: notebooksdschemas.Shares.#Ref
			Error: commonschemas.Error.#Ref
		}
		responses: {
			NoContent: commonresponses.NoContent.#Ref
			ServerError: commonresponses.ServerError.#Ref
		}
	}
}
