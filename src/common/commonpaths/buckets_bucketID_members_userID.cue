package commonpaths

import "github.com/influxdata/openapi/src/common/commonparameters"

import "github.com/influxdata/openapi/src/common/commonschemas"

buckets_bucketID_members_userID: delete: {
	operationId: "DeleteBucketsIDMembersID"
	tags: [
		"Buckets",
	]
	summary: "Remove a member from a bucket"
	parameters: [{
		commonparameters.TraceSpan.#Ref
	}, {
		in:   "path"
		name: "userID"
		schema: type: "string"
		required:    true
		description: "The ID of the member to remove."
	}, {
		in:   "path"
		name: "bucketID"
		schema: type: "string"
		required:    true
		description: "The bucket ID."
	}]
	responses: {
		"204": description: "Member removed"
		default: {
			description: "Unexpected error"
			content: "application/json": schema: commonschemas.Error.#Ref
		}
	}
}
