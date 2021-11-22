package commonpaths

import (
	"github.com/influxdata/openapi/src/common/commonparameters"

	"github.com/influxdata/openapi/src/common/commonschemas"

)

notificationRules_ruleID_labels: {
	get: {
		operationId: "GetNotificationRulesIDLabels"
		tags: [
			"NotificationRules",
		]
		summary: "List all labels for a notification rule"
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
				description: "A list of all labels for a notification rule"
				content: "application/json": schema: commonschemas.LabelsResponse.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
	post: {
		operationId: "PostNotificationRuleIDLabels"
		tags: [
			"NotificationRules",
		]
		summary: "Add a label to a notification rule"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "ruleID"
			schema: type: "string"
			required:    true
			description: "The notification rule ID."
		}]
		requestBody: {
			description: "Label to add"
			required:    true
			content: "application/json": schema: commonschemas.LabelMapping.#Ref
		}
		responses: {
			"201": {
				description: "The label was added to the notification rule"
				content: "application/json": schema: commonschemas.LabelResponse.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
}
