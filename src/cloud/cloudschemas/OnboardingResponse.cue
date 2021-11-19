package cloudschemas

import "github.com/influxdata/openapi/src/common/commonschemas"

OnboardingResponse: {
	type: "object"
	properties: {
		user: commonschemas.UserResponse.#Ref
		org: commonschemas.Organization.#Ref
		bucket: commonschemas.Bucket.#Ref
		auth: Authorization.#Ref
	}
}
