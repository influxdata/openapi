package cloudschemas

import (
	"github.com/influxdata/openapi/src/common/commonschemas"

)

Authorization: {
	required: ["orgID", "permissions"]
	allOf: [{
		*commonschemas.AuthorizationUpdateRequest.#Ref | commonschemas.AuthorizationUpdateRequest
	}, {
		type: "object"
		properties: {
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
			orgID: {
				type:        "string"
				description: "ID of org that authorization is scoped to."
			}
			permissions: {
				type:        "array"
				minItems:    1
				description: "List of permissions for an auth.  An auth must have at least one Permission."
				items:       *Permission.#Ref | Permission
			}
			id: {
				readOnly: true
				type:     "string"
			}
			token: {
				readOnly:    true
				type:        "string"
				description: "Passed via the Authorization Header and Token Authentication type."
			}
			userID: {
				readOnly:    true
				type:        "string"
				description: "ID of user that created and owns the token."
			}
			user: {
				readOnly:    true
				type:        "string"
				description: "Name of user that created and owns the token."
			}
			org: {
				readOnly:    true
				type:        "string"
				description: "Name of the org token is scoped to."
			}
			links: {
				type:     "object"
				readOnly: true
				example: {
					self: "/api/v2/authorizations/1"
					user: "/api/v2/users/12"
				}
				properties: {
					self: {
						readOnly: true
						commonschemas.Link.#Ref
					}
					user: {
						readOnly: true
						commonschemas.Link.#Ref
					}
				}
			}
		}
	}]
}
