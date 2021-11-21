package contracts

import "github.com/influxdata/openapi/src/common/commonresponses"

import "github.com/influxdata/openapi/src/cloud/cloudschemas"

import cloudpathspkg "github.com/influxdata/openapi/src/cloud/cloudpaths"

import commonpkg "github.com/influxdata/openapi/src/common"

all: cloud: #Cloud & {
	#DocsURL: #CloudDocsURL
}

#_: all: "cloud-diff": #Cloud & {
	#DocsURL: "{{% INFLUXDB_DOCS_URL %}}"
}

#Cloud: {
	// This is only here so that it can be customized for the "cloud-diff" output;
	// otherwise we could just use #CloudDocsURL directly.
	#DocsURL: string
	let docsURL = #DocsURL
	let common = commonpkg & {
		#DocsURL: docsURL
	}
	let cloudpaths = cloudpathspkg & {
		#DocsURL: docsURL
	}
	openapi: "3.0.0"
	info: {
		title:   "Influx Cloud API Service"
		version: "2.0.1"
		description: """
			The InfluxDB v2 API provides a programmatic interface for all interactions with InfluxDB. Access the InfluxDB API using the `/api/v2/` endpoint.

			"""
	}

	servers: [{
		url: "/api/v2"
	}]
	tags: [{
		name: "Authentication"
		description: """
			Use one of the following schemes to authenticate to the InfluxDB API:
			- [Token authentication](#section/Authentication/TokenAuthentication)
			- [Basic authentication](#section/Authentication/BasicAuthentication)
			- [Querystring authentication](#section/Authentication/QuerystringAuthentication)
			<!-- ReDoc-Inject: <security-definitions> -->

			"""

		"x-traitTag": true
	}, {
		common.#QuickStart
	}, {
		common.#ResponseCodes
	}, {
		name: "Query"
		description: """
			Retrieve data, analyze queries, and get query suggestions.

			"""
	}, {
		name: "Write"
		description: """
			Write time series data to buckets.

			"""
	}, {
		name:        "Authorizations"
		description: """
			Create and manage API tokens. An **authorization** associates a list of permissions to an **organization** and provides a token for API access. Optionally, you can restrict an authorization and its token to a specific user.

			For more information and examples, see the following:
			  - [Authorize API requests](\(#CloudDocsURL)/api-guide/api_intro/#authentication).
			  - [Manage API tokens](\(#CloudDocsURL)/security/tokens).
			  - [Assign a token to a specific user](\(#CloudDocsURL)/security/tokens/create-token).

			"""
	}]

	"x-tagGroups": [{
		name: "Overview"
		tags: [
			"Quick start",
			"Authentication",
			"Response codes",
		]
	}, {
		name: "Data I/O endpoints"
		tags: [
			"Write",
			"Query",
		]
	}, {
		name: "Resource endpoints"
		tags: [
			"Buckets",
			"Dashboards",
			"Tasks",
			"Resources",
		]
	}, {
		name: "Security and access endpoints"
		tags: [
			"Authorizations",
			"Organizations",
			"Users",
		]
	}, {
		name: "System information endpoints"
		tags: [
			"Ping",
			"Routes",
		]
	}, {
		name: "All endpoints"
		tags: [
			"Annotations",
			"Authorizations",
			"Buckets",
			"Cells",
			"Checks",
			"DBRPs",
			"Dashboards",
			"Delete",
			"DemoDataBuckets",
			"Invocable Scripts",
			"Labels",
			"Limits",
			"NotificationEndpoints",
			"NotificationRules",
			"OAuth",
			"Organizations",
			"Ping",
			"Public Flags",
			"Query",
			"Resources",
			"Routes",
			"Rules",
			"Secrets",
			"Setup",
			"Signin",
			"Signout",
			"Streams",
			"Tasks",
			"Telegraf Plugins",
			"Telegrafs",
			"Templates",
			"Usage",
			"Users",
			"Variables",
			"Write",
		]
	}]
	paths: {
		common.#Paths
		"/users":                                                  cloudpaths.users
		"/users/{userID}":                                         cloudpaths.users_userID
		"/setup":                                                  cloudpaths.setup
		"/setup/user":                                             cloudpaths.setup_user
		"/authorizations":                                         cloudpaths.authorizations
		"/experimental/sampledata/buckets":                        cloudpaths.experimental_sampledata_buckets
		"/experimental/sampledata/buckets/{bucketID}/members":     cloudpaths.experimental_sampledata_buckets_members
		"/authorizations/{authID}":                                cloudpaths.authorizations_authID
		"/variables":                                              cloudpaths.variables
		"/variables/{variableID}":                                 cloudpaths.variables_variableID
		"/buckets/{bucketID}/schema/measurements":                 cloudpaths.measurements
		"/buckets/{bucketID}/schema/measurements/{measurementID}": cloudpaths.measurements_measurementID
		"/orgs/{orgID}/limits":                                    cloudpaths.orgs_orgID_limits_get
		"/orgs/{orgID}/usage":                                     cloudpaths.orgs_orgID_usage
		"/dashboards":                                             cloudpaths.dashboards
		"/tasks":                                                  cloudpaths.tasks
		"/write":                                                  cloudpaths.write
	}
	components: {
		parameters: common.#Parameters
		schemas: {
			common.#Schemas
			DemoDataBucket:                 cloudschemas.DemoDataBucket
			DemoDataBuckets:                cloudschemas.DemoDataBuckets
			Resource:                       cloudschemas.Resource
			Permission:                     cloudschemas.Permission
			Authorization:                  cloudschemas.Authorization
			Authorizations:                 cloudschemas.Authorizations
			User:                           cloudschemas.User
			Users:                          cloudschemas.Users
			OnboardingRequest:              cloudschemas.OnboardingRequest
			OnboardingResponse:             cloudschemas.OnboardingResponse
			Limit:                          cloudschemas.Limit
			Variable:                       cloudschemas.Variable
			Variables:                      cloudschemas.Variables
			ColumnDataType:                 cloudschemas.ColumnDataType
			ColumnSemanticType:             cloudschemas.ColumnSemanticType
			MeasurementSchema:              cloudschemas.MeasurementSchema
			MeasurementSchemaColumn:        cloudschemas.MeasurementSchemaColumn
			MeasurementSchemaCreateRequest: cloudschemas.MeasurementSchemaCreateRequest
			MeasurementSchemaList:          cloudschemas.MeasurementSchemaList
			MeasurementSchemaUpdateRequest: cloudschemas.MeasurementSchemaUpdateRequest
		}
		responses: ServerError: commonresponses.ServerError
		securitySchemes: {
			TokenAuthentication: {
				type:         "http"
				scheme:       "token"
				bearerFormat: "InfluxDB token string"
				description:  """
					### Token authentication scheme

					InfluxDB API tokens ensure secure interaction between users and data. A token belongs to an organization and identifies InfluxDB permissions within the organization.

					Include your API token in an `Authorization: Token INFLUX_TOKEN` HTTP header with each request.

					#### Example

					`curl https://us-east-1-1.aws.cloud2.influxdata.com/
					   --header \"Authorization: Token INFLUX_API_TOKEN\"`

					Replace *`INFLUX_API_TOKEN`* with your [InfluxDB API token](\(#CloudDocsURL)/reference/glossary/#token).

					For more information and examples, see the following:
					  - [`/authorizations`](#tag/Authorizations) endpoint.
					  - [Authorize API requests](\(#CloudDocsURL)/api-guide/api_intro/#authentication).
					  - [Manage API tokens](\(#CloudDocsURL)/security/tokens).
					  - [Assign a token to a specific user](\(#CloudDocsURL)/security/tokens/create-token).

					"""
			}

			BasicAuthentication: {
				type:        "http"
				scheme:      "basic"
				description: """
					### Basic authentication scheme

					Use the HTTP Basic authentication scheme with clients that support the InfluxDB 1.x convention of username and password (that don't support the `Authorization: Token` scheme):
					  - **username**: InfluxDB Cloud username
					  - **password**: InfluxDB Cloud API token

					#### Example

					`curl --get \"https://europe-west1-1.gcp.cloud2.influxdata.com/query\"
					      --user \"exampleuser@influxdata.com\":\"INFLUX_API_TOKEN\"`

					Replace the following:
					- *`exampleuser@influxdata.com`*: the email address that you signed up with
					- *`INFLUX_API_TOKEN`*: your [InfluxDB API token](\(#CloudDocsURL)/reference/glossary/#token)

					For more information and examples, see how to [authenticate with a username and password](\(#CloudDocsURL)/reference/api/influxdb-1x/).

					"""
			}

			QuerystringAuthentication: {
				type:        "apiKey"
				in:          "query"
				name:        "u=&p="
				description: """
					### Querystring authentication scheme

					Use InfluxDB 1.x API parameters to provide credentials through the query string.

					Username and password schemes require the following credentials:
					- **username**: InfluxDB Cloud username
					- **password**: InfluxDB Cloud API token

					#### Example

					`curl --get \"https://europe-west1-1.gcp.cloud2.influxdata.com/query\"
					      --data-urlencode \"u=exampleuser@influxdata.com\"
					      --data-urlencode \"p=INFLUX_API_TOKEN\"`

					Replace the following:
					- *`exampleuser@influxdata.com`*: the email address that you signed up with
					- *`INFLUX_API_TOKEN`*: your [InfluxDB API token](\(#CloudDocsURL)/reference/glossary/#token)

					For more information and examples, see how to [authenticate with a username and password scheme](\(#CloudDocsURL)/reference/api/influxdb-1x/).

					"""
			}
		}
	}

	security: [{
		TokenAuthentication: []
	}, {
		BasicAuthentication: []
	}, {
		QuerystringAuthentication: []
	}]
}
