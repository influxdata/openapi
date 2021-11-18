package paths

orgs_orgId_invites: {
	get: {
		operationId: "GetInvites"
		tags: [
			"Invites",
		]
		parameters: [{
			$ref: "../../common/parameters/TraceSpan.yml"
		}, {
			in:          "path"
			name:        "orgId"
			description: "Specifies the organization ID of the Invite."
			required:    true
			schema: type: "string"
		}]
		responses: {
			"200": {
				description: "A list of cloud invites"
				content: "application/json": schema: $ref: "../schemas/Invites.yml"
			}
			"401": {
				description: "Unauthorized"
				$ref:        "../../common/responses/ServerError.yml"
			}
			"404": {
				description: "Session user not owner or Org not found"
				$ref:        "../../common/responses/ServerError.yml"
			}
			default: {
				description: "Unexpected error"
				$ref:        "../../common/responses/ServerError.yml"
			}
		}
	}
	post: {
		operationId: "PostOrgsIdInvites"
		tags: [
			"Invites",
			"Organizations",
		]
		summary: "Creates an invite to an organization"
		parameters: [{
			$ref: "../../common/parameters/TraceSpan.yml"
		}, {
			in:   "path"
			name: "orgId"
			schema: type: "string"
			required:    true
			description: "The organization ID."
		}]
		requestBody: {
			description: "Invite to be sent"
			required:    true
			content: "application/json": schema: $ref: "../schemas/Invite.yml"
		}
		responses: {
			"201": {
				description: "Invite sent"
				content: "application/json": schema: $ref: "../schemas/Invite.yml"
			}
			"401": {
				description: "Unauthorized"
				$ref:        "../../common/responses/ServerError.yml"
			}
			"404": {
				description: "Session user not owner or Org not found"
				$ref:        "../../common/responses/ServerError.yml"
			}
			"409": {
				description: "Conflict with invite email"
				$ref:        "../../common/responses/ServerError.yml"
			}
			"422": {
				description: "Missing information"
				$ref:        "../../common/responses/ServerError.yml"
			}
			default: {
				description: "Unexpected error"
				$ref:        "../../common/responses/ServerError.yml"
			}
			"429": {
				description: "Too many requests"
				$ref:        "../../common/responses/ServerError.yml"
			}
		}
	}
}
