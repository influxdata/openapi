package unityschemas

Me: {
	properties: {
		id: {
			type:        "string"
			description: "the idpe id of the user"
		}
		email: {
			type:        "string"
			description: "the email associated with the user"
		}
		accountType: $ref: "./AccountType.yml"
		billingProvider: {
			type:        "string"
			description: "the billing provider for the account, nil if none"
			enum: [
				"zuora",
				"aws",
				"gcm",
				"azure",
			]
		}
		isRegionBeta: {
			type:        "boolean"
			description: "whether the region associated with the account is a beta region"
		}
		isOperator: {
			type:        "boolean"
			description: "whether the user is an operator"
		}
		operatorRole: {
			type:     "string"
			nullable: true
			enum: [
				"read-only",
				"read-write",
			]
			description: "role permission whether this operator is \"read-only\" | \"read-write\""
		}
		paygCreditStartDate: {
			type:        "string"
			nullable:    true
			description: "a timestamp indicates if an account is part of the payg credit experiment, nil if not"
		}
	}
	required: ["id", "accountType", "billingProvider", "email", "isOperator", "isRegionBeta"]
}
