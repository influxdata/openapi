package osspaths

import "github.com/influxdata/openapi/src/common/commonschemas"

import "github.com/influxdata/openapi/src/common/commonparameters"

import "github.com/influxdata/openapi/src/common/commonresponses"

legacy_authorizations_authID_password: post: {
	operationId: "PostLegacyAuthorizationsIDPassword"
	tags: [
		"Legacy Authorizations",
	]
	summary: "Set a legacy authorization password"
	parameters: [{
		commonparameters.TraceSpan.#Ref
	}, {
		in:   "path"
		name: "authID"
		schema: type: "string"
		required:    true
		description: "The ID of the legacy authorization to update."
	}]
	requestBody: {
		description: "New password"
		required:    true
		content: "application/json": schema: commonschemas.PasswordResetBody.#Ref
	}
	responses: {
		"204": description: "Legacy authorization password set"
		default: {
			description: "Unexpected error"
			commonresponses.ServerError.#Ref
		}
	}
}
