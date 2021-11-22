package unitypaths

import (
	"github.com/influxdata/openapi/src/quartz/quartzschemas"
	"github.com/influxdata/openapi/src/common/commonresponses"
	"github.com/influxdata/openapi/src/common/commonparameters"
)
operator_orgs_orgId_limits: {
	get: {
		operationId: "GetOrganizationLimitsById"
		tags: [
			"Organizations",
			"Operators",
		]
		summary: "Get the org's limits"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "orgId"
			schema: type: "string"
			required:    true
			description: "The IDPE id of the org"
		}]
		responses: {
			"200": {
				description: "Organization Limits"
				content: "application/json": schema: quartzschemas.OrgLimits.#Ref
			}
			"401": {
				description: "Unauthorized"
				commonresponses.ServerError.#Ref
			}
			"404": {
				description: "Org not found"
				commonresponses.ServerError.#Ref
			}
			default: {
				description: "Unexpected error"
				commonresponses.ServerError.#Ref
			}
		}
	}
	put: {
		operationId: "UpdateOrganizationLimitsById"
		tags: [
			"Organizations",
			"Operators",
		]
		summary: "Update the org's limits"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "orgId"
			schema: type: "string"
			required:    true
			description: "The IDPE id of the org"
		}]
		requestBody: {
			description: "Updated limits for an organization"
			required:    true
			content: "application/json": schema: quartzschemas.OrgLimits.#Ref
		}
		responses: {
			"200": {
				description: "Organization Limits"
				content: "application/json": schema: quartzschemas.OrgLimits.#Ref
			}
			"400": {
				description: "Invalid request"
				commonresponses.ServerError.#Ref
			}
			"401": {
				description: "Unauthorized"
				commonresponses.ServerError.#Ref
			}
			"404": {
				description: "Org not found"
				commonresponses.ServerError.#Ref
			}
			default: {
				description: "Unexpected error"
				commonresponses.ServerError.#Ref
			}
		}
	}
}
