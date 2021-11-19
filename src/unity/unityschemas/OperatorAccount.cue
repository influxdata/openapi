package unityschemas

OperatorAccount: {
	properties: {
		id: {
			type:        "number"
			description: "account id in quartz"
		}
		type: $ref: "./AccountType.yml"
		zuoraAccountId: {
			type:        "string"
			description: "Zuora ID associated with the account"
		}
		deletable: {
			type:        "boolean"
			description: "flag whether the account can be deleted or not"
		}
		balance: {
			type:        "number"
			description: "remaining balance on the account, nil if none"
		}
		billingContact: {
			$ref:        "./BillingContact.yml"
			description: "billing contact for the account"
		}
		users: {
			type: "array"
			$ref: "./Users.yml"
		}
		marketplaceSubscription: {
			$ref:        "./MarketplaceSubscription.yml"
			description: "which marketplace, nil if none"
		}
	}
	required: ["id", "account", "balance", "billingContact", "marketplaceSubscription", "type", "users"]
}
