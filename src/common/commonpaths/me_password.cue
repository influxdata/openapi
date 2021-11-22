package commonpaths

import (
	"github.com/influxdata/openapi/src/common/commonparameters"

	"github.com/influxdata/openapi/src/common/commonschemas"

)

me_password: put: {
	operationId: "PutMePassword"
	tags: [
		"Users",
	]
	summary: "Update a password"
	security: [{
		BasicAuthentication: [

		]}]
	parameters: [{
		commonparameters.TraceSpan.#Ref
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
