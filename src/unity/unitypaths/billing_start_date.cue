package unitypaths

billing_start_date: get: {
	operationId: "GetBillingStartDate"
	tags: [
		"Billing",
	]
	responses: {
		"200": {
			description: "Start of the current billing period for the Account"
			content: "application/json": schema: $ref: "../schemas/BillingDate.yml"
		}
		default: {
			description: "Unexpected error"
			$ref:        "../../common/responses/ServerError.yml"
		}
	}
}
