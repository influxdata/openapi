package unitypaths

import (
	"github.com/influxdata/openapi/src/common/commonresponses"
)
account: delete: {
	operationId: "DeleteAccount"
	summary:     "Self-delete account"
	requestBody: content: "application/json; charset=utf-8": schema: type: "object"
	responses: {
		"204": description: "Account deleted"
		"401": {
			description: "Unauthorized/Account doesn't exist"
			commonresponses.ServerError.#Ref
		}
		"405": {
			description: "Account is not deletable"
			commonresponses.ServerError.#Ref
		}
		default: {
			description: "Unexpected error"
			commonresponses.ServerError.#Ref
		}
	}
}
