package unitypaths

import (
	"github.com/influxdata/openapi/src/unity/unityschemas"

	"github.com/influxdata/openapi/src/common/commonresponses"

)
billing: get: {
	operationId: "GetBilling"
	tags: [
		"Billing",
	]
	responses: {
		"200": {
			description: "Billing information for account"
			content: "application/json": schema: unityschemas.BillingInfo.#Ref
		}
		default: {
			description: "Unexpected error"
			commonresponses.ServerError.#Ref
		}
	}
}
