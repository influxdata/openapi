package unitypaths

import "github.com/influxdata/openapi/src/unity/unityschemas"

import "github.com/influxdata/openapi/src/common/commonresponses"

billing_payment_method: put: {
	operationId: "PutPaymentMethod"
	tags: [
		"Billing",
	]
	requestBody: {
		description: "PaymentMethod to update"
		required:    true
		content: "application/json": schema: unityschemas.PaymentMethodPut.#Ref
	}
	responses: {
		"200": {
			description: "Payment method updated"
			content: "application/json": schema: unityschemas.PaymentMethod.#Ref
		}
		default: {
			description: "Unexpected error"
			commonresponses.ServerError.#Ref
		}
	}
}
