package cloudschemas

import (
	"github.com/influxdata/openapi/src/common/commonschemas"
)

OnboardingResponse: {
	type: "object"
	properties: {
		user:   *commonschemas.UserResponse.#Ref | commonschemas.UserResponse
		org:    *commonschemas.Organization.#Ref | commonschemas.Organization
		bucket: *commonschemas.Bucket.#Ref | commonschemas.Bucket
		auth:   *Authorization.#Ref | Authorization
	}
}
