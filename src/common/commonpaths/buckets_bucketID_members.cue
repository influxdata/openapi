package commonpaths

buckets_bucketID_members: {
	get: {
		operationId: "GetBucketsIDMembers"
		tags: [
			"Buckets",
		]
		summary: "List all users with member privileges for a bucket"
		parameters: [{
			$ref: "../parameters/TraceSpan.yml"
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
				content: "application/json": schema: $ref: "../schemas/ResourceMembers.yml"
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
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
			$ref: "../parameters/TraceSpan.yml"
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
			content: "application/json": schema: $ref: "../schemas/AddResourceMemberRequestBody.yml"
		}
		responses: {
			"201": {
				description: "Member added to bucket"
				content: "application/json": schema: $ref: "../schemas/ResourceMember.yml"
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
}
