package ossschemas

PostRestoreKVResponse: {
	type: "object"
	properties: token: {
		description: "token is the root token for the instance after restore (this is overwritten during the restore)"
		type:        "string"
	}
}
