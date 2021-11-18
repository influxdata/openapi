package commonpaths

me_password: put: {
	operationId: "PutMePassword"
	tags: [
		"Users",
	]
	summary: "Update a password"
	security: [{
		BasicAuthentication: [

		]}]
	parameters: [{
		$ref: "../parameters/TraceSpan.yml"
	}]
	requestBody: {
		description: "New password"
		required:    true
		content: "application/json": schema: $ref: "../schemas/PasswordResetBody.yml"
	}
	responses: {
		"204": description: "Password successfully updated"
		default: {
			description: "Unsuccessful authentication"
			content: "application/json": schema: $ref: "../schemas/Error.yml"
		}
	}
}
