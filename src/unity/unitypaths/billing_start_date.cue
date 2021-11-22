package unitypaths

import (
	"github.com/influxdata/openapi/src/unity/unityschemas"

	"github.com/influxdata/openapi/src/common/commonresponses"

)
billing_start_date: get: {
	operationId: "GetBillingStartDate"
	tags: [
		"Billing",
	]
	responses: {
		"200": {
			description: "Start of the current billing period for the Account"
			content: "application/json": schema: unityschemas.BillingDate.#Ref
		}
		default: {
			description: "Unexpected error"
			commonresponses.ServerError.#Ref
		}
	}
}
