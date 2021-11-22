package common

import (
	"github.com/influxdata/openapi/src/common/commonresponses"
)

#Responses: {
	...
	"401":       commonresponses.AuthorizationError
	"404":       commonresponses.ResourceNotFoundError
	"500":       commonresponses.InternalServerError
	ServerError: commonresponses.ServerError
	default:     commonresponses.ServerError
}
