package commonschemas

ScraperTargetResponse: {
	type: "object"
	allOf: [{
		ScraperTargetRequest.#Ref
	}, {
		type: "object"
		properties: {
			id: {
				type:     "string"
				readOnly: true
			}
			org: {
				type:        "string"
				description: "The name of the organization."
			}
			bucket: {
				type:        "string"
				description: "The bucket name."
			}
			links: {
				type:     "object"
				readOnly: true
				example: {
					self:         "/api/v2/scrapers/1"
					owners:       "/api/v2/scrapers/1/owners"
					members:      "/api/v2/scrapers/1/members"
					bucket:       "/api/v2/buckets/1"
					organization: "/api/v2/orgs/1"
				}
				properties: {
					self:         Link.#Ref
					members:      Link.#Ref
					owners:       Link.#Ref
					bucket:       Link.#Ref
					organization: Link.#Ref
				}
			}
		}
	}]
}
