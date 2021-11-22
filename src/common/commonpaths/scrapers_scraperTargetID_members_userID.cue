package commonpaths

import (
	"github.com/influxdata/openapi/src/common/commonparameters"

	"github.com/influxdata/openapi/src/common/commonschemas"

)

scrapers_scraperTargetID_members_userID: delete: {
	operationId: "DeleteScrapersIDMembersID"
	tags: ["Scraper Targets"]
	summary: "Remove a member from a scraper target"
	parameters: [{
		commonparameters.TraceSpan.#Ref
	}, {
		in:   "path"
		name: "userID"
		schema: type: "string"
		required:    true
		description: "The ID of member to remove."
	}, {
		in:   "path"
		name: "scraperTargetID"
		schema: type: "string"
		required:    true
		description: "The scraper target ID."
	}]
	responses: {
		"204": description: "Member removed"
		default: {
			description: "Unexpected error"
			content: "application/json": schema: commonschemas.Error.#Ref
		}
	}
}
