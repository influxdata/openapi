package paths

billing_payment_method: put: {
	operationId: "PutPaymentMethod"
	tags: [
		"Billing",
	]
	requestBody: {
		description: "PaymentMethod to update"
		required:    true
		content: "application/json": schema: $ref: "../schemas/PaymentMethodPut.yml"
	}
	responses: {
		"200": {
			description: "Payment method updated"
			content: "application/json": schema: $ref: "../schemas/PaymentMethod.yml"
		}
		default: {
			description: "Unexpected error"
			$ref:        "../../common/responses/ServerError.yml"
		}
	}
}
