package schemas

Datasource: {
	title:       "Datasource"
	type:        "object"
	description: "Data Source containing telegraf plugin name and configuration"
	properties: {
		id: {
			type:     "integer"
			readOnly: true
		}
		orgID: type: "string"
		name: type: "string"
		config: {
			type:        "object"
			description: "an object containing the configuration for the plugin"
		}
		createdBy: {
			type:     "string"
			readOnly: true
		}
		createdAt: {
			type:     "string"
			readOnly: true
		}
		state: {
			type: "string"
			enum: [
				"running",
				"paused",
			]
			readOnly: true
		}
	}
	required: [
		"orgID",
		"name",
	]
}
