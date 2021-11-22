package unitypaths

import (
	"github.com/influxdata/openapi/src/unity/unityschemas"

	"github.com/influxdata/openapi/src/common/commonresponses"

)
billing_contact: put: {
	operationId: "PutBillingContact"
	tags: [
		"Billing",
	]
	requestBody: {
		description: "BillingContact to update"
		required:    true
		content: "application/json": schema: unityschemas.BillingContact.#Ref
	}
	responses: {
		"200": {
			description: "billing contact updated"
			content: "application/json": schema: unityschemas.BillingContact.#Ref
		}
		default: {
			description: "Unexpected error"
			commonresponses.ServerError.#Ref
		}
	}
}
