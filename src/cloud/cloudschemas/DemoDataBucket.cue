package cloudschemas

import (
	"github.com/influxdata/openapi/src/common/commonschemas"
)

DemoDataBucket: {
	properties: {
		links: {
			type:     "object"
			readOnly: true
			example: {
				labels:  "/api/v2/buckets/1/labels"
				members: "/api/v2/buckets/1/members"
				org:     "/api/v2/orgs/2"
				owners:  "/api/v2/buckets/1/owners"
				self:    "/api/v2/buckets/1"
				write:   "/api/v2/write?org=2&bucket=1"
			}
			properties: {
				labels: {
					description: "URL to retrieve labels for this bucket"
					commonschemas.Link.#Ref
				}
				members: {
					description: "URL to retrieve members that can read this bucket"
					commonschemas.Link.#Ref
				}
				org: {
					description: "URL to retrieve parent organization for this bucket"
					commonschemas.Link.#Ref
				}
				owners: {
					description: "URL to retrieve owners that can read and write to this bucket."
					commonschemas.Link.#Ref
				}
				self: {
					description: "URL for this bucket"
					commonschemas.Link.#Ref
				}
				write: {
					description: "URL to write line protocol for this bucket"
					commonschemas.Link.#Ref
				}
			}
		}
		id: {
			readOnly: true
			type:     "string"
		}
		type: {
			readOnly: true
			type:     "string"
			default:  "demodata"
		}
		name: type:        "string"
		description: type: "string"
		orgID: type:       "string"
		rp: type:          "string"
		schemaType: {
			commonschemas.SchemaType.#Ref
			default: "implicit"
		}
		createdAt: {
			type:     "string"
			format:   "date-time"
			readOnly: true
		}
		updatedAt: {
			type:     "string"
			format:   "date-time"
			readOnly: true
		}
		retentionRules: commonschemas.RetentionRules.#Ref
		labels:         commonschemas.Labels.#Ref
	}
	required: ["name", "retentionRules"]
}
