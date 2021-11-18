package commonresponses

AuthorizationError: {
	// This represents the body of a 401 error from the server.
	description: """
		Unauthorized. The error may indicate one of the following:
		  * The `Authorization: Token` header is missing or malformed.
		  * The API token value is missing from the header.
		  * The token does not have sufficient permissions to write to this organization and bucket.

		"""

	content: "application/json": {
		schema: $ref: "../schemas/Error.yml"
		examples: tokenNotAuthorized: {
			summary: "Token is not authorized to access the organization or resource"
			value: {code: "unauthorized", message: "unauthorized access"}
		}
	}
}
