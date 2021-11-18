package schemas

Invoice: {
	properties: {
		id: {
			description: "id of the invoice"
			type:        "string"
		}
		status: {
			description: "status of the invoice"
			readOnly:    true
			type:        "string"
		}
		amount: {
			description: "amount of invoice in dollars"
			type:        "number"
			readOnly:    true
		}
		targetDate: {
			description: "date of invoice"
			readOnly:    true
			type:        "string"
		}
	}
	required: ["id", "status", "amount", "targetDate"]
}
