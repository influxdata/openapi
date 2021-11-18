package paths

billing_invoices_invoiceId: get: {
	operationId: "GetInvoicesId"
	tags: [
		"Billing",
	]
	parameters: [{
		$ref: "../../common/parameters/TraceSpan.yml"
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
			$ref:        "../../common/responses/ServerError.yml"
		}
		"404": {
			description: "Invoice not found"
			$ref:        "../../common/responses/ServerError.yml"
		}
		default: {
			description: "Unexpected error"
			$ref:        "../../common/responses/ServerError.yml"
		}
	}
}
