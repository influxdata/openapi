package commonpaths

query_ast: post: {
	operationId: "PostQueryAst"
	description: "Analyzes flux query and generates a query specification."
	tags: [
		"Query",
	]
	summary: "Generate an Abstract Syntax Tree (AST) from a query"
	parameters: [{
		$ref: "../parameters/TraceSpan.yml"
	}, {
		in:   "header"
		name: "Content-Type"
		schema: {
			type: "string"
			enum: [
				"application/json",
			]
		}
	}]
	requestBody: {
		description: "Analyzed Flux query to generate abstract syntax tree."
		content: "application/json": schema: $ref: "../schemas/LanguageRequest.yml"
	}
	responses: {
		"200": {
			description: "Abstract syntax tree of the flux query."
			content: "application/json": schema: $ref: "../schemas/ASTResponse.yml"
		}
		default: {
			description: "Any response other than 200 is an internal server error"
			content: "application/json": schema: $ref: "../schemas/Error.yml"
		}
	}
}
