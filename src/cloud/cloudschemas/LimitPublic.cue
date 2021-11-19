package cloudschemas

import "github.com/influxdata/openapi/src/common/commonschemas"

LimitPublic: {
	type:        "object"
	description: "These are org limits similar to those configured in/by quartz."
	properties: {
		links: commonschemas.Links.#Ref
		limits: Limit.#Ref
	}
}
