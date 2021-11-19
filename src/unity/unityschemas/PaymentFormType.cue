package unityschemas

PaymentFormType: {
	type:        "string"
	description: "The name of the PaymentForm to query."
	example:     "checkout"
	enum: [
		"checkout",
		"billing",
	]
}
