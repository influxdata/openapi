package commonpaths

import (
	"github.com/influxdata/openapi/src/common/commonparameters"

	"github.com/influxdata/openapi/src/common/commonschemas"

)

users_userID_password: post: {
	operationId: "PostUsersIDPassword"
	tags: [
		"Users",
	]
	summary: "Update a password"
	security: [{
		BasicAuthentication: [

		]}]
	parameters: [{
		commonparameters.TraceSpan.#Ref
	}, {
		in:   "path"
		name: "userID"
		schema: type: "string"
		required:    true
		description: "The user ID."
	}]
	requestBody: {
		description: "New password"
		required:    true
		content: "application/json": schema: commonschemas.PasswordResetBody.#Ref
	}
	responses: {
		"204": description: "Password successfully updated"
		default: {
			description: "Unsuccessful authentication"
			content: "application/json": schema: commonschemas.Error.#Ref
		}
	}
}
