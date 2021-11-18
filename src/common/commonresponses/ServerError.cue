package commonresponses

ServerError: {
	// This represents the body of any non 2XX level response from the server.
	description: "Non 2XX error response from server."
	content: "application/json": schema: $ref: "../schemas/Error.yml"
}
