package commonpaths

import (
	"github.com/influxdata/openapi/src/common/commonschemas"
)

stacks: {
	get: {
		operationId: "ListStacks"
		tags: [
			"Templates",
		]
		summary: "List installed templates"
		parameters: [{
			in:       "query"
			name:     "orgID"
			required: true
			schema: type: "string"
			description: "The organization ID of the stacks"
		}, {
			in:   "query"
			name: "name"
			schema: type: "string"
			description: "A collection of names to filter the list by."
		}, {
			in:   "query"
			name: "stackID"
			schema: type: "string"
			description: "A collection of stackIDs to filter the list by."
		}]
		responses: {
			"200": {
				description: "Success. Returns the list of stacks."
				content: "application/json": schema: {
					type: "object"
					properties: stacks: {
						type:  "array"
						items: commonschemas.Stack.#Ref
					}
				}
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
	post: {
		operationId: "CreateStack"
		tags: [
			"Templates",
		]
		summary: "Create a new stack"
		requestBody: {
			description: "The stack to create."
			required:    true
			content: "application/json": schema: {
				type:  "object"
				title: "PostStackRequest"
				properties: {
					orgID: type:       "string"
					name: type:        "string"
					description: type: "string"
					urls: {
						type: "array"
						items: type: "string"
					}
				}
			}
		}
		responses: {
			"201": {
				description: "Success. Returns the newly created stack."
				content: "application/json": schema: commonschemas.Stack.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
}
