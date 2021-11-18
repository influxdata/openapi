package commonschemas

CheckBase: {
	properties: {
		id: {
			readOnly: true
			type:     "string"
		}
		name: type: "string"
		orgID: {
			description: "The ID of the organization that owns this check."
			type:        "string"
		}
		taskID: {
			description: "The ID of the task associated with this check."
			type:        "string"
		}
		ownerID: {
			description: "The ID of creator used to create this check."
			type:        "string"
			readOnly:    true
		}
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
		query: DashboardQuery.#Ref
		status: TaskStatusType.#Ref
		description: {
			description: "An optional description of the check."
			type:        "string"
		}
		latestCompleted: {
			description: "Timestamp of latest scheduled, completed run, RFC3339."
			type:        "string"
			format:      "date-time"
			readOnly:    true
		}
		lastRunStatus: {
			readOnly: true
			type:     "string"
			enum: [
				"failed",
				"success",
				"canceled",
			]
		}
		lastRunError: {
			readOnly: true
			type:     "string"
		}
		labels: Labels.#Ref
		links: {
			type:     "object"
			readOnly: true
			example: {
				self:    "/api/v2/checks/1"
				labels:  "/api/v2/checks/1/labels"
				members: "/api/v2/checks/1/members"
				owners:  "/api/v2/checks/1/owners"
				query:   "/api/v2/checks/1/query"
			}
			properties: {
				self: {
					description: "URL for this check"
					Link.#Ref
				}
				labels: {
					description: "URL to retrieve labels for this check"
					Link.#Ref
				}
				members: {
					description: "URL to retrieve members for this check"
					Link.#Ref
				}
				owners: {
					description: "URL to retrieve owners for this check"
					Link.#Ref
				}
				query: {
					description: "URL to retrieve flux script for this check"
					Link.#Ref
				}
			}
		}
	}
	required: ["name", "orgID", "query"]
}
