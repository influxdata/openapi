package commonpaths

import (
	"github.com/influxdata/openapi/src/common/commonparameters"

	"github.com/influxdata/openapi/src/common/commonschemas"

)

scrapers_scraperTargetID_owners_userID: delete: {
	operationId: "DeleteScrapersIDOwnersID"
	tags: ["Scraper Targets"]
	summary: "Remove an owner from a scraper target"
	parameters: [{
		commonparameters.TraceSpan.#Ref
	}, {
		in:   "path"
		name: "userID"
		schema: type: "string"
		required:    true
		description: "The ID of owner to remove."
	}, {
		in:   "path"
		name: "scraperTargetID"
		schema: type: "string"
		required:    true
		description: "The scraper target ID."
	}]
	responses: {
		"204": description: "Owner removed"
		default: {
			description: "Unexpected error"
			content: "application/json": schema: commonschemas.Error.#Ref
		}
	}
}
