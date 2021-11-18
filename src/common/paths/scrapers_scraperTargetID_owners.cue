package paths

scrapers_scraperTargetID_owners: {
	get: {
		operationId: "GetScrapersIDOwners"
		tags: ["Scraper Targets"]
		summary: "List all owners of a scraper target"
		parameters: [{
			$ref: "../parameters/TraceSpan.yml"
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
				content: "application/json": schema: $ref: "../schemas/ResourceOwners.yml"
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
	post: {
		operationId: "PostScrapersIDOwners"
		tags: ["Scraper Targets"]
		summary: "Add an owner to a scraper target"
		parameters: [{
			$ref: "../parameters/TraceSpan.yml"
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
			content: "application/json": schema: $ref: "../schemas/AddResourceMemberRequestBody.yml"
		}
		responses: {
			"201": {
				description: "Scraper target owner added"
				content: "application/json": schema: $ref: "../schemas/ResourceOwner.yml"
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
}
