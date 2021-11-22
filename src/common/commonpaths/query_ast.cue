package commonpaths

import (
	"github.com/influxdata/openapi/src/common/commonparameters"

	"github.com/influxdata/openapi/src/common/commonschemas"

)

query_ast: post: {
	operationId: "PostQueryAst"
	description: "Analyzes flux query and generates a query specification."
	tags: [
		"Query",
	]
	summary: "Generate an Abstract Syntax Tree (AST) from a query"
	parameters: [{
		commonparameters.TraceSpan.#Ref
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
		content: "application/json": schema: commonschemas.LanguageRequest.#Ref
	}
	responses: {
		"200": {
			description: "Abstract syntax tree of the flux query."
			content: "application/json": schema: commonschemas.ASTResponse.#Ref
		}
		default: {
			description: "Any response other than 200 is an internal server error"
			content: "application/json": schema: commonschemas.Error.#Ref
		}
	}
}
