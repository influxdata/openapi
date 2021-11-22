package commonpaths

import (
	"github.com/influxdata/openapi/src/common/commonparameters"

	"github.com/influxdata/openapi/src/common/commonschemas"

)

buckets_bucketID_members: {
	get: {
		operationId: "GetBucketsIDMembers"
		tags: [
			"Buckets",
		]
		summary: "List all users with member privileges for a bucket"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "bucketID"
			schema: type: "string"
			required:    true
			description: "The bucket ID."
		}]
		responses: {
			"200": {
				description: "A list of bucket members"
				content: "application/json": schema: commonschemas.ResourceMembers.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
	post: {
		operationId: "PostBucketsIDMembers"
		tags: [
			"Buckets",
		]
		summary: "Add a member to a bucket"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "bucketID"
			schema: type: "string"
			required:    true
			description: "The bucket ID."
		}]
		requestBody: {
			description: "User to add as member"
			required:    true
			content: "application/json": schema: commonschemas.AddResourceMemberRequestBody.#Ref
		}
		responses: {
			"201": {
				description: "Member added to bucket"
				content: "application/json": schema: commonschemas.ResourceMember.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
}
