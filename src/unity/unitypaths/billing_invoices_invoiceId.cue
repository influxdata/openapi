package unitypaths

import (
	"github.com/influxdata/openapi/src/common/commonresponses"

	"github.com/influxdata/openapi/src/common/commonparameters"

)
billing_invoices_invoiceId: get: {
	operationId: "GetInvoicesId"
	tags: [
		"Billing",
	]
	parameters: [{
		commonparameters.TraceSpan.#Ref
	}, {
		in:   "path"
		name: "invoiceId"
		schema: type: "string"
		required:    true
		description: "The ID of the invoice to get."
	}]
	responses: {
		"200": {
			description: "Returns the raw binary for the json pdf"
			content: "application/pdf": schema: {
				type:   "string"
				format: "binary"
			}
		}
		"401": {
			description: "Not Authorized or Invalid Session"
			commonresponses.ServerError.#Ref
		}
		"404": {
			description: "Invoice not found"
			commonresponses.ServerError.#Ref
		}
		default: {
			description: "Unexpected error"
			commonresponses.ServerError.#Ref
		}
	}
}
