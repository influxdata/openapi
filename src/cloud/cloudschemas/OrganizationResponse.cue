package cloudschemas

OrganizationResponse: {
	type: "object"
	properties: {
		orgID: {
			type:        "string"
			description: "the influxDB ID of the created organization"
		}
		userID: {
			type:        "string"
			description: "the influxDB ID of the created IDPE User"
		}
	}
}
