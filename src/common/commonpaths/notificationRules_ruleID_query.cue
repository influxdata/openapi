package commonpaths

import (
	"github.com/influxdata/openapi/src/common/commonparameters"
	"github.com/influxdata/openapi/src/common/commonschemas"
)

notificationRules_ruleID_query: get: {
	operationId: "GetNotificationRulesIDQuery"
	tags: [
		"Rules",
	]
	summary: "Retrieve a notification rule query"
	parameters: [{
		commonparameters.TraceSpan.#Ref
	}, {
		in:   "path"
		name: "ruleID"
		schema: type: "string"
		required:    true
		description: "The notification rule ID."
	}]
	responses: {
		"200": {
			description: "The notification rule query requested"
			content: "application/json": schema: commonschemas.FluxResponse.#Ref
		}
		"400": {
			description: "Invalid request"
			content: "application/json": schema: commonschemas.Error.#Ref
		}
		"404": {
			description: "Notification rule not found"
			content: "application/json": schema: commonschemas.Error.#Ref
		}
		default: {
			description: "Unexpected error"
			content: "application/json": schema: commonschemas.Error.#Ref
		}
	}
}
