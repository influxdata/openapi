package schemas

RelatedAccount: {
	description: "Subset of Account data related to the organization"
	type:        "object"
	properties: {
		id: {
			type:        "number"
			description: "account id in quartz"
		}
		type: $ref: "./AccountType.yml"
		balance: {
			type:        "number"
			description: "remaining balance on the account, nil if none"
		}
		billingContact: {
			$ref:        "./BillingContact.yml"
			description: "billing contact for the account"
		}
		updatedAt: {
			type:        "string"
			description: "date of last update to account"
		}
	}
	required: ["id", "balance", "type", "updatedAt"]
}
