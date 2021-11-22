package unitypaths

import (
	"github.com/influxdata/openapi/src/quartz/quartzschemas"
	"github.com/influxdata/openapi/src/common/commonresponses"
)
orgs_orgId_limits: {
	get: {
		operationId: "GetOrgsIdLimits"
		tags: [
			"Organizations",
			"Operators",
		]
		summary: "Get the limits of an organization"
		parameters: [{
			in:   "path"
			name: "orgId"
			schema: type: "string"
			required:    true
			description: "The ID of the organization"
		}]
		responses: {
			"200": {
				description: "Organization limits"
				content: "application/json": schema: quartzschemas.OrgLimits.#Ref
			}
			default: {
				description: "Unexpected error"
				commonresponses.ServerError.#Ref
			}
		}
	}
	put: {
		operationId: "PutOrgsIdLimits"
		tags: [
			"Organizations",
			"Operators",
		]
		summary: "Update the limits of an organization"
		requestBody: content: "application/json; charset=utf-8": schema: type: "object"
		parameters: [{
			in:   "path"
			name: "orgId"
			schema: type: "string"
			required:    true
			description: "The ID of the organization"
		}]
		responses: {
			"200": {
				description: "Organization limits"
				content: "application/json": schema: quartzschemas.OrgLimits.#Ref
			}
			default: {
				description: "Unexpected error"
				commonresponses.ServerError.#Ref
			}
		}
	}
}
