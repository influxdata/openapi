package commonschemas

Organization: {
	properties: {
		links: {
			type:     "object"
			readOnly: true
			example: {
				self:       "/api/v2/orgs/1"
				members:    "/api/v2/orgs/1/members"
				owners:     "/api/v2/orgs/1/owners"
				labels:     "/api/v2/orgs/1/labels"
				secrets:    "/api/v2/orgs/1/secrets"
				buckets:    "/api/v2/buckets?org=myorg"
				tasks:      "/api/v2/tasks?org=myorg"
				dashboards: "/api/v2/dashboards?org=myorg"
			}
			properties: {
				self: Link.#Ref
				members: Link.#Ref
				owners: Link.#Ref
				labels: Link.#Ref
				secrets: Link.#Ref
				buckets: Link.#Ref
				tasks: Link.#Ref
				dashboards: Link.#Ref
			}
		}
		id: {
			readOnly: true
			type:     "string"
		}
		name: type: "string"
		description: type: "string"
		createdAt: {
			type:     "string"
			format:   "date-time"
			readOnly: true
		}
		updatedAt: {
			type:     "string"
			format:   "date-time"
			readOnly: true
		}
		status: {
			description: "If inactive the organization is inactive."
			default:     "active"
			type:        "string"
			enum: [
				"active",
				"inactive",
			]
		}
	}
	required: ["name"]
}
