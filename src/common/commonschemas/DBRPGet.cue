package commonschemas

DBRPGet: {
	type: "object"
	properties: content: {
		$ref:     "./DBRP.yml"
		required: true
	}
}
