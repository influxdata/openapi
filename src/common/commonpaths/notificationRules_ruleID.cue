package commonpaths

import "github.com/influxdata/openapi/src/common/commonparameters"

import "github.com/influxdata/openapi/src/common/commonschemas"

notificationRules_ruleID: {
	get: {
		operationId: "GetNotificationRulesID"
		tags: [
			"NotificationRules",
		]
		summary: "Retrieve a notification rule"
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
				description: "The notification rule requested"
				content: "application/json": schema: commonschemas.NotificationRule.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
	put: {
		operationId: "PutNotificationRulesID"
		tags: [
			"NotificationRules",
		]
		summary: "Update a notification rule"
		requestBody: {
			description: "Notification rule update to apply"
			required:    true
			content: "application/json": schema: commonschemas.NotificationRule.#Ref
		}
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
				description: "An updated notification rule"
				content: "application/json": schema: commonschemas.NotificationRule.#Ref
			}
			"404": {
				description: "The notification rule was not found"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
	patch: {
		operationId: "PatchNotificationRulesID"
		tags: [
			"NotificationRules",
		]
		summary: "Update a notification rule"
		requestBody: {
			description: "Notification rule update to apply"
			required:    true
			content: "application/json": schema: commonschemas.NotificationRuleUpdate.#Ref
		}
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
				description: "An updated notification rule"
				content: "application/json": schema: commonschemas.NotificationRule.#Ref
			}
			"404": {
				description: "The notification rule was not found"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
	delete: {
		operationId: "DeleteNotificationRulesID"
		tags: [
			"NotificationRules",
		]
		summary: "Delete a notification rule"
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
			"204": description: "Delete has been accepted"
			"404": {
				description: "The check was not found"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
}
