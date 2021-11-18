package commonpaths

import "github.com/influxdata/openapi/src/common/commonparameters"

import "github.com/influxdata/openapi/src/common/commonschemas"

scrapers: {
	get: {
		operationId: "GetScrapers"
		tags: ["Scraper Targets"]
		summary: "List all scraper targets"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:          "query"
			name:        "name"
			description: "Specifies the name of the scraper target."
			schema: type: "string"
		}, {
			in:          "query"
			name:        "id"
			description: "List of scraper target IDs to return. If both `id` and `owner` are specified, only `id` is used."
			schema: {
				type: "array"
				items: type: "string"
			}
		}, {
			in:          "query"
			name:        "orgID"
			description: "Specifies the organization ID of the scraper target."
			schema: type: "string"
		}, {
			in:          "query"
			name:        "org"
			description: "Specifies the organization name of the scraper target."
			schema: type: "string"
		}]
		responses: "200": {
			description: "All scraper targets"
			content: "application/json": schema: commonschemas.ScraperTargetResponses.#Ref
		}
	}
	post: {
		operationId: "PostScrapers"
		summary:     "Create a scraper target"
		tags: ["Scraper Targets"]
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}]
		requestBody: {
			description: "Scraper target to create"
			required:    true
			content: "application/json": schema: commonschemas.ScraperTargetRequest.#Ref
		}
		responses: {
			"201": {
				description: "Scraper target created"
				content: "application/json": schema: commonschemas.ScraperTargetResponse.#Ref
			}
			default: {
				description: "Internal server error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
}
