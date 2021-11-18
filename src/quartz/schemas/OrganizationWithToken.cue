package schemas

OrganizationWithToken: allOf: [{
	$ref: "./Organization.yml"
}, {
	type: "object"
	properties: {
		token: {
			description: "Authentication token to manage the organization and its resources in IDPE"
			readOnly:    true
			type:        "string"
		}
		links: {
			description: "Links to the IDPE resources for this organization"
			readOnly:    true
			type:        "object"
			example: resource: "path/to/resource"
		}
	}
}]
