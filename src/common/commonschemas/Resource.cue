package commonschemas

Resource: {
	type: "object"
	required: ["type"]
	properties: {
		type: {
			type: "string"
			enum: [
				"authorizations",
				"buckets",
				"dashboards",
				"orgs",
				"sources",
				"tasks",
				"telegrafs",
				"users",
				"variables",
				"scrapers",
				"secrets",
				"labels",
				"views",
				"documents",
				"notificationRules",
				"notificationEndpoints",
				"checks",
				"dbrp",
				"notebooks",
				"annotations",
				"remotes",
				"replications",
			]
		}
		id: {
			type:        "string"
			description: "If ID is set that is a permission for a specific resource. if it is not set it is a permission for all resources of that resource type."
		}
		name: {
			type:        "string"
			description: "Optional name of the resource if the resource has a name field."
		}
		orgID: {
			type:        "string"
			description: "If orgID is set that is a permission for all resources owned my that org. if it is not set it is a permission for all resources of that resource type."
		}
		org: {
			type:        "string"
			description: "Optional name of the organization of the organization with orgID."
		}
	}
}
