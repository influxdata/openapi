package commonresponses
import "github.com/influxdata/openapi/src/common/commonschemas"
ServerError: {
	// This represents the body of any non 2XX level response from the server.
	description: "Non 2XX error response from server."
	content: "application/json": schema: commonschemas.Error.#Ref
}
