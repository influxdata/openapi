package unitypaths

import (
	"github.com/influxdata/openapi/src/unity/unityschemas"

	"github.com/influxdata/openapi/src/common/commonresponses"

)
billing_invoices: get: {
	operationId: "GetInvoices"
	tags: [
		"Billing",
	]
	responses: {
		"200": {
			description: "A list of invoices"
			content: "application/json": schema: unityschemas.Invoices.#Ref
		}
		"401": {
			description: "Unauthorized"
			commonresponses.ServerError.#Ref
		}
		default: {
			description: "Unexpected error"
			commonresponses.ServerError.#Ref
		}
	}
}
