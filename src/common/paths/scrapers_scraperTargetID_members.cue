package paths

scrapers_scraperTargetID_members: {
	get: {
		operationId: "GetScrapersIDMembers"
		tags: ["Scraper Targets"]
		summary: "List all users with member privileges for a scraper target"
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
				description: "A list of scraper target members"
				content: "application/json": schema: $ref: "../schemas/ResourceMembers.yml"
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
	post: {
		operationId: "PostScrapersIDMembers"
		tags: ["Scraper Targets"]
		summary: "Add a member to a scraper target"
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
			description: "User to add as member"
			required:    true
			content: "application/json": schema: $ref: "../schemas/AddResourceMemberRequestBody.yml"
		}
		responses: {
			"201": {
				description: "Member added to scraper targets"
				content: "application/json": schema: $ref: "../schemas/ResourceMember.yml"
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
}
