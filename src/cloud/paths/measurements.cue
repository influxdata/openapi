package paths

measurements: {
	summary: "Bucket schemas"
	get: {
		summary:     "List all measurement schemas of a bucket"
		operationId: "getMeasurementSchemas"
		parameters: [{
			in:          "query"
			name:        "org"
			description: "The name of the organization."
			schema: type: "string"
		}, {
			in:          "query"
			name:        "orgID"
			description: "The identifier of the organization."
			schema: type: "string"
		}, {
			in:          "query"
			name:        "name"
			description: "The name of the measurement to return schemas for."
			schema: type: "string"
		}, {
			in:          "path"
			name:        "bucketID"
			description: "The identifier of the bucket."
			schema: type: "string"
			required: true
		}]
		tags: [
			"Bucket Schemas",
		]
		responses: {
			"200": {
				description: "A list of measurement schemas returning summary information."
				headers: ETag: {
					description: "The current version of the bucket schema"
					schema: type: "string"
				}
				content: "application/json": schema: $ref: "../schemas/MeasurementSchemaList.yml"
			}
			"404": {
				description: "Bucket not found"
				$ref:        "../../common/responses/ServerError.yml"
			}
		}
	}
	post: {
		summary:     "Create a measurement schema for a bucket"
		operationId: "createMeasurementSchema"
		parameters: [{
			in:          "query"
			name:        "org"
			description: "The name of the organization."
			schema: type: "string"
		}, {
			in:          "query"
			name:        "orgID"
			description: "The identifier of the organization."
			schema: type: "string"
		}, {
			in:          "path"
			name:        "bucketID"
			description: "The identifier of the bucket."
			schema: type: "string"
			required: true
		}]
		tags: [
			"Bucket Schemas",
		]
		requestBody: content: "application/json": schema: $ref: "../schemas/MeasurementSchemaCreateRequest.yml"
		responses: {
			"201": {
				description: "The created measurement schema."
				headers: ETag: {
					description: "The current version of the measurement schema"
					schema: type: "string"
				}
				content: "application/json": schema: $ref: "../schemas/MeasurementSchema.yml"
			}
			"400": {
				description: "Client error with create request"
				content: "application/json": {
					examples: {
						badNameExample: {
							summary:     "Invalid name"
							description: "The error returned when the name is invalid, such as too few or too many characters or the name contains non-printable ASCII or is not valid UTF-8."

							value: {
								code:    "invalid"
								message: "name is invalid"
							}
						}
						missingColumnsExample: {
							summary:     "Missing columns"
							description: "The error returned when the request body is missing the columns property."

							value: {
								code:    "invalid"
								message: "columns is required"
							}
						}
						missingTimestampExample: {
							summary:     "Missing timestamp"
							description: "The error returned when the request body is missing a timestamp type column."

							value: {
								code:    "invalid"
								message: "Timestamp column is required"
							}
						}
						duplicateColumnNamesExample: {
							summary:     "Duplicate column names"
							description: "The error returned when the request body contains duplicate column names."

							value: {
								code:    "invalid"
								message: "Duplicate column names"
							}
						}
						missingFieldExample: {
							summary:     "Missing field"
							description: "The error returned when the request body is missing at least one field type column."

							value: {
								code:    "invalid"
								message: "At least one field column is required"
							}
						}
					}
					schema: $ref: "../../common/schemas/Error.yml"
				}
			}
		}
	}
}
