package commonschemas

DashboardWithViewProperties: {
	type: "object"
	allOf: [{
		CreateDashboardRequest.#Ref
	}, {
		type: "object"
		properties: {
			links: {
				type: "object"
				example: {
					self:    "/api/v2/dashboards/1"
					cells:   "/api/v2/dashboards/1/cells"
					owners:  "/api/v2/dashboards/1/owners"
					members: "/api/v2/dashboards/1/members"
					labels:  "/api/v2/dashboards/1/labels"
					org:     "/api/v2/labels/1"
				}
				properties: {
					self: Link.#Ref
					cells: Link.#Ref
					members: Link.#Ref
					owners: Link.#Ref
					labels: Link.#Ref
					org: Link.#Ref
				}
			}
			id: {
				readOnly: true
				type:     "string"
			}
			meta: {
				type: "object"
				properties: {
					createdAt: {
						type:   "string"
						format: "date-time"
					}
					updatedAt: {
						type:   "string"
						format: "date-time"
					}
				}
			}
			cells: CellsWithViewProperties.#Ref
			labels: Labels.#Ref
		}
	}]
}
