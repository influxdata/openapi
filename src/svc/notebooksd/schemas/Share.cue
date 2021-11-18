package schemas

Share: properties: {
	id: type: "string"
	orgID: type: "string"
	notebookID: type: "string"
	accessID: type: "string"
	token: type: "object"
	region: type: "string"
	createdAt: {
		type:   "string"
		format: "date-time"
	}
	updatedAt: {
		type:   "string"
		format: "date-time"
	}
}
