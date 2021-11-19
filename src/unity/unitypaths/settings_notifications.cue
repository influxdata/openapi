package unitypaths

import "github.com/influxdata/openapi/src/unity/unityschemas"

import "github.com/influxdata/openapi/src/common/commonresponses"

settings_notifications: {
	get: {
		operationId: "GetSettingsNotifications"
		tags: [
			"Settings",
		]
		responses: {
			"200": {
				description: "Settings for billing notifications"
				content: "application/json": schema: unityschemas.BillingNotifySettings.#Ref
			}
			"401": {
				description: "Unauthorized"
				commonresponses.ServerError.#Ref
			}
			"404": {
				description: "Notification Settings nil or User/Org not found"
				commonresponses.ServerError.#Ref
			}
			"406": {
				description: "Not Acceptable"
				commonresponses.ServerError.#Ref
			}
			default: {
				description: "Unexpected error"
				commonresponses.ServerError.#Ref
			}
		}
	}
	put: {
		operationId: "PutSettingsNotifications"
		tags: [
			"Settings",
		]
		requestBody: {
			description: "Update to notify setting"
			required:    true
			content: "application/json": schema: unityschemas.BillingNotifySettings.#Ref
		}
		responses: {
			"200": {
				description: "billing notification settings updated"
				content: "application/json": schema: unityschemas.BillingNotifySettings.#Ref
			}
			"400": {
				description: "Bad Request"
				commonresponses.ServerError.#Ref
			}
			"401": {
				description: "Unauthorized"
				commonresponses.ServerError.#Ref
			}
			default: {
				description: "Unexpected error"
				commonresponses.ServerError.#Ref
			}
		}
	}
}
