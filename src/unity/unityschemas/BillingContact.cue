package unityschemas

BillingContact: {
	properties: {
		companyName: {
			type:        "string"
			description: "name of the company billed"
		}
		email: {
			type:        "string"
			description: "billing email"
		}
		firstName: {
			type:        "string"
			description: "first name of billing contact"
		}
		lastName: {
			type:        "string"
			description: "last name of billing contact"
		}
		country: {
			type:        "string"
			description: "country of billing contact"
		}
		street1: {
			type:        "string"
			description: "street of billing contact"
		}
		street2: {
			type:        "string"
			description: "additional street info"
		}
		city: {
			type:        "string"
			description: "city of billing contact"
		}
		subdivision: {
			type:        "string"
			description: "subdivision"
		}
		postalCode: {
			type:        "string"
			description: "postal code of billing contact"
		}
	}
	required: ["companyName", "email", "firstName", "lastName", "country", "city", "postalCode"]
}
