package cloudschemas

OrgSettings: {
	type: "object"
	properties: {
		orgID: {
			type:        "string"
			description: "the influxDB ID of the created organization"
		}
		settings: {
			type:  "array"
			items: OrgSetting.#Ref
		}
	}
}
