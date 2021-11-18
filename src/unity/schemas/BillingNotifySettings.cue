package schemas

BillingNotifySettings: {
	properties: {
		isNotify: {
			description: "opt in to threshold notifications"
			type:        "boolean"
		}
		balanceThreshold: {
			type:        "number"
			description: "threshold that when passed will trigger a notification"
		}
		notifyEmail: {
			type:        "string"
			description: "email to send notification"
		}
	}
	required: ["isNotify", "balanceThreshold", "notifyEmail"]
}
