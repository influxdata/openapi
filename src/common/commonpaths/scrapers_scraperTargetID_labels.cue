package commonpaths

import (
	"github.com/influxdata/openapi/src/common/commonparameters"

	"github.com/influxdata/openapi/src/common/commonschemas"

)

scrapers_scraperTargetID_labels: {
	get: {
		operationId: "GetScrapersIDLabels"
		tags: ["Scraper Targets"]
		summary: "List all labels for a scraper target"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "scraperTargetID"
			schema: type: "string"
			required:    true
			description: "The scraper target ID."
		}]
		responses: {
			"200": {
				description: "A list of labels for a scraper target."
				content: "application/json": schema: commonschemas.LabelsResponse.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
	post: {
		operationId: "PostScrapersIDLabels"
		tags: ["Scraper Targets"]
		summary: "Add a label to a scraper target"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "scraperTargetID"
			schema: type: "string"
			required:    true
			description: "The scraper target ID."
		}]
		requestBody: {
			description: "Label to add"
			required:    true
			content: "application/json": schema: commonschemas.LabelMapping.#Ref
		}
		responses: {
			"201": {
				description: "The newly added label"
				content: "application/json": schema: commonschemas.LabelResponse.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
}
