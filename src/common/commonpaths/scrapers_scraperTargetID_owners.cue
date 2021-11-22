package commonpaths

import (
	"github.com/influxdata/openapi/src/common/commonparameters"
	"github.com/influxdata/openapi/src/common/commonschemas"
)

scrapers_scraperTargetID_owners: {
	get: {
		operationId: "GetScrapersIDOwners"
		tags: ["Scraper Targets"]
		summary: "List all owners of a scraper target"
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
				description: "A list of scraper target owners"
				content: "application/json": schema: commonschemas.ResourceOwners.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
	post: {
		operationId: "PostScrapersIDOwners"
		tags: ["Scraper Targets"]
		summary: "Add an owner to a scraper target"
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
			description: "User to add as owner"
			required:    true
			content: "application/json": schema: commonschemas.AddResourceMemberRequestBody.#Ref
		}
		responses: {
			"201": {
				description: "Scraper target owner added"
				content: "application/json": schema: commonschemas.ResourceOwner.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
}
