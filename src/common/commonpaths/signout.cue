package commonpaths

import (
	"github.com/influxdata/openapi/src/common/commonparameters"
	"github.com/influxdata/openapi/src/common/commonschemas"
)

signout: post: {
	operationId: "PostSignout"
	summary:     "Expire the current UI session"
	tags: [
		"Signout",
	]
	description: "Expires the current UI session for the user."
	parameters: [{
		commonparameters.TraceSpan.#Ref
	}]
	responses: {
		"204": description: "Session successfully expired"
		"401": {
			description: "Unauthorized access"
			content: "application/json": schema: commonschemas.Error.#Ref
		}
		default: {
			description: "Unsuccessful session expiry"
			content: "application/json": schema: commonschemas.Error.#Ref
		}
	}
}
