package commonpaths

import (
	"github.com/influxdata/openapi/src/common/commonschemas"
)

stacks_stack_id_uninstall: post: {
	operationId: "UninstallStack"
	tags: [
		"Templates",
	]
	summary: "Uninstall a stack"
	parameters: [{
		in:       "path"
		name:     "stack_id"
		required: true
		schema: type: "string"
		description: "The identifier of the stack."
	}]
	responses: {
		"200": {
			description: "Returns the uninstalled stack."
			content: "application/json": schema: commonschemas.Stack.#Ref
		}
		default: {
			description: "Unexpected error"
			content: "application/json": schema: commonschemas.Error.#Ref
		}
	}
}
