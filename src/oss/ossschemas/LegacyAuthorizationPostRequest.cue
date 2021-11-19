package ossschemas

import "github.com/influxdata/openapi/src/common/commonschemas"

LegacyAuthorizationPostRequest: {
	required: ["orgID", "permissions"]
	allOf: [{
		commonschemas.AuthorizationUpdateRequest.#Ref
	}, {
		type: "object"
		properties: {
			orgID: {
				type:        "string"
				description: "ID of org that authorization is scoped to."
			}
			userID: {
				type:        "string"
				description: "ID of user that authorization is scoped to."
			}
			token: {
				type:        "string"
				description: "Token (name) of the authorization"
			}
			permissions: {
				type:        "array"
				minItems:    1
				description: "List of permissions for an auth.  An auth must have at least one Permission."
				items:       commonschemas.Permission.#Ref
			}
		}
	}]
}
