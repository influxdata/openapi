package commonpaths

import "github.com/influxdata/openapi/src/common/commonparameters"

import "github.com/influxdata/openapi/src/common/commonschemas"

scrapers_scraperTargetID: {
	get: {
		operationId: "GetScrapersID"
		tags: ["Scraper Targets"]
		summary: "Retrieve a scraper target"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:       "path"
			name:     "scraperTargetID"
			required: true
			schema: type: "string"
			description: "The identifier of the scraper target."
		}]
		responses: {
			"200": {
				description: "The scraper target"
				content: "application/json": schema: commonschemas.ScraperTargetResponse.#Ref
			}
			default: {
				description: "Internal server error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
	delete: {
		operationId: "DeleteScrapersID"
		tags: ["Scraper Targets"]
		summary: "Delete a scraper target"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:       "path"
			name:     "scraperTargetID"
			required: true
			schema: type: "string"
			description: "The identifier of the scraper target."
		}]
		responses: {
			"204": description: "Scraper target deleted"
			default: {
				description: "Internal server error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
	patch: {
		operationId: "PatchScrapersID"
		summary:     "Update a scraper target"
		tags: ["Scraper Targets"]
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:       "path"
			name:     "scraperTargetID"
			required: true
			schema: type: "string"
			description: "The identifier of the scraper target."
		}]
		requestBody: {
			description: "Scraper target update to apply"
			required:    true
			content: "application/json": schema: commonschemas.ScraperTargetRequest.#Ref
		}
		responses: {
			"200": {
				description: "Scraper target updated"
				content: "application/json": schema: commonschemas.ScraperTargetResponse.#Ref
			}
			default: {
				description: "Internal server error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
}
