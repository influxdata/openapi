package schemas

CreditCardParams: {
	properties: {
		id: {
			description: "id of the page displayed"
			readOnly:    true
			type:        "string"
		}
		tenantId: {
			description: "id of our account with the payment processor"
			type:        "string"
			readOnly:    true
		}
		key: {
			description: "payment processor secret key"
			readOnly:    true
			type:        "string"
		}
		signature: {
			description: "signature of the key or token"
			readOnly:    true
			type:        "string"
		}
		token: {
			description: "api token of the payment processor"
			readOnly:    true
			type:        "string"
		}
		style: {
			description: "way payment form gets displayed"
			type:        "string"
			readOnly:    true
		}
		submitEnabled: {
			description: "boolean string 'true' or 'false' which allows us to handle submits from our form"
			type:        "string"
			enum: [
				"true",
				"false",
			]
			readOnly: true
		}
		url: {
			type:        "string"
			readOnly:    true
			description: "uri of the embedded iframe"
		}
	}
	required: ["id", "tenantId", "key", "signature", "token", "style", "submitEnabled", "url"]
}
