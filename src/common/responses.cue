package common

import "github.com/influxdata/openapi/src/common/responses"

#Responses: {
	...
	"401": responses.AuthorizationError
	"404": responses.ResourceNotFoundError
	"500": responses.InternalServerError
	ServerError: responses.ServerError
	default: responses.ServerError
}
