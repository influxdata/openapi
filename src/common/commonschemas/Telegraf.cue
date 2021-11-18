package commonschemas

Telegraf: {
	type: "object"
	allOf: [{
		TelegrafRequest.#Ref
	}, {
		type: "object"
		properties: {
			id: {
				type:     "string"
				readOnly: true
			}
			links: {
				type:     "object"
				readOnly: true
				example: {
					self:    "/api/v2/telegrafs/1"
					lables:  "/api/v2/telegrafs/1/labels"
					owners:  "/api/v2/telegrafs/1/owners"
					members: "/api/v2/telegrafs/1/members"
				}
				properties: {
					self: Link.#Ref
					labels: Link.#Ref
					members: Link.#Ref
					owners: Link.#Ref
				}
			}
			labels: {
				readOnly: true
				Labels.#Ref
			}
		}
	}]
}
