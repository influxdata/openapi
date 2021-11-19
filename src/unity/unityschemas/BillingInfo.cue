package unityschemas

BillingInfo: {
	properties: {
		balance: {
			type:        "number"
			description: "account balance"
		}
		region: type: "string"
		paymentMethod: PaymentMethod.#Ref
		balanceUpdatedAt: {
			type:        "string"
			description: "date of last update to account"
		}
		contact: BillingContact.#Ref
	}
	required: ["balance", "balanceUpdatedAt", "contact"]
}
