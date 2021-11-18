package schemas

Account: {
	properties: {
		id: {
			type:        "number"
			description: "account id in quartz"
		}
		isActive: {
			type:        "boolean"
			description: "is this the currently active account in the session?"
		}
		isDefault: {
			type:        "boolean"
			description: "is this the user's default account?"
		}
		name: {
			type:        "string"
			description: "name of the account"
		}
	}
	required: ["id", "isActive", "isDefault", "name"]
}
