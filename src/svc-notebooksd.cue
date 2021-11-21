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
		url: "/api/v2private"
	}]
	paths: {
		"/notebooks":                     notebooksdpaths.notebooks
		"/notebooks/{id}":                notebooksdpaths.notebooks_id
		"/notebooks/share":               notebooksdpaths.notebooks_share
		"/notebooks/share/{id}":          notebooksdpaths.notebooks_share_id
		"/api/share/{id}/query/{pipeID}": notebooksdpaths.api_share_id_query_pipeid
		"/api/share/{id}":                notebooksdpaths.api_share_id
	}
	components: {
		requestBodies: {
			NotebookParams: notebooksdrequestBodies.NotebookParams
			ShareParams:    notebooksdrequestBodies.ShareParams
		}
		schemas: {
			NotebookParams: notebooksdschemas.NotebookParams
			Notebook:       notebooksdschemas.Notebook
			NotebookArray:  notebooksdschemas.NotebookArray
			Notebooks:      notebooksdschemas.Notebooks
			ShareParams:    notebooksdschemas.ShareParams
			Share:          notebooksdschemas.Share
			Shares:         notebooksdschemas.Shares
			Error:          commonschemas.Error
		}
		responses: {
			NoContent:   commonresponses.NoContent
			ServerError: commonresponses.ServerError
		}
	}
}
