package unitypaths

import "github.com/influxdata/openapi/src/common/commonresponses"

cancel: post: {
	operationId: "PostCancel"
	description: "Cancel an account"
	requestBody: content: "application/json; charset=utf-8": schema: type: "object"
	tags: [
		"Accounts",
	]
	responses: {
		"204": description: "Account cancelled"
		default: {
			description: "Unexpected error"
			commonresponses.ServerError.#Ref
		}
	}
}
