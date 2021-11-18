package commonpaths

import "github.com/influxdata/openapi/src/common/commonparameters"

import "github.com/influxdata/openapi/src/common/commonschemas"

scrapers_scraperTargetID_labels_labelID: delete: {
	operationId: "DeleteScrapersIDLabelsID"
	tags: ["Scraper Targets"]
	summary: "Delete a label from a scraper target"
	parameters: [{
		commonparameters.TraceSpan.#Ref
	}, {
		in:   "path"
		name: "scraperTargetID"
		schema: type: "string"
		required:    true
		description: "The scraper target ID."
	}, {
		in:   "path"
		name: "labelID"
		schema: type: "string"
		required:    true
		description: "The label ID."
	}]
	responses: {
		"204": description: "Delete has been accepted"
		"404": {
			description: "Scraper target not found"
			content: "application/json": schema: commonschemas.Error.#Ref
		}
		default: {
			description: "Unexpected error"
			content: "application/json": schema: commonschemas.Error.#Ref
		}
	}
}
