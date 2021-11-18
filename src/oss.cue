package contracts

import "github.com/influxdata/openapi/src/common"

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
		"/health": $ref: "./oss/paths/health.yml"
		"/ready": $ref: "./oss/paths/ready.yml"
		"/users": $ref: "./common/paths/users.yml"
		"/users/{userID}": $ref: "./common/paths/users_userID.yml"
		"/setup": $ref: "./common/paths/setup.yml"
		"/authorizations": $ref: "./common/paths/authorizations.yml"
		"/authorizations/{authID}": $ref: "./common/paths/authorizations_authID.yml"
		"/legacy/authorizations": {
			servers: [{
				url: "/private"
			}]
			$ref: "./oss/paths/legacy_authorizations.yml"
		}
		"/legacy/authorizations/{authID}": {
			servers: [{
				url: "/private"
			}]
			$ref: "./oss/paths/legacy_authorizations_authID.yml"
		}
		"/legacy/authorizations/{authID}/password": {
			servers: [{
				url: "/private"
			}]
			$ref: "./oss/paths/legacy_authorizations_authID_password.yml"
		}
		"/variables": $ref: "./common/paths/variables.yml"
		"/variables/{variableID}": $ref: "./common/paths/variables_variableID.yml"
		"/sources": $ref: "./common/paths/sources.yml"
		"/sources/{sourceID}": $ref: "./common/paths/sources_sourceID.yml"
		"/sources/{sourceID}/health": $ref: "./common/paths/sources_sourceID_health.yml"
		"/sources/{sourceID}/buckets": $ref: "./common/paths/sources_sourceID_buckets.yml"
		"/scrapers": $ref: "./common/paths/scrapers.yml"
		"/scrapers/{scraperTargetID}": $ref: "./common/paths/scrapers_scraperTargetID.yml"
		"/scrapers/{scraperTargetID}/labels": $ref: "./common/paths/scrapers_scraperTargetID_labels.yml"
		"/scrapers/{scraperTargetID}/labels/{labelID}": $ref: "./common/paths/scrapers_scraperTargetID_labels_labelID.yml"
		"/scrapers/{scraperTargetID}/members": $ref: "./common/paths/scrapers_scraperTargetID_members.yml"
		"/scrapers/{scraperTargetID}/members/{userID}": $ref: "./common/paths/scrapers_scraperTargetID_members_userID.yml"
		"/scrapers/{scraperTargetID}/owners": $ref: "./common/paths/scrapers_scraperTargetID_owners.yml"
		"/scrapers/{scraperTargetID}/owners/{userID}": $ref: "./common/paths/scrapers_scraperTargetID_owners_userID.yml"
		"/backup/kv": $ref: "./oss/paths/backup_kv.yml"
		"/backup/metadata": $ref: "./oss/paths/backup_metadata.yml"
		"/backup/shards/{shardID}": $ref: "./oss/paths/backup_shards_shardID.yml"
		"/restore/kv": $ref: "./oss/paths/restore_kv.yml"
		"/restore/sql": $ref: "./oss/paths/restore_sql.yml"
		"/restore/bucket/{bucketID}": $ref: "./oss/paths/restore_bucket_bucketID.yml"
		"/restore/bucketMetadata": $ref: "./oss/paths/restore_bucketMetadata.yml"
		"/restore/shards/{shardID}": $ref: "./oss/paths/restore_shards_shardID.yml"
		// TODO: Uncomment when replications is on by default in OSS
		//  /remotes:
		//    $ref: "./oss/paths/remotes.yml"
		//  /remotes/{remoteID}:
		//    $ref: "./oss/paths/remotes_remoteID.yml"
		//  /remotes/{remoteID}/validate:
		//    $ref: "./oss/paths/remotes_remoteID_validate.yml"
		//  /replications:
		//    $ref: "./oss/paths/replications.yml"
		//  /replications/{replicationID}:
		//    $ref: "./oss/paths/replications_replicationID.yml"
		//  /replications/{replicationID}/validate:
		//    $ref: "./oss/paths/replications_replicationID_validate.yml"
		"/dashboards": {
			$ref: "./common/paths/dashboards.yml"
		}
		"/tasks": $ref: "./common/paths/tasks.yml"
		"/write": $ref: "./oss/paths/write.yml"
	}
	components: {
		parameters: common.#Parameters
		schemas: {
			common.#Schemas
			Authorization: $ref: "./common/schemas/Authorization.yml"
			AuthorizationPostRequest: $ref: "./common/schemas/AuthorizationPostRequest.yml"
			LegacyAuthorizationPostRequest: $ref: "./oss/schemas/LegacyAuthorizationPostRequest.yml"
			Authorizations: $ref: "./common/schemas/Authorizations.yml"
			Permission: $ref: "./common/schemas/Permission.yml"
			Resource: $ref: "./common/schemas/Resource.yml"
			User: $ref: "./common/schemas/User.yml"
			Users: $ref: "./common/schemas/Users.yml"
			OnboardingRequest: $ref: "./common/schemas/OnboardingRequest.yml"
			OnboardingResponse: $ref: "./common/schemas/OnboardingResponse.yml"
			Variable: $ref: "./common/schemas/Variable.yml"
			Variables: $ref: "./common/schemas/Variables.yml"
			Source: $ref: "./common/schemas/Source.yml"
			Sources: $ref: "./common/schemas/Sources.yml"
			ScraperTargetRequest: $ref: "./common/schemas/ScraperTargetRequest.yml"
			ScraperTargetResponse: $ref: "./common/schemas/ScraperTargetResponse.yml"
			ScraperTargetResponses: $ref: "./common/schemas/ScraperTargetResponses.yml"
			MetadataBackup: $ref: "./oss/schemas/MetadataBackup.yml"
			BucketMetadataManifests: $ref: "./oss/schemas/BucketMetadataManifests.yml"
			BucketMetadataManifest: $ref: "./oss/schemas/BucketMetadataManifest.yml"
			RetentionPolicyManifests: $ref: "./oss/schemas/RetentionPolicyManifests.yml"
			RetentionPolicyManifest: $ref: "./oss/schemas/RetentionPolicyManifest.yml"
			ShardGroupManifests: $ref: "./oss/schemas/ShardGroupManifests.yml"
			ShardGroupManifest: $ref: "./oss/schemas/ShardGroupManifest.yml"
			ShardManifests: $ref: "./oss/schemas/ShardManifests.yml"
			ShardManifest: $ref: "./oss/schemas/ShardManifest.yml"
			ShardOwners: $ref: "./oss/schemas/ShardOwners.yml"
			ShardOwner: $ref: "./oss/schemas/ShardOwner.yml"
			SubscriptionManifests: $ref: "./oss/schemas/SubscriptionManifests.yml"
			SubscriptionManifest: $ref: "./oss/schemas/SubscriptionManifest.yml"
			RestoredBucketMappings: $ref: "./oss/schemas/RestoredBucketMappings.yml"
			BucketShardMappings: $ref: "./oss/schemas/BucketShardMappings.yml"
			BucketShardMapping: $ref: "./oss/schemas/BucketShardMapping.yml"
		}
		// TODO: Uncomment when replications is on by default in OSS
		//    RemoteConnection:
		//      $ref: "./oss/schemas/RemoteConnection.yml"
		//    RemoteConnections:
		//      $ref: "./oss/schemas/RemoteConnections.yml"
		//    RemoteConnectionCreationRequest:
		//      $ref: "./oss/schemas/RemoteConnectionCreationRequest.yml"
		//    RemoteConnectionUpdateRequest:
		//      $ref: "./oss/schemas/RemoteConnectionUpdateRequest.yml"
		//    Replication:
		//      $ref: "./oss/schemas/Replication.yml"
		//    Replications:
		//      $ref: "./oss/schemas/Replications.yml"
		//    ReplicationCreationRequest:
		//      $ref: "./oss/schemas/ReplicationCreationRequest.yml"
		//    ReplicationUpdateRequest:
		//      $ref: "./oss/schemas/ReplicationUpdateRequest.yml"
		responses: {
			ServerError: $ref: "./common/responses/ServerError.yml"
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
