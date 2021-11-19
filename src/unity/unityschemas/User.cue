package unityschemas

User: {
	properties: {
		email: {
			type:        "string"
			description: "user's email"
		}
		firstName: {
			type:        "string"
			description: "user's first name"
		}
		id: {
			type:        "string"
			description: "user's id in quartz"
		}
		idpeId: {
			type:        "string"
			description: "user's id in idpe"
		}
		lastName: {
			type:        "string"
			description: "user's last name"
		}
		operator: {
			type:        "boolean"
			description: "whether or not the user is an operator"
		}
		sfdcContactId: {
			type:        "string"
			description: "the contact id of the user in salesforce"
		}
	}
	required: ["firstName", "id", "idpeId", "lastName"]
}
