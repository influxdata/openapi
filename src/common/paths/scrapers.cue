package paths

scrapers: {
	get: {
		operationId: "GetScrapers"
		tags: ["Scraper Targets"]
		summary: "List all scraper targets"
		parameters: [{
			$ref: "../parameters/TraceSpan.yml"
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
			content: "application/json": schema: $ref: "../schemas/ScraperTargetResponses.yml"
		}
	}
	post: {
		operationId: "PostScrapers"
		summary:     "Create a scraper target"
		tags: ["Scraper Targets"]
		parameters: [{
			$ref: "../parameters/TraceSpan.yml"
		}]
		requestBody: {
			description: "Scraper target to create"
			required:    true
			content: "application/json": schema: $ref: "../schemas/ScraperTargetRequest.yml"
		}
		responses: {
			"201": {
				description: "Scraper target created"
				content: "application/json": schema: $ref: "../schemas/ScraperTargetResponse.yml"
			}
			default: {
				description: "Internal server error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
}
