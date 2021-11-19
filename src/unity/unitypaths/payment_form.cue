package unitypaths

import "github.com/influxdata/openapi/src/unity/unityschemas"

import "github.com/influxdata/openapi/src/common/commonresponses"

payment_form: get: {
	operationId: "GetPaymentForm"
	tags: [
		"PaymentGateway",
	]
	parameters: [{
		in:       "path"
		name:     "form"
		required: true
		schema: unityschemas.PaymentFormType.#Ref
		example: "checkout"
	}]
	responses: {
		"200": {
			description: "A CreditCard Form parameter object"
			content: "application/json": schema: unityschemas.CreditCardParams.#Ref
		}
		"400": {
			description: "Bad Request"
			commonresponses.ServerError.#Ref
		}
		"401": {
			description: "Unauthorized"
			commonresponses.ServerError.#Ref
		}
		"404": {
			description: "User or Form not found"
			commonresponses.ServerError.#Ref
		}
		"406": {
			description: "Not Acceptable"
			commonresponses.ServerError.#Ref
		}
		default: {
			description: "Unexpected error"
			commonresponses.ServerError.#Ref
		}
	}
}
