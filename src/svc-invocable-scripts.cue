package contracts

import (
	"github.com/influxdata/openapi/src/svc/invocable-scripts/invocablescriptsschemas"

	"github.com/influxdata/openapi/src/svc/invocable-scripts/invocablescriptspaths"

	"github.com/influxdata/openapi/src/common/commonschemas"

	"github.com/influxdata/openapi/src/common/commonresponses"

)

all: "svc-invocable-scripts": {
	openapi: "3.0.0"
	info: {
		title:   "InfluxData Invocable Scripts API"
		version: "0.1.0"
		description: """
			Manage and execute scripts as API endpoints in InfluxDB.

			An API Invocable Script assigns your custom Flux script to a new InfluxDB API endpoint for your organization.
			Invocable scripts let you execute your script as an HTTP request to the endpoint.

			Invocable scripts accept parameters. Add parameter references in your script as `params.myparameter`.
			When you `invoke` your script, you send parameters as key-value pairs in the `params` object.
			InfluxDB executes your script with the key-value pairs as arguments and returns the result.

			For more information and examples, see [Invoke custom scripts](https://docs.influxdata.com/influxdb/cloud/api-guide/api-invocable-scripts).

			"""
	}

	servers: [{
		url: "/api/v2"
	}]
	paths: {
		"/scripts":                   invocablescriptspaths.scripts
		"/scripts/{scriptID}":        invocablescriptspaths.scripts_scriptID
		"/scripts/{scriptID}/invoke": invocablescriptspaths.scripts_scriptID_invoke
	}
	components: {
		responses: ServerError: commonresponses.ServerError
		schemas: {
			Error:                  commonschemas.Error
			Script:                 invocablescriptsschemas.Script
			Scripts:                invocablescriptsschemas.Scripts
			ScriptCreateRequest:    invocablescriptsschemas.ScriptCreateRequest
			ScriptUpdateRequest:    invocablescriptsschemas.ScriptUpdateRequest
			ScriptHTTPResponseData: invocablescriptsschemas.ScriptHTTPResponseData
			ScriptInvocationParams: invocablescriptsschemas.ScriptInvocationParams
			ScriptLanguage:         invocablescriptsschemas.ScriptLanguage
		}
	}
}
