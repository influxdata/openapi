package contracts

import (
	"github.com/influxdata/openapi/src/common/commonpaths"
	"github.com/influxdata/openapi/src/common/commonresponses"
	"github.com/influxdata/openapi/src/common/commonschemas"
	"github.com/influxdata/openapi/src/common"
	"github.com/influxdata/openapi/src/oss/osspaths"
	"github.com/influxdata/openapi/src/oss/ossschemas"
)

oss: {
	openapi: "3.0.0"
	info: {
		title:   "Influx OSS API Service"
		version: "2.0.0"
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
		name: "Authorizations"
		description: """
			Create and manage API tokens. An **authorization** associates a list of permissions to an **organization** and provides a token for API access. Optionally, you can restrict an authorization and its token to a specific user.

			For more information and examples, see the following:
			  - [Authorize API requests]({{% INFLUXDB_DOCS_URL %}}/api-guide/api_intro/#authentication).
			  - [Manage API tokens]({{% INFLUXDB_DOCS_URL %}}/security/tokens).
			  - [Assign a token to a specific user]({{% INFLUXDB_DOCS_URL %}}/security/tokens/create-token).

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
			"Health",
			"Ping",
			"Ready",
			"Routes",
		]
	}, {
		name: "All endpoints"
		tags: [
			"Authorizations",
			"Backup",
			"Buckets",
			"Cells",
			"Checks",
			"DBRPs",
			"Dashboards",
			"Delete",
			"Health",
			"Labels",
			"Legacy Authorizations",
			"NotificationEndpoints",
			"NotificationRules",
			"Organizations",
			"Ping",
			"Query",
			"Ready",
			"RemoteConnections",
			"Replications",
			"Resources",
			"Restore",
			"Routes",
			"Rules",
			"Scraper Targets",
			"Secrets",
			"Setup",
			"Signin",
			"Signout",
			"Sources",
			"Tasks",
			"Telegraf Plugins",
			"Telegrafs",
			"Templates",
			"Users",
			"Variables",
			"Write",
		]
	}]
	paths: {
		common.#Paths
		"/health": osspaths.health
		"/ready": osspaths.ready
		"/users": commonpaths.users
		"/users/{userID}": commonpaths.users_userID
		"/setup": commonpaths.setup
		"/authorizations": commonpaths.authorizations
		"/authorizations/{authID}": commonpaths.authorizations_authID
		"/legacy/authorizations": {
			servers: [{
				url: "/private"
			}]
			osspaths.legacy_authorizations
		}
		"/legacy/authorizations/{authID}": {
			servers: [{
				url: "/private"
			}]
			osspaths.legacy_authorizations_authID
		}
		"/legacy/authorizations/{authID}/password": {
			servers: [{
				url: "/private"
			}]
			osspaths.legacy_authorizations_authID_password
		}
		"/variables": commonpaths.variables
		"/variables/{variableID}": commonpaths.variables_variableID
		"/sources": commonpaths.sources
		"/sources/{sourceID}": commonpaths.sources_sourceID
		"/sources/{sourceID}/health": commonpaths.sources_sourceID_health
		"/sources/{sourceID}/buckets": commonpaths.sources_sourceID_buckets
		"/scrapers": commonpaths.scrapers
		"/scrapers/{scraperTargetID}": commonpaths.scrapers_scraperTargetID
		"/scrapers/{scraperTargetID}/labels": commonpaths.scrapers_scraperTargetID_labels
		"/scrapers/{scraperTargetID}/labels/{labelID}": commonpaths.scrapers_scraperTargetID_labels_labelID
		"/scrapers/{scraperTargetID}/members": commonpaths.scrapers_scraperTargetID_members
		"/scrapers/{scraperTargetID}/members/{userID}": commonpaths.scrapers_scraperTargetID_members_userID
		"/scrapers/{scraperTargetID}/owners": commonpaths.scrapers_scraperTargetID_owners
		"/scrapers/{scraperTargetID}/owners/{userID}": commonpaths.scrapers_scraperTargetID_owners_userID
		"/backup/kv": osspaths.backup_kv
		"/backup/metadata": osspaths.backup_metadata
		"/backup/shards/{shardID}": osspaths.backup_shards_shardID
		"/restore/kv": osspaths.restore_kv
		"/restore/sql": osspaths.restore_sql
		"/restore/bucket/{bucketID}": osspaths.restore_bucket_bucketID
		"/restore/bucketMetadata": osspaths.restore_bucketMetadata
		"/restore/shards/{shardID}": osspaths.restore_shards_shardID
		// TODO: Uncomment when replications is on by default in OSS
		//  /remotes:
		//    osspaths.remotes
		//  /remotes/{remoteID}:
		//    osspaths.remotes_remoteID
		//  /remotes/{remoteID}/validate:
		//    osspaths.remotes_remoteID_validate
		//  /replications:
		//    osspaths.replications
		//  /replications/{replicationID}:
		//    osspaths.replications_replicationID
		//  /replications/{replicationID}/validate:
		//    osspaths.replications_replicationID_validate
		"/dashboards": {
			commonpaths.dashboards
		}
		"/tasks": commonpaths.tasks
		"/write": osspaths.write
	}
	components: {
		parameters: common.#Parameters
		schemas: {
			common.#Schemas
			Authorization: commonschemas.Authorization
			AuthorizationPostRequest: commonschemas.AuthorizationPostRequest
			LegacyAuthorizationPostRequest: ossschemas.LegacyAuthorizationPostRequest
			Authorizations: commonschemas.Authorizations
			Permission: commonschemas.Permission
			Resource: commonschemas.Resource
			User: commonschemas.User
			Users: commonschemas.Users
			OnboardingRequest: commonschemas.OnboardingRequest
			OnboardingResponse: commonschemas.OnboardingResponse
			Variable: commonschemas.Variable
			Variables: commonschemas.Variables
			Source: commonschemas.Source
			Sources: commonschemas.Sources
			ScraperTargetRequest: commonschemas.ScraperTargetRequest
			ScraperTargetResponse: commonschemas.ScraperTargetResponse
			ScraperTargetResponses: commonschemas.ScraperTargetResponses
			MetadataBackup: ossschemas.MetadataBackup
			BucketMetadataManifests: ossschemas.BucketMetadataManifests
			BucketMetadataManifest: ossschemas.BucketMetadataManifest
			RetentionPolicyManifests: ossschemas.RetentionPolicyManifests
			RetentionPolicyManifest: ossschemas.RetentionPolicyManifest
			ShardGroupManifests: ossschemas.ShardGroupManifests
			ShardGroupManifest: ossschemas.ShardGroupManifest
			ShardManifests: ossschemas.ShardManifests
			ShardManifest: ossschemas.ShardManifest
			ShardOwners: ossschemas.ShardOwners
			ShardOwner: ossschemas.ShardOwner
			SubscriptionManifests: ossschemas.SubscriptionManifests
			SubscriptionManifest: ossschemas.SubscriptionManifest
			RestoredBucketMappings: ossschemas.RestoredBucketMappings
			BucketShardMappings: ossschemas.BucketShardMappings
			BucketShardMapping: ossschemas.BucketShardMapping
		}
		// TODO: Uncomment when replications is on by default in OSS
		//    RemoteConnection:
		//      ossschemas.RemoteConnection
		//    RemoteConnections:
		//      ossschemas.RemoteConnections
		//    RemoteConnectionCreationRequest:
		//      ossschemas.RemoteConnectionCreationRequest
		//    RemoteConnectionUpdateRequest:
		//      ossschemas.RemoteConnectionUpdateRequest
		//    Replication:
		//      ossschemas.Replication
		//    Replications:
		//      ossschemas.Replications
		//    ReplicationCreationRequest:
		//      ossschemas.ReplicationCreationRequest
		//    ReplicationUpdateRequest:
		//      ossschemas.ReplicationUpdateRequest
		responses: {
			ServerError: commonresponses.ServerError
		}
		securitySchemes: {
			TokenAuthentication: {
				type:         "http"
				scheme:       "token"
				bearerFormat: "InfluxDB Token String"
				description: """
					### Token authentication scheme

					InfluxDB API tokens enable authentication and authorization of API clients.
					A token belongs to an organization and identifies InfluxDB permissions within the organization.

					Include your API token in an `Authorization: Token` HTTP header with each request.

					#### Example

					  `curl http://localhost:8086/ping
					     --header \"Authorization: Token INFLUX_API_TOKEN\"`

					Replace *`INFLUX_API_TOKEN`* with your [InfluxDB API token]({{% INFLUXDB_DOCS_URL %}}/reference/glossary/#token).

					For more information and examples, see the following:
					  - [`/authorizations`](#tag/Authorizations) endpoint.
					  - [Authorize API requests]({{% INFLUXDB_DOCS_URL %}}/api-guide/api_intro/#authentication).
					  - [Manage API tokens]({{% INFLUXDB_DOCS_URL %}}/security/tokens).
					  - [Assign a token to a specific user]({{% INFLUXDB_DOCS_URL %}}/security/tokens/create-token).

					"""
			}

			BasicAuthentication: {
				type:   "http"
				scheme: "basic"
				description: """
					### Basic authentication scheme

					Use HTTP Basic Auth with clients that support the InfluxDB 1.x convention of username and password (that don't support the `Authorization: Token` scheme).

					Username and password schemes require the following credentials:
					  - **username**: 1.x username (this is separate from the UI login username)
					  - **password**: 1.x password or InfluxDB API token

					#### API token example

					`curl --get \"http://localhost:8086/query\"
					      --user \"1.x_USERNAME\":\"INFLUX_API_TOKEN\"`

					#### 1.x password example

					`curl --get \"http://localhost:8086/query\"
					      --user \"1.x_USERNAME\":\"1.x_PASSWORD\"`

					Replace the following:
					- *`1.x_USERNAME`*: your InfluxDB v1.x username
					- *`1.x_PASSWORD`*: your InfluxDB v1.x password
					- *`INFLUX_API_TOKEN`*: your [InfluxDB API token]({{% INFLUXDB_DOCS_URL %}}/reference/glossary/#token)

					For more information and examples, see how to [authenticate with a username and password scheme]({{% INFLUXDB_DOCS_URL %}}/reference/api/influxdb-1x/)

					"""
			}

			QuerystringAuthentication: {
				type: "apiKey"
				in:   "query"
				name: "u=&p="
				description: """
					### Querystring authentication scheme

					Use InfluxDB 1.x API parameters to provide credentials through the query string.

					Username and password schemes require the following credentials:
					  - **username**: 1.x username (this is separate from the UI login username)
					  - **password**: 1.x password or InfluxDB API token

					#### API token example

					`curl --get \"http://localhost:8086/query\"
					      --data-urlencode \"u=1.x_USERNAME\"
					      --data-urlencode \"p=INFLUX_API_TOKEN\"`

					#### 1.x password example

					`curl --get \"http://localhost:8086/query\"
					      --data-urlencode \"u=1.x_USERNAME\"
					      --data-urlencode \"p=1.x_PASSWORD\"`

					Replace the following:
					- *`1.x_USERNAME`*: your InfluxDB v1.x username
					- *`1.x_PASSWORD`*: your InfluxDB v1.x password
					- *`INFLUX_API_TOKEN`*: your [InfluxDB API token]({{% INFLUXDB_DOCS_URL %}}/reference/glossary/#token)

					For more information and examples, see how to [authenticate with a username and password scheme]({{% INFLUXDB_DOCS_URL %}}/reference/api/influxdb-1x/)

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
