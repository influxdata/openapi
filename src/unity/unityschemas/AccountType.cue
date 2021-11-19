package unityschemas

AccountType: {
	type:        "string"
	description: "type of the account"
	enum: [
		"cancelled",
		"contract",
		"free",
		"pay_as_you_go",
	]
}
