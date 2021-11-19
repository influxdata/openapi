package contracts

#OldOSS: {
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
		name:         "Quick start"
		"x-traitTag": true
		description: """
			See the [**API Quick Start**](https://docs.influxdata.com/influxdb/v2.1/api-guide/api_intro/) to get up and running authenticating with tokens, writing to buckets, and querying data.

			[**InfluxDB API client libraries**](https://docs.influxdata.com/influxdb/v2.1/api-guide/client-libraries/) are available for popular languages and ready to import into your application.

			"""
	}, {
		name:         "Response codes"
		"x-traitTag": true
		description: """
			The InfluxDB API uses standard HTTP status codes for success and failure responses.
			The response body may include additional details. For details about a specific operation's response, see **Responses** and **Response Samples** for that operation.

			API operations may return the following HTTP status codes:

			| &nbsp;Code&nbsp; | Status                   | Description      |
			|:-----------:|:------------------------ |:--------------------- |
			| `200`       | Success                  |                       |
			| `204`       | No content               | For a `POST` request, `204` indicates that InfluxDB accepted the request and request data is valid. Asynchronous operations, such as `write`, might not have completed yet. |
			| `400`       | Bad request              | `Authorization` header is missing or malformed or the API token does not have permission for the operation. |
			| `401`       | Unauthorized             | May indicate one of the following: <li>`Authorization: Token` header is missing or malformed</li><li>API token value is missing from the header</li><li>API token does not have permission. For more information about token types and permissions, see [Manage API tokens](https://docs.influxdata.com/influxdb/v2.1/security/tokens/)</li> |
			| `404`       | Not found                | Requested resource was not found. `message` in the response body provides details about the requested resource. |
			| `413`       | Request entity too large | Request payload exceeds the size limit. |
			| `422`       | Unprocessible entity     | Request data is invalid. `code` and `message` in the response body provide details about the problem. |
			| `429`       | Too many requests        | API token is temporarily over the request quota. The `Retry-After` header describes when to try the request again. |
			| `500`       | Internal server error    |                       |
			| `503`       | Service unavailable      | Server is temporarily unavailable to process the request. The `Retry-After` header describes when to try the request again. |

			"""
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
			  - [Authorize API requests](https://docs.influxdata.com/influxdb/v2.1/api-guide/api_intro/#authentication).
			  - [Manage API tokens](https://docs.influxdata.com/influxdb/v2.1/security/tokens).
			  - [Assign a token to a specific user](https://docs.influxdata.com/influxdb/v2.1/security/tokens/create-token).

			"""
	}]
	"x-tagGroups": [{
		name: "Overview"
		tags: ["Quick start", "Authentication", "Response codes"]
	}, {
		name: "Data I/O endpoints"
		tags: ["Write", "Query"]
	}, {
		name: "Resource endpoints"
		tags: ["Buckets", "Dashboards", "Tasks", "Resources"]
	}, {
		name: "Security and access endpoints"
		tags: ["Authorizations", "Organizations", "Users"]
	}, {
		name: "System information endpoints"
		tags: ["Health", "Ping", "Ready", "Routes"]
	}, {
		name: "All endpoints"
		tags: ["Authorizations", "Backup", "Buckets", "Cells", "Checks", "DBRPs", "Dashboards", "Delete", "Health", "Labels", "Legacy Authorizations", "NotificationEndpoints", "NotificationRules", "Organizations", "Ping", "Query", "Ready", "RemoteConnections", "Replications", "Resources", "Restore", "Routes", "Rules", "Scraper Targets", "Secrets", "Setup", "Signin", "Signout", "Sources", "Tasks", "Telegraf Plugins", "Telegrafs", "Templates", "Users", "Variables", "Write"]
	}]
	paths: {
		"/signin": post: {
			operationId: "PostSignin"
			summary:     "Create a user session."
			description: "Authenticates ***Basic Auth*** credentials for a user. If successful, creates a new UI session for the user."
			tags: ["Signin"]
			security: [{
				BasicAuthentication: []
			}]
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}]
			responses: {
				"204": description: "Success. User authenticated."
				"401": {
					description: "Unauthorized access."
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
				"403": {
					description: "User account is disabled."
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
				default: {
					description: "Unsuccessful authentication."
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
			}
		}
		"/signout": post: {
			operationId: "PostSignout"
			summary:     "Expire the current UI session"
			tags: ["Signout"]
			description: "Expires the current UI session for the user."
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}]
			responses: {
				"204": description: "Session successfully expired"
				"401": {
					description: "Unauthorized access"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
				default: {
					description: "Unsuccessful session expiry"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
			}
		}
		"/ping": {
			get: {
				operationId: "GetPing"
				summary:     "Checks the status of InfluxDB instance and version of InfluxDB."
				servers: [{
					url: ""
				}]
				tags: ["Ping"]
				responses: "204": {
					description: "OK"
					headers: {
						"X-Influxdb-Build": {
							schema: type: "string"
							description: "The type of InfluxDB build."
						}
						"X-Influxdb-Version": {
							schema: type: "integer"
							description: "The version of InfluxDB."
						}
					}
				}
			}
			head: {
				operationId: "HeadPing"
				summary:     "Checks the status of InfluxDB instance and version of InfluxDB."
				servers: [{
					url: ""
				}]
				tags: ["Ping"]
				responses: "204": {
					description: "OK"
					headers: {
						"X-Influxdb-Build": {
							schema: type: "string"
							description: "The type of InfluxDB build."
						}
						"X-Influxdb-Version": {
							schema: type: "integer"
							description: "The version of InfluxDB."
						}
					}
				}
			}
		}
		"/": get: {
			operationId: "GetRoutes"
			summary:     "List all top level routes"
			tags: ["Routes"]
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}]
			responses: default: {
				description: "All routes"
				content: "application/json": schema: $ref: "#/components/schemas/Routes"
			}
		}
		"/dbrps": {
			get: {
				operationId: "GetDBRPs"
				tags: ["DBRPs"]
				summary: "List database retention policy mappings"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:          "query"
					name:        "orgID"
					description: "Specifies the organization ID to filter on"
					schema: type: "string"
				}, {
					in:          "query"
					name:        "org"
					description: "Specifies the organization name to filter on"
					schema: type: "string"
				}, {
					in:          "query"
					name:        "id"
					description: "Specifies the mapping ID to filter on"
					schema: type: "string"
				}, {
					in:          "query"
					name:        "bucketID"
					description: "Specifies the bucket ID to filter on"
					schema: type: "string"
				}, {
					in:          "query"
					name:        "default"
					description: "Specifies filtering on default"
					schema: type: "boolean"
				}, {
					in:          "query"
					name:        "db"
					description: "Specifies the database to filter on"
					schema: type: "string"
				}, {
					in:          "query"
					name:        "rp"
					description: "Specifies the retention policy to filter on"
					schema: type: "string"
				}]
				responses: {
					"200": {
						description: "Success. Returns a list of database retention policy mappings."
						content: "application/json": schema: $ref: "#/components/schemas/DBRPs"
					}
					"400": {
						description: "Bad request. The request has one or more invalid parameters."
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			post: {
				operationId: "PostDBRP"
				tags: ["DBRPs"]
				summary: "Add a database retention policy mapping"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}]
				requestBody: {
					description: "The database retention policy mapping to add"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/DBRPCreate"
				}
				responses: {
					"201": {
						description: "Created. Returns the created database retention policy mapping."
						content: "application/json": schema: $ref: "#/components/schemas/DBRP"
					}
					"400": {
						description: "Bad request. The mapping in the request has one or more invalid IDs."
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
		}
		"/dbrps/{dbrpID}": {
			get: {
				operationId: "GetDBRPsID"
				tags: ["DBRPs"]
				summary: "Retrieve a database retention policy mapping"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:          "query"
					name:        "orgID"
					description: "Specifies the organization ID of the mapping"
					schema: type: "string"
				}, {
					in:          "query"
					name:        "org"
					description: "Specifies the organization name of the mapping"
					schema: type: "string"
				}, {
					in:   "path"
					name: "dbrpID"
					schema: type: "string"
					required:    true
					description: "The database retention policy mapping ID"
				}]
				responses: {
					"200": {
						description: "The database retention policy requested"
						content: "application/json": schema: $ref: "#/components/schemas/DBRPGet"
					}
					"400": {
						description: "if any of the IDs passed is invalid"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			patch: {
				operationId: "PatchDBRPID"
				tags: ["DBRPs"]
				summary: "Update a database retention policy mapping"
				requestBody: {
					description: "Database retention policy update to apply"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/DBRPUpdate"
				}
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:          "query"
					name:        "orgID"
					description: "Specifies the organization ID of the mapping"
					schema: type: "string"
				}, {
					in:          "query"
					name:        "org"
					description: "Specifies the organization name of the mapping"
					schema: type: "string"
				}, {
					in:   "path"
					name: "dbrpID"
					schema: type: "string"
					required:    true
					description: "The database retention policy mapping."
				}]
				responses: {
					"200": {
						description: "An updated mapping"
						content: "application/json": schema: $ref: "#/components/schemas/DBRPGet"
					}
					"400": {
						description: "if any of the IDs passed is invalid"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
					"404": {
						description: "The mapping was not found"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			delete: {
				operationId: "DeleteDBRPID"
				tags: ["DBRPs"]
				summary: "Delete a database retention policy"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:          "query"
					name:        "orgID"
					description: "Specifies the organization ID of the mapping"
					schema: type: "string"
				}, {
					in:          "query"
					name:        "org"
					description: "Specifies the organization name of the mapping"
					schema: type: "string"
				}, {
					in:   "path"
					name: "dbrpID"
					schema: type: "string"
					required:    true
					description: "The database retention policy mapping"
				}]
				responses: {
					"204": description: "Delete has been accepted"
					"400": {
						description: "if any of the IDs passed is invalid"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
		}
		"/telegraf/plugins": get: {
			operationId: "GetTelegrafPlugins"
			tags: ["Telegraf Plugins"]
			summary: "List all Telegraf plugins"
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}, {
				in:          "query"
				name:        "type"
				description: "The type of plugin desired."
				schema: type: "string"
			}]
			responses: {
				"200": {
					description: "A list of Telegraf plugins."
					content: "application/json": schema: $ref: "#/components/schemas/TelegrafPlugins"
				}
				default: {
					description: "Unexpected error"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
			}
		}
		"/telegrafs": {
			get: {
				operationId: "GetTelegrafs"
				tags: ["Telegrafs"]
				summary: "List all Telegraf configurations"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:          "query"
					name:        "orgID"
					description: "The organization ID the Telegraf config belongs to."
					schema: type: "string"
				}]
				responses: {
					"200": {
						description: "A list of Telegraf configurations"
						content: "application/json": schema: $ref: "#/components/schemas/Telegrafs"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			post: {
				operationId: "PostTelegrafs"
				tags: ["Telegrafs"]
				summary: "Create a Telegraf configuration"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}]
				requestBody: {
					description: "Telegraf configuration to create"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/TelegrafRequest"
				}
				responses: {
					"201": {
						description: "Telegraf configuration created"
						content: "application/json": schema: $ref: "#/components/schemas/Telegraf"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
		}
		"/telegrafs/{telegrafID}": {
			get: {
				operationId: "GetTelegrafsID"
				tags: ["Telegrafs"]
				summary: "Retrieve a Telegraf configuration"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "telegrafID"
					schema: type: "string"
					required:    true
					description: "The Telegraf configuration ID."
				}, {
					in:       "header"
					name:     "Accept"
					required: false
					schema: {
						type:    "string"
						default: "application/toml"
						enum: ["application/toml", "application/json", "application/octet-stream"]
					}
				}]
				responses: {
					"200": {
						description: "Telegraf configuration details"
						content: {
							"application/toml": {
								example: """
									[agent]
									interval = "10s"
									"""
								schema: type: "string"
							}
							"application/json": schema: $ref: "#/components/schemas/Telegraf"
							"application/octet-stream": {
								example: """
									[agent]
									interval = "10s"
									"""
								schema: type: "string"
							}
						}
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			put: {
				operationId: "PutTelegrafsID"
				tags: ["Telegrafs"]
				summary: "Update a Telegraf configuration"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "telegrafID"
					schema: type: "string"
					required:    true
					description: "The Telegraf config ID."
				}]
				requestBody: {
					description: "Telegraf configuration update to apply"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/TelegrafRequest"
				}
				responses: {
					"200": {
						description: "An updated Telegraf configurations"
						content: "application/json": schema: $ref: "#/components/schemas/Telegraf"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			delete: {
				operationId: "DeleteTelegrafsID"
				tags: ["Telegrafs"]
				summary: "Delete a Telegraf configuration"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "telegrafID"
					schema: type: "string"
					required:    true
					description: "The Telegraf configuration ID."
				}]
				responses: {
					"204": description: "Delete has been accepted"
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
		}
		"/telegrafs/{telegrafID}/labels": {
			get: {
				operationId: "GetTelegrafsIDLabels"
				tags: ["Telegrafs"]
				summary: "List all labels for a Telegraf config"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "telegrafID"
					schema: type: "string"
					required:    true
					description: "The Telegraf config ID."
				}]
				responses: {
					"200": {
						description: "A list of all labels for a Telegraf config"
						content: "application/json": schema: $ref: "#/components/schemas/LabelsResponse"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			post: {
				operationId: "PostTelegrafsIDLabels"
				tags: ["Telegrafs"]
				summary: "Add a label to a Telegraf config"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "telegrafID"
					schema: type: "string"
					required:    true
					description: "The Telegraf config ID."
				}]
				requestBody: {
					description: "Label to add"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/LabelMapping"
				}
				responses: {
					"201": {
						description: "The label added to the Telegraf config"
						content: "application/json": schema: $ref: "#/components/schemas/LabelResponse"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
		}
		"/telegrafs/{telegrafID}/labels/{labelID}": delete: {
			operationId: "DeleteTelegrafsIDLabelsID"
			tags: ["Telegrafs"]
			summary: "Delete a label from a Telegraf config"
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}, {
				in:   "path"
				name: "telegrafID"
				schema: type: "string"
				required:    true
				description: "The Telegraf config ID."
			}, {
				in:   "path"
				name: "labelID"
				schema: type: "string"
				required:    true
				description: "The label ID."
			}]
			responses: {
				"204": description: "Delete has been accepted"
				"404": {
					description: "Telegraf config not found"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
				default: {
					description: "Unexpected error"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
			}
		}
		"/telegrafs/{telegrafID}/members": {
			get: {
				operationId: "GetTelegrafsIDMembers"
				tags: ["Telegrafs"]
				summary: "List all users with member privileges for a Telegraf config"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "telegrafID"
					schema: type: "string"
					required:    true
					description: "The Telegraf config ID."
				}]
				responses: {
					"200": {
						description: "A list of Telegraf config members"
						content: "application/json": schema: $ref: "#/components/schemas/ResourceMembers"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			post: {
				operationId: "PostTelegrafsIDMembers"
				tags: ["Telegrafs"]
				summary: "Add a member to a Telegraf config"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "telegrafID"
					schema: type: "string"
					required:    true
					description: "The Telegraf config ID."
				}]
				requestBody: {
					description: "User to add as member"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/AddResourceMemberRequestBody"
				}
				responses: {
					"201": {
						description: "Member added to Telegraf config"
						content: "application/json": schema: $ref: "#/components/schemas/ResourceMember"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
		}
		"/telegrafs/{telegrafID}/members/{userID}": delete: {
			operationId: "DeleteTelegrafsIDMembersID"
			tags: ["Telegrafs"]
			summary: "Remove a member from a Telegraf config"
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}, {
				in:   "path"
				name: "userID"
				schema: type: "string"
				required:    true
				description: "The ID of the member to remove."
			}, {
				in:   "path"
				name: "telegrafID"
				schema: type: "string"
				required:    true
				description: "The Telegraf config ID."
			}]
			responses: {
				"204": description: "Member removed"
				default: {
					description: "Unexpected error"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
			}
		}
		"/telegrafs/{telegrafID}/owners": {
			get: {
				operationId: "GetTelegrafsIDOwners"
				tags: ["Telegrafs"]
				summary: "List all owners of a Telegraf configuration"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "telegrafID"
					schema: type: "string"
					required:    true
					description: "The Telegraf configuration ID."
				}]
				responses: {
					"200": {
						description: "Returns Telegraf configuration owners as a ResourceOwners list"
						content: "application/json": schema: $ref: "#/components/schemas/ResourceOwners"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			post: {
				operationId: "PostTelegrafsIDOwners"
				tags: ["Telegrafs"]
				summary: "Add an owner to a Telegraf configuration"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "telegrafID"
					schema: type: "string"
					required:    true
					description: "The Telegraf configuration ID."
				}]
				requestBody: {
					description: "User to add as owner"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/AddResourceMemberRequestBody"
				}
				responses: {
					"201": {
						description: "Telegraf configuration owner was added. Returns a ResourceOwner that references the User."
						content: "application/json": schema: $ref: "#/components/schemas/ResourceOwner"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
		}
		"/telegrafs/{telegrafID}/owners/{userID}": delete: {
			operationId: "DeleteTelegrafsIDOwnersID"
			tags: ["Telegrafs"]
			summary: "Remove an owner from a Telegraf config"
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}, {
				in:   "path"
				name: "userID"
				schema: type: "string"
				required:    true
				description: "The ID of the owner to remove."
			}, {
				in:   "path"
				name: "telegrafID"
				schema: type: "string"
				required:    true
				description: "The Telegraf config ID."
			}]
			responses: {
				"204": description: "Owner removed"
				default: {
					description: "Unexpected error"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
			}
		}
		"/variables/{variableID}/labels": {
			get: {
				operationId: "GetVariablesIDLabels"
				tags: ["Variables"]
				summary: "List all labels for a variable"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "variableID"
					schema: type: "string"
					required:    true
					description: "The variable ID."
				}]
				responses: {
					"200": {
						description: "A list of all labels for a variable"
						content: "application/json": schema: $ref: "#/components/schemas/LabelsResponse"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			post: {
				operationId: "PostVariablesIDLabels"
				tags: ["Variables"]
				summary: "Add a label to a variable"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "variableID"
					schema: type: "string"
					required:    true
					description: "The variable ID."
				}]
				requestBody: {
					description: "Label to add"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/LabelMapping"
				}
				responses: {
					"201": {
						description: "The newly added label"
						content: "application/json": schema: $ref: "#/components/schemas/LabelResponse"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
		}
		"/variables/{variableID}/labels/{labelID}": delete: {
			operationId: "DeleteVariablesIDLabelsID"
			tags: ["Variables"]
			summary: "Delete a label from a variable"
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}, {
				in:   "path"
				name: "variableID"
				schema: type: "string"
				required:    true
				description: "The variable ID."
			}, {
				in:   "path"
				name: "labelID"
				schema: type: "string"
				required:    true
				description: "The label ID to delete."
			}]
			responses: {
				"204": description: "Delete has been accepted"
				"404": {
					description: "Variable not found"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
				default: {
					description: "Unexpected error"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
			}
		}
		"/delete": post: {
			operationId: "PostDelete"
			tags: ["Delete"]
			summary: "Delete data"
			requestBody: {
				description: "Deletes data from an InfluxDB bucket."
				required:    true
				content: "application/json": schema: $ref: "#/components/schemas/DeletePredicateRequest"
			}
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}, {
				in:          "query"
				name:        "org"
				description: "Specifies the organization to delete data from."
				schema: {
					type:        "string"
					description: "Only points from this organization are deleted."
				}
			}, {
				in:          "query"
				name:        "bucket"
				description: "Specifies the bucket to delete data from."
				schema: {
					type:        "string"
					description: "Only points from this bucket are deleted."
				}
			}, {
				in:          "query"
				name:        "orgID"
				description: "Specifies the organization ID of the resource."
				schema: type: "string"
			}, {
				in:          "query"
				name:        "bucketID"
				description: "Specifies the bucket ID to delete data from."
				schema: {
					type:        "string"
					description: "Only points from this bucket ID are deleted."
				}
			}]
			responses: {
				"204": description: "delete has been accepted"
				"400": {
					description: "Invalid request."
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
				"403": {
					description: "no token was sent or does not have sufficient permissions."
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
				"404": {
					description: "the bucket or organization is not found."
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
				default: {
					description: "internal server error"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
			}
		}
		"/labels": {
			post: {
				operationId: "PostLabels"
				tags: ["Labels"]
				summary: "Create a label"
				requestBody: {
					description: "Label to create"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/LabelCreateRequest"
				}
				responses: {
					"201": {
						description: "Added label"
						content: "application/json": schema: $ref: "#/components/schemas/LabelResponse"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			get: {
				operationId: "GetLabels"
				tags: ["Labels"]
				summary: "List all labels"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:          "query"
					name:        "orgID"
					description: "The organization ID."
					schema: type: "string"
				}]
				responses: {
					"200": {
						description: "A list of labels"
						content: "application/json": schema: $ref: "#/components/schemas/LabelsResponse"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
		}
		"/labels/{labelID}": {
			get: {
				operationId: "GetLabelsID"
				tags: ["Labels"]
				summary: "Retrieve a label"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "labelID"
					schema: type: "string"
					required:    true
					description: "The ID of the label to update."
				}]
				responses: {
					"200": {
						description: "A label"
						content: "application/json": schema: $ref: "#/components/schemas/LabelResponse"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			patch: {
				operationId: "PatchLabelsID"
				tags: ["Labels"]
				summary: "Update a label"
				requestBody: {
					description: "Label update"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/LabelUpdate"
				}
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "labelID"
					schema: type: "string"
					required:    true
					description: "The ID of the label to update."
				}]
				responses: {
					"200": {
						description: "Updated label"
						content: "application/json": schema: $ref: "#/components/schemas/LabelResponse"
					}
					"404": {
						description: "Label not found"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			delete: {
				operationId: "DeleteLabelsID"
				tags: ["Labels"]
				summary: "Delete a label"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "labelID"
					schema: type: "string"
					required:    true
					description: "The ID of the label to delete."
				}]
				responses: {
					"204": description: "Delete has been accepted"
					"404": {
						description: "Label not found"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
		}
		"/dashboards/{dashboardID}": {
			get: {
				operationId: "GetDashboardsID"
				tags: ["Dashboards"]
				summary: "Retrieve a Dashboard"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "dashboardID"
					schema: type: "string"
					required:    true
					description: "The ID of the dashboard to update."
				}, {
					in:       "query"
					name:     "include"
					required: false
					schema: {
						type: "string"
						enum: ["properties"]
					}
					description: "Includes the cell view properties in the response if set to `properties`"
				}]
				responses: {
					"200": {
						description: "Retrieve a single dashboard"
						content: "application/json": schema: oneOf: [{
							$ref: "#/components/schemas/Dashboard"
						}, {
							$ref: "#/components/schemas/DashboardWithViewProperties"
						}]
					}
					"404": {
						description: "Dashboard not found"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			patch: {
				operationId: "PatchDashboardsID"
				tags: ["Dashboards"]
				summary: "Update a dashboard"
				requestBody: {
					description: "Patching of a dashboard"
					required:    true
					content: "application/json": schema: {
						type:  "object"
						title: "PatchDashboardRequest"
						properties: {
							name: {
								description: "optional, when provided will replace the name"
								type:        "string"
							}
							description: {
								description: "optional, when provided will replace the description"
								type:        "string"
							}
							cells: {
								description: "optional, when provided will replace all existing cells with the cells provided"
								$ref:        "#/components/schemas/CellWithViewProperties"
							}
						}
					}
				}
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "dashboardID"
					schema: type: "string"
					required:    true
					description: "The ID of the dashboard to update."
				}]
				responses: {
					"200": {
						description: "Updated dashboard"
						content: "application/json": schema: $ref: "#/components/schemas/Dashboard"
					}
					"404": {
						description: "Dashboard not found"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			delete: {
				operationId: "DeleteDashboardsID"
				tags: ["Dashboards"]
				summary: "Delete a dashboard"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "dashboardID"
					schema: type: "string"
					required:    true
					description: "The ID of the dashboard to update."
				}]
				responses: {
					"204": description: "Delete has been accepted"
					"404": {
						description: "Dashboard not found"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
		}
		"/dashboards/{dashboardID}/cells": {
			put: {
				operationId: "PutDashboardsIDCells"
				tags: ["Cells", "Dashboards"]
				summary:     "Replace cells in a dashboard"
				description: "Replaces all cells in a dashboard. This is used primarily to update the positional information of all cells."
				requestBody: {
					required: true
					content: "application/json": schema: $ref: "#/components/schemas/Cells"
				}
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "dashboardID"
					schema: type: "string"
					required:    true
					description: "The ID of the dashboard to update."
				}]
				responses: {
					"201": {
						description: "Replaced dashboard cells"
						content: "application/json": schema: $ref: "#/components/schemas/Dashboard"
					}
					"404": {
						description: "Dashboard not found"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			post: {
				operationId: "PostDashboardsIDCells"
				tags: ["Cells", "Dashboards"]
				summary: "Create a dashboard cell"
				requestBody: {
					description: "Cell that will be added"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/CreateCell"
				}
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "dashboardID"
					schema: type: "string"
					required:    true
					description: "The ID of the dashboard to update."
				}]
				responses: {
					"201": {
						description: "Cell successfully added"
						content: "application/json": schema: $ref: "#/components/schemas/Cell"
					}
					"404": {
						description: "Dashboard not found"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
		}
		"/dashboards/{dashboardID}/cells/{cellID}": {
			patch: {
				operationId: "PatchDashboardsIDCellsID"
				tags: ["Cells", "Dashboards"]
				summary:     "Update the non-positional information related to a cell"
				description: "Updates the non positional information related to a cell. Updates to a single cell's positional data could cause grid conflicts."
				requestBody: {
					required: true
					content: "application/json": schema: $ref: "#/components/schemas/CellUpdate"
				}
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "dashboardID"
					schema: type: "string"
					required:    true
					description: "The ID of the dashboard to update."
				}, {
					in:   "path"
					name: "cellID"
					schema: type: "string"
					required:    true
					description: "The ID of the cell to update."
				}]
				responses: {
					"200": {
						description: "Updated dashboard cell"
						content: "application/json": schema: $ref: "#/components/schemas/Cell"
					}
					"404": {
						description: "Cell or dashboard not found"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			delete: {
				operationId: "DeleteDashboardsIDCellsID"
				tags: ["Cells", "Dashboards"]
				summary: "Delete a dashboard cell"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "dashboardID"
					schema: type: "string"
					required:    true
					description: "The ID of the dashboard to delete."
				}, {
					in:   "path"
					name: "cellID"
					schema: type: "string"
					required:    true
					description: "The ID of the cell to delete."
				}]
				responses: {
					"204": description: "Cell successfully deleted"
					"404": {
						description: "Cell or dashboard not found"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
		}
		"/dashboards/{dashboardID}/cells/{cellID}/view": {
			get: {
				operationId: "GetDashboardsIDCellsIDView"
				tags: ["Cells", "Dashboards", "Views"]
				summary: "Retrieve the view for a cell"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "dashboardID"
					schema: type: "string"
					required:    true
					description: "The dashboard ID."
				}, {
					in:   "path"
					name: "cellID"
					schema: type: "string"
					required:    true
					description: "The cell ID."
				}]
				responses: {
					"200": {
						description: "A dashboard cells view"
						content: "application/json": schema: $ref: "#/components/schemas/View"
					}
					"404": {
						description: "Cell or dashboard not found"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			patch: {
				operationId: "PatchDashboardsIDCellsIDView"
				tags: ["Cells", "Dashboards", "Views"]
				summary: "Update the view for a cell"
				requestBody: {
					required: true
					content: "application/json": schema: $ref: "#/components/schemas/View"
				}
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "dashboardID"
					schema: type: "string"
					required:    true
					description: "The ID of the dashboard to update."
				}, {
					in:   "path"
					name: "cellID"
					schema: type: "string"
					required:    true
					description: "The ID of the cell to update."
				}]
				responses: {
					"200": {
						description: "Updated cell view"
						content: "application/json": schema: $ref: "#/components/schemas/View"
					}
					"404": {
						description: "Cell or dashboard not found"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
		}
		"/dashboards/{dashboardID}/labels": {
			get: {
				operationId: "GetDashboardsIDLabels"
				tags: ["Dashboards"]
				summary: "List all labels for a dashboard"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "dashboardID"
					schema: type: "string"
					required:    true
					description: "The dashboard ID."
				}]
				responses: {
					"200": {
						description: "A list of all labels for a dashboard"
						content: "application/json": schema: $ref: "#/components/schemas/LabelsResponse"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			post: {
				operationId: "PostDashboardsIDLabels"
				tags: ["Dashboards"]
				summary: "Add a label to a dashboard"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "dashboardID"
					schema: type: "string"
					required:    true
					description: "The dashboard ID."
				}]
				requestBody: {
					description: "Label to add"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/LabelMapping"
				}
				responses: {
					"201": {
						description: "The label added to the dashboard"
						content: "application/json": schema: $ref: "#/components/schemas/LabelResponse"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
		}
		"/dashboards/{dashboardID}/labels/{labelID}": delete: {
			operationId: "DeleteDashboardsIDLabelsID"
			tags: ["Dashboards"]
			summary: "Delete a label from a dashboard"
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}, {
				in:   "path"
				name: "dashboardID"
				schema: type: "string"
				required:    true
				description: "The dashboard ID."
			}, {
				in:   "path"
				name: "labelID"
				schema: type: "string"
				required:    true
				description: "The ID of the label to delete."
			}]
			responses: {
				"204": description: "Delete has been accepted"
				"404": {
					description: "Dashboard not found"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
				default: {
					description: "Unexpected error"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
			}
		}
		"/dashboards/{dashboardID}/members": {
			get: {
				operationId: "GetDashboardsIDMembers"
				tags: ["Dashboards"]
				summary: "List all dashboard members"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "dashboardID"
					schema: type: "string"
					required:    true
					description: "The dashboard ID."
				}]
				responses: {
					"200": {
						description: "A list of users who have member privileges for a dashboard"
						content: "application/json": schema: $ref: "#/components/schemas/ResourceMembers"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			post: {
				operationId: "PostDashboardsIDMembers"
				tags: ["Dashboards"]
				summary: "Add a member to a dashboard"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "dashboardID"
					schema: type: "string"
					required:    true
					description: "The dashboard ID."
				}]
				requestBody: {
					description: "User to add as member"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/AddResourceMemberRequestBody"
				}
				responses: {
					"201": {
						description: "Added to dashboard members"
						content: "application/json": schema: $ref: "#/components/schemas/ResourceMember"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
		}
		"/dashboards/{dashboardID}/members/{userID}": delete: {
			operationId: "DeleteDashboardsIDMembersID"
			tags: ["Dashboards"]
			summary: "Remove a member from a dashboard"
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}, {
				in:   "path"
				name: "userID"
				schema: type: "string"
				required:    true
				description: "The ID of the member to remove."
			}, {
				in:   "path"
				name: "dashboardID"
				schema: type: "string"
				required:    true
				description: "The dashboard ID."
			}]
			responses: {
				"204": description: "Member removed"
				default: {
					description: "Unexpected error"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
			}
		}
		"/dashboards/{dashboardID}/owners": {
			get: {
				operationId: "GetDashboardsIDOwners"
				tags: ["Dashboards"]
				summary: "List all dashboard owners"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "dashboardID"
					schema: type: "string"
					required:    true
					description: "The dashboard ID."
				}]
				responses: {
					"200": {
						description: "A list of users who have owner privileges for a dashboard"
						content: "application/json": schema: $ref: "#/components/schemas/ResourceOwners"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			post: {
				operationId: "PostDashboardsIDOwners"
				tags: ["Dashboards"]
				summary: "Add an owner to a dashboard"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "dashboardID"
					schema: type: "string"
					required:    true
					description: "The dashboard ID."
				}]
				requestBody: {
					description: "User to add as owner"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/AddResourceMemberRequestBody"
				}
				responses: {
					"201": {
						description: "Added to dashboard owners"
						content: "application/json": schema: $ref: "#/components/schemas/ResourceOwner"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
		}
		"/dashboards/{dashboardID}/owners/{userID}": delete: {
			operationId: "DeleteDashboardsIDOwnersID"
			tags: ["Dashboards"]
			summary: "Remove an owner from a dashboard"
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}, {
				in:   "path"
				name: "userID"
				schema: type: "string"
				required:    true
				description: "The ID of the owner to remove."
			}, {
				in:   "path"
				name: "dashboardID"
				schema: type: "string"
				required:    true
				description: "The dashboard ID."
			}]
			responses: {
				"204": description: "Owner removed"
				default: {
					description: "Unexpected error"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
			}
		}
		"/query/ast": post: {
			operationId: "PostQueryAst"
			description: "Analyzes flux query and generates a query specification."
			tags: ["Query"]
			summary: "Generate an Abstract Syntax Tree (AST) from a query"
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}, {
				in:   "header"
				name: "Content-Type"
				schema: {
					type: "string"
					enum: ["application/json"]
				}
			}]
			requestBody: {
				description: "Analyzed Flux query to generate abstract syntax tree."
				content: "application/json": schema: $ref: "#/components/schemas/LanguageRequest"
			}
			responses: {
				"200": {
					description: "Abstract syntax tree of the flux query."
					content: "application/json": schema: $ref: "#/components/schemas/ASTResponse"
				}
				default: {
					description: "Any response other than 200 is an internal server error"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
			}
		}
		"/query/suggestions": get: {
			operationId: "GetQuerySuggestions"
			tags: ["Query"]
			summary: "Retrieve query suggestions"
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}]
			responses: {
				"200": {
					description: "Suggestions for next functions in call chain"
					content: "application/json": schema: $ref: "#/components/schemas/FluxSuggestions"
				}
				default: {
					description: "Any response other than 200 is an internal server error"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
			}
		}
		"/query/suggestions/{name}": get: {
			operationId: "GetQuerySuggestionsName"
			tags: ["Query"]
			summary: "Retrieve query suggestions for a branching suggestion"
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}, {
				in:   "path"
				name: "name"
				schema: type: "string"
				required:    true
				description: "The name of the branching suggestion."
			}]
			responses: {
				"200": {
					description: "Suggestions for next functions in call chain"
					content: "application/json": schema: $ref: "#/components/schemas/FluxSuggestion"
				}
				default: {
					description: "Any response other than 200 is an internal server error"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
			}
		}
		"/query/analyze": post: {
			operationId: "PostQueryAnalyze"
			tags: ["Query"]
			summary: "Analyze a Flux query"
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}, {
				in:   "header"
				name: "Content-Type"
				schema: {
					type: "string"
					enum: ["application/json"]
				}
			}]
			requestBody: {
				description: "Flux query to analyze"
				content: "application/json": schema: $ref: "#/components/schemas/Query"
			}
			responses: {
				"200": {
					description: "Query analyze results. Errors will be empty if the query is valid."
					content: "application/json": schema: $ref: "#/components/schemas/AnalyzeQueryResponse"
				}
				default: {
					description: "Internal server error"
					headers: {
						"X-Influx-Error": {
							description: "Error string describing the problem"
							schema: type: "string"
						}
						"X-Influx-Reference": {
							description: "Reference code unique to the error type"
							schema: type: "integer"
						}
					}
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
			}
		}
		"/query": post: {
			operationId: "PostQuery"
			tags: ["Query"]
			summary: "Query data"
			description: """
				Retrieves data from InfluxDB buckets.

				To query data, you need the following:
				- **organization** – _See [View organizations](https://docs.influxdata.com/influxdb/v2.1/organizations/view-orgs/#view-your-organization-id) for instructions on viewing your organization ID._
				- **API token** – _See [View tokens](https://docs.influxdata.com/influxdb/v2.1/security/tokens/view-tokens/)
				 for instructions on viewing your API token._
				- **InfluxDB URL** – _See [InfluxDB URLs](https://docs.influxdata.com/influxdb/v2.1/reference/urls/)_.
				- **Flux query** – _See [Flux](https://docs.influxdata.com/flux/v0.x/)._

				For more information and examples, see [Query with the InfluxDB API](https://docs.influxdata.com/influxdb/v2.1/query-data/execute-queries/influx-api/).

				"""
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}, {
				in:          "header"
				name:        "Accept-Encoding"
				description: "Indicates the content encoding (usually a compression algorithm) that the client can understand."
				schema: {
					type:        "string"
					description: "The content coding.  Use `gzip` for compressed data or `identity` for unmodified, uncompressed data."
					default:     "identity"
					enum: ["gzip", "identity"]
				}
			}, {
				in:   "header"
				name: "Content-Type"
				schema: {
					type: "string"
					enum: ["application/json", "application/vnd.flux"]
				}
			}, {
				in:          "query"
				name:        "org"
				description: "Specifies the name of the organization executing the query. Takes either the ID or Name. If both `orgID` and `org` are specified, `org` takes precedence."
				schema: type: "string"
			}, {
				in:          "query"
				name:        "orgID"
				description: "Specifies the ID of the organization executing the query. If both `orgID` and `org` are specified, `org` takes precedence."
				schema: type: "string"
			}]
			requestBody: {
				description: "Flux query or specification to execute"
				content: {
					"application/json": schema: $ref: "#/components/schemas/Query"
					"application/vnd.flux": {
						schema: type: "string"
						example: """
							from(bucket: "example-bucket")
							    |> range(start: -5m)
							    |> filter(fn: (r) => r._measurement == "example-measurement")

							"""
					}
				}
			}
			responses: {
				"200": {
					description: "Success. Returns query results."
					headers: {
						"Content-Encoding": {
							description: "Lists any encodings (usually compression algorithms) that have been applied to the response payload."
							schema: {
								type: "string"
								description: """
										The content coding: `gzip` for compressed data or `identity` for unmodified, uncompressed data.

										"""
								default: "identity"
								enum: ["gzip", "identity"]
							}
						}
						"Trace-Id": {
							description: "The Trace-Id header reports the request's trace ID, if one was generated."
							schema: {
								type:        "string"
								description: "Specifies the request's trace ID."
							}
						}
					}
					content: {
						"text/csv": schema: {
							type: "string"
							example: """
										result,table,_start,_stop,_time,region,host,_value mean,0,2018-05-08T20:50:00Z,2018-05-08T20:51:00Z,2018-05-08T20:50:00Z,east,A,15.43 mean,0,2018-05-08T20:50:00Z,2018-05-08T20:51:00Z,2018-05-08T20:50:20Z,east,B,59.25 mean,0,2018-05-08T20:50:00Z,2018-05-08T20:51:00Z,2018-05-08T20:50:40Z,east,C,52.62

										"""
						}
						"application/vnd.influx.arrow": schema: {
							type:   "string"
							format: "binary"
						}
					}
				}
				"429": {
					description: "Token is temporarily over quota. The Retry-After header describes when to try the read again."
					headers: "Retry-After": {
						description: "A non-negative decimal integer indicating the seconds to delay after the response is received."
						schema: {
							type:   "integer"
							format: "int32"
						}
					}
				}
				default: {
					description: "Error processing query"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
			}
		}
		"/buckets": {
			get: {
				operationId: "GetBuckets"
				tags: ["Buckets"]
				summary: "List all buckets"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					$ref: "#/components/parameters/Offset"
				}, {
					$ref: "#/components/parameters/Limit"
				}, {
					$ref: "#/components/parameters/After"
				}, {
					in:          "query"
					name:        "org"
					description: "The name of the organization."
					schema: type: "string"
				}, {
					in:          "query"
					name:        "orgID"
					description: "The organization ID."
					schema: type: "string"
				}, {
					in:          "query"
					name:        "name"
					description: "Only returns buckets with a specific name."
					schema: type: "string"
				}, {
					in:          "query"
					name:        "id"
					description: "Only returns buckets with a specific ID."
					schema: type: "string"
				}]
				responses: {
					"200": {
						description: "A list of buckets"
						content: "application/json": schema: $ref: "#/components/schemas/Buckets"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			post: {
				operationId: "PostBuckets"
				tags: ["Buckets"]
				summary: "Create a bucket"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}]
				requestBody: {
					description: "Bucket to create"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/PostBucketRequest"
				}
				responses: {
					"201": {
						description: "Bucket created"
						content: "application/json": schema: $ref: "#/components/schemas/Bucket"
					}
					"422": {
						description: "Request body failed validation"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
		}
		"/buckets/{bucketID}": {
			get: {
				operationId: "GetBucketsID"
				tags: ["Buckets"]
				summary: "Retrieve a bucket"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "bucketID"
					schema: type: "string"
					required:    true
					description: "The bucket ID."
				}]
				responses: {
					"200": {
						description: "Bucket details"
						content: "application/json": schema: $ref: "#/components/schemas/Bucket"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			patch: {
				operationId: "PatchBucketsID"
				tags: ["Buckets"]
				summary: "Update a bucket"
				requestBody: {
					description: "Bucket update to apply"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/PatchBucketRequest"
				}
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "bucketID"
					schema: type: "string"
					required:    true
					description: "The bucket ID."
				}]
				responses: {
					"200": {
						description: "An updated bucket"
						content: "application/json": schema: $ref: "#/components/schemas/Bucket"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			delete: {
				operationId: "DeleteBucketsID"
				tags: ["Buckets"]
				summary: "Delete a bucket"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "bucketID"
					schema: type: "string"
					required:    true
					description: "The ID of the bucket to delete."
				}]
				responses: {
					"204": description: "Delete has been accepted"
					"404": {
						description: "Bucket not found"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
		}
		"/buckets/{bucketID}/labels": {
			get: {
				operationId: "GetBucketsIDLabels"
				tags: ["Buckets"]
				summary: "List all labels for a bucket"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "bucketID"
					schema: type: "string"
					required:    true
					description: "The bucket ID."
				}]
				responses: {
					"200": {
						description: "A list of all labels for a bucket"
						content: "application/json": schema: $ref: "#/components/schemas/LabelsResponse"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			post: {
				operationId: "PostBucketsIDLabels"
				tags: ["Buckets"]
				summary: "Add a label to a bucket"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "bucketID"
					schema: type: "string"
					required:    true
					description: "The bucket ID."
				}]
				requestBody: {
					description: "Label to add"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/LabelMapping"
				}
				responses: {
					"201": {
						description: "The newly added label"
						content: "application/json": schema: $ref: "#/components/schemas/LabelResponse"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
		}
		"/buckets/{bucketID}/labels/{labelID}": delete: {
			operationId: "DeleteBucketsIDLabelsID"
			tags: ["Buckets"]
			summary: "Delete a label from a bucket"
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}, {
				in:   "path"
				name: "bucketID"
				schema: type: "string"
				required:    true
				description: "The bucket ID."
			}, {
				in:   "path"
				name: "labelID"
				schema: type: "string"
				required:    true
				description: "The ID of the label to delete."
			}]
			responses: {
				"204": description: "Delete has been accepted"
				"404": {
					description: "Bucket not found"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
				default: {
					description: "Unexpected error"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
			}
		}
		"/buckets/{bucketID}/members": {
			get: {
				operationId: "GetBucketsIDMembers"
				tags: ["Buckets"]
				summary: "List all users with member privileges for a bucket"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "bucketID"
					schema: type: "string"
					required:    true
					description: "The bucket ID."
				}]
				responses: {
					"200": {
						description: "A list of bucket members"
						content: "application/json": schema: $ref: "#/components/schemas/ResourceMembers"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			post: {
				operationId: "PostBucketsIDMembers"
				tags: ["Buckets"]
				summary: "Add a member to a bucket"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "bucketID"
					schema: type: "string"
					required:    true
					description: "The bucket ID."
				}]
				requestBody: {
					description: "User to add as member"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/AddResourceMemberRequestBody"
				}
				responses: {
					"201": {
						description: "Member added to bucket"
						content: "application/json": schema: $ref: "#/components/schemas/ResourceMember"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
		}
		"/buckets/{bucketID}/members/{userID}": delete: {
			operationId: "DeleteBucketsIDMembersID"
			tags: ["Buckets"]
			summary: "Remove a member from a bucket"
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}, {
				in:   "path"
				name: "userID"
				schema: type: "string"
				required:    true
				description: "The ID of the member to remove."
			}, {
				in:   "path"
				name: "bucketID"
				schema: type: "string"
				required:    true
				description: "The bucket ID."
			}]
			responses: {
				"204": description: "Member removed"
				default: {
					description: "Unexpected error"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
			}
		}
		"/buckets/{bucketID}/owners": {
			get: {
				operationId: "GetBucketsIDOwners"
				tags: ["Buckets"]
				summary: "List all owners of a bucket"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "bucketID"
					schema: type: "string"
					required:    true
					description: "The bucket ID."
				}]
				responses: {
					"200": {
						description: "A list of bucket owners"
						content: "application/json": schema: $ref: "#/components/schemas/ResourceOwners"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			post: {
				operationId: "PostBucketsIDOwners"
				tags: ["Buckets"]
				summary: "Add an owner to a bucket"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "bucketID"
					schema: type: "string"
					required:    true
					description: "The bucket ID."
				}]
				requestBody: {
					description: "User to add as owner"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/AddResourceMemberRequestBody"
				}
				responses: {
					"201": {
						description: "Bucket owner added"
						content: "application/json": schema: $ref: "#/components/schemas/ResourceOwner"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
		}
		"/buckets/{bucketID}/owners/{userID}": delete: {
			operationId: "DeleteBucketsIDOwnersID"
			tags: ["Buckets"]
			summary: "Remove an owner from a bucket"
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}, {
				in:   "path"
				name: "userID"
				schema: type: "string"
				required:    true
				description: "The ID of the owner to remove."
			}, {
				in:   "path"
				name: "bucketID"
				schema: type: "string"
				required:    true
				description: "The bucket ID."
			}]
			responses: {
				"204": description: "Owner removed"
				default: {
					description: "Unexpected error"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
			}
		}
		"/orgs": {
			get: {
				operationId: "GetOrgs"
				tags: ["Organizations"]
				summary: "List all organizations"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					$ref: "#/components/parameters/Offset"
				}, {
					$ref: "#/components/parameters/Limit"
				}, {
					$ref: "#/components/parameters/Descending"
				}, {
					in:   "query"
					name: "org"
					schema: type: "string"
					description: "Filter organizations to a specific organization name."
				}, {
					in:   "query"
					name: "orgID"
					schema: type: "string"
					description: "Filter organizations to a specific organization ID."
				}, {
					in:   "query"
					name: "userID"
					schema: type: "string"
					description: "Filter organizations to a specific user ID."
				}]
				responses: {
					"200": {
						description: "A list of organizations"
						content: "application/json": schema: $ref: "#/components/schemas/Organizations"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			post: {
				operationId: "PostOrgs"
				tags: ["Organizations"]
				summary: "Create an organization"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}]
				requestBody: {
					description: "Organization to create"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/PostOrganizationRequest"
				}
				responses: {
					"201": {
						description: "Organization created"
						content: "application/json": schema: $ref: "#/components/schemas/Organization"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
		}
		"/orgs/{orgID}": {
			get: {
				operationId: "GetOrgsID"
				tags: ["Organizations"]
				summary: "Retrieve an organization"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "orgID"
					schema: type: "string"
					required:    true
					description: "The ID of the organization to get."
				}]
				responses: {
					"200": {
						description: "Organization details"
						content: "application/json": schema: $ref: "#/components/schemas/Organization"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			patch: {
				operationId: "PatchOrgsID"
				tags: ["Organizations"]
				summary: "Update an organization"
				requestBody: {
					description: "Organization update to apply"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/PatchOrganizationRequest"
				}
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "orgID"
					schema: type: "string"
					required:    true
					description: "The ID of the organization to get."
				}]
				responses: {
					"200": {
						description: "Organization updated"
						content: "application/json": schema: $ref: "#/components/schemas/Organization"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			delete: {
				operationId: "DeleteOrgsID"
				tags: ["Organizations"]
				summary: "Delete an organization"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "orgID"
					schema: type: "string"
					required:    true
					description: "The ID of the organization to delete."
				}]
				responses: {
					"204": description: "Delete has been accepted"
					"404": {
						description: "Organization not found"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
		}
		"/orgs/{orgID}/secrets": {
			get: {
				operationId: "GetOrgsIDSecrets"
				tags: ["Secrets"]
				summary: "List all secret keys for an organization"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "orgID"
					schema: type: "string"
					required:    true
					description: "The organization ID."
				}]
				responses: {
					"200": {
						description: "A list of all secret keys"
						content: "application/json": schema: $ref: "#/components/schemas/SecretKeysResponse"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			patch: {
				operationId: "PatchOrgsIDSecrets"
				tags: ["Secrets"]
				summary: "Update secrets in an organization"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "orgID"
					schema: type: "string"
					required:    true
					description: "The organization ID."
				}]
				requestBody: {
					description: "Secret key value pairs to update/add"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/Secrets"
				}
				responses: {
					"204": description: "Keys successfully patched"
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
		}
		"/orgs/{orgID}/members": {
			get: {
				operationId: "GetOrgsIDMembers"
				tags: ["Organizations"]
				summary: "List all members of an organization"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "orgID"
					schema: type: "string"
					required:    true
					description: "The organization ID."
				}]
				responses: {
					"200": {
						description: "A list of organization members"
						content: "application/json": schema: $ref: "#/components/schemas/ResourceMembers"
					}
					"404": {
						description: "Organization not found"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			post: {
				operationId: "PostOrgsIDMembers"
				tags: ["Organizations"]
				summary: "Add a member to an organization"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "orgID"
					schema: type: "string"
					required:    true
					description: "The organization ID."
				}]
				requestBody: {
					description: "User to add as member"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/AddResourceMemberRequestBody"
				}
				responses: {
					"201": {
						description: "Added to organization created"
						content: "application/json": schema: $ref: "#/components/schemas/ResourceMember"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
		}
		"/orgs/{orgID}/members/{userID}": delete: {
			operationId: "DeleteOrgsIDMembersID"
			tags: ["Organizations"]
			summary: "Remove a member from an organization"
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}, {
				in:   "path"
				name: "userID"
				schema: type: "string"
				required:    true
				description: "The ID of the member to remove."
			}, {
				in:   "path"
				name: "orgID"
				schema: type: "string"
				required:    true
				description: "The organization ID."
			}]
			responses: {
				"204": description: "Member removed"
				default: {
					description: "Unexpected error"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
			}
		}
		"/orgs/{orgID}/owners": {
			get: {
				operationId: "GetOrgsIDOwners"
				tags: ["Organizations"]
				summary: "List all owners of an organization"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "orgID"
					schema: type: "string"
					required:    true
					description: "The organization ID."
				}]
				responses: {
					"200": {
						description: "A list of organization owners"
						content: "application/json": schema: $ref: "#/components/schemas/ResourceOwners"
					}
					"404": {
						description: "Organization not found"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			post: {
				operationId: "PostOrgsIDOwners"
				tags: ["Organizations"]
				summary: "Add an owner to an organization"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "orgID"
					schema: type: "string"
					required:    true
					description: "The organization ID."
				}]
				requestBody: {
					description: "User to add as owner"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/AddResourceMemberRequestBody"
				}
				responses: {
					"201": {
						description: "Organization owner added"
						content: "application/json": schema: $ref: "#/components/schemas/ResourceOwner"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
		}
		"/orgs/{orgID}/owners/{userID}": delete: {
			operationId: "DeleteOrgsIDOwnersID"
			tags: ["Organizations"]
			summary: "Remove an owner from an organization"
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}, {
				in:   "path"
				name: "userID"
				schema: type: "string"
				required:    true
				description: "The ID of the owner to remove."
			}, {
				in:   "path"
				name: "orgID"
				schema: type: "string"
				required:    true
				description: "The organization ID."
			}]
			responses: {
				"204": description: "Owner removed"
				default: {
					description: "Unexpected error"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
			}
		}
		"/orgs/{orgID}/secrets/delete": post: {
			deprecated:  true
			operationId: "PostOrgsIDSecrets"
			tags: ["Secrets"]
			summary: "Delete secrets from an organization"
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}, {
				in:   "path"
				name: "orgID"
				schema: type: "string"
				required:    true
				description: "The organization ID."
			}]
			requestBody: {
				description: "Secret key to delete"
				required:    true
				content: "application/json": schema: $ref: "#/components/schemas/SecretKeys"
			}
			responses: {
				"204": description: "Keys successfully patched"
				default: {
					description: "Unexpected error"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
			}
		}
		"/orgs/{orgID}/secrets/{secretID}": delete: {
			operationId: "DeleteOrgsIDSecretsID"
			tags: ["Secrets"]
			summary: "Delete a secret from an organization"
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}, {
				in:   "path"
				name: "orgID"
				schema: type: "string"
				required:    true
				description: "The organization ID."
			}, {
				in:   "path"
				name: "secretID"
				schema: type: "string"
				required:    true
				description: "The secret ID."
			}]
			responses: {
				"204": description: "Keys successfully deleted"
				default: {
					description: "Unexpected error"
					$ref:        "#/components/responses/ServerError"
				}
			}
		}
		"/resources": get: {
			operationId: "GetResources"
			tags: ["Resources"]
			summary: "List all known resources"
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}]
			responses: {
				"200": {
					description: "All resources targets"
					content: "application/json": schema: {
						type: "array"
						items: type: "string"
					}
				}
				default: {
					description: "Internal server error"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
			}
		}
		"/stacks": {
			get: {
				operationId: "ListStacks"
				tags: ["Templates"]
				summary: "List installed templates"
				parameters: [{
					in:       "query"
					name:     "orgID"
					required: true
					schema: type: "string"
					description: "The organization ID of the stacks"
				}, {
					in:   "query"
					name: "name"
					schema: type: "string"
					description: "A collection of names to filter the list by."
				}, {
					in:   "query"
					name: "stackID"
					schema: type: "string"
					description: "A collection of stackIDs to filter the list by."
				}]
				responses: {
					"200": {
						description: "Success. Returns the list of stacks."
						content: "application/json": schema: {
							type: "object"
							properties: stacks: {
								type: "array"
								items: $ref: "#/components/schemas/Stack"
							}
						}
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			post: {
				operationId: "CreateStack"
				tags: ["Templates"]
				summary: "Create a new stack"
				requestBody: {
					description: "The stack to create."
					required:    true
					content: "application/json": schema: {
						type:  "object"
						title: "PostStackRequest"
						properties: {
							orgID: type:       "string"
							name: type:        "string"
							description: type: "string"
							urls: {
								type: "array"
								items: type: "string"
							}
						}
					}
				}
				responses: {
					"201": {
						description: "Success. Returns the newly created stack."
						content: "application/json": schema: $ref: "#/components/schemas/Stack"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
		}
		"/stacks/{stack_id}": {
			get: {
				operationId: "ReadStack"
				tags: ["Templates"]
				summary: "Retrieve a stack"
				parameters: [{
					in:       "path"
					name:     "stack_id"
					required: true
					schema: type: "string"
					description: "The identifier of the stack."
				}]
				responses: {
					"200": {
						description: "Returns the stack."
						content: "application/json": schema: $ref: "#/components/schemas/Stack"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			patch: {
				operationId: "UpdateStack"
				tags: ["Templates"]
				summary: "Update a stack"
				parameters: [{
					in:       "path"
					name:     "stack_id"
					required: true
					schema: type: "string"
					description: "The identifier of the stack."
				}]
				requestBody: {
					description: "The stack to update."
					required:    true
					content: "application/json": schema: {
						type:  "object"
						title: "PatchStackRequest"
						properties: {
							name: {
								type:     "string"
								nullable: true
							}
							description: {
								type:     "string"
								nullable: true
							}
							templateURLs: {
								type: "array"
								items: type: "string"
								nullable: true
							}
							additionalResources: {
								type: "array"
								items: {
									type: "object"
									properties: {
										resourceID: type:       "string"
										kind: type:             "string"
										templateMetaName: type: "string"
									}
									required: ["kind", "resourceID"]
								}
							}
						}
					}
				}
				responses: {
					"200": {
						description: "Returns the updated stack."
						content: "application/json": schema: $ref: "#/components/schemas/Stack"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			delete: {
				operationId: "DeleteStack"
				tags: ["Templates"]
				summary: "Delete a stack and associated resources"
				parameters: [{
					in:       "path"
					name:     "stack_id"
					required: true
					schema: type: "string"
					description: "The identifier of the stack."
				}, {
					in:       "query"
					name:     "orgID"
					required: true
					schema: type: "string"
					description: "The identifier of the organization."
				}]
				responses: {
					"204": description: "The stack and its associated resources were deleted."
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
		}
		"/stacks/{stack_id}/uninstall": post: {
			operationId: "UninstallStack"
			tags: ["Templates"]
			summary: "Uninstall a stack"
			parameters: [{
				in:       "path"
				name:     "stack_id"
				required: true
				schema: type: "string"
				description: "The identifier of the stack."
			}]
			responses: {
				"200": {
					description: "Returns the uninstalled stack."
					content: "application/json": schema: $ref: "#/components/schemas/Stack"
				}
				default: {
					description: "Unexpected error"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
			}
		}
		"/templates/apply": post: {
			operationId: "ApplyTemplate"
			tags: ["Templates"]
			summary:     "Apply or dry-run a template"
			description: "Applies or performs a dry-run of template in an organization."
			requestBody: {
				required: true
				content: {
					"application/json": schema: $ref:      "#/components/schemas/TemplateApply"
					"application/x-jsonnet": schema: $ref: "#/components/schemas/TemplateApply"
					"text/yml": schema: $ref:              "#/components/schemas/TemplateApply"
				}
			}
			responses: {
				"200": {
					description: """
						Success. The package dry-run succeeded. No new resources were created. Returns a diff and summary of the dry-run. The diff and summary won't contain IDs for resources that didn't exist at the time of the dry-run.

						"""
					content: "application/json": schema: $ref: "#/components/schemas/TemplateSummary"
				}
				"201": {
					description: """
						Success. The package applied successfully. Returns a diff and summary of the run. The summary contains newly created resources. The diff compares the initial state to the state after the package applied. This corresponds to `"dryRun": true`.

						"""
					content: "application/json": schema: $ref: "#/components/schemas/TemplateSummary"
				}
				default: {
					description: "Unexpected error"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
			}
		}
		"/templates/export": post: {
			operationId: "ExportTemplate"
			tags: ["Templates"]
			summary: "Export a new template"
			requestBody: {
				description: "Export resources as an InfluxDB template."
				required:    false
				content: "application/json": schema: oneOf: [{
					$ref: "#/components/schemas/TemplateExportByID"
				}, {
					$ref: "#/components/schemas/TemplateExportByName"
				}]
			}
			responses: {
				"200": {
					description: "The template was created successfully. Returns the newly created template."
					content: {
						"application/json": schema: $ref:   "#/components/schemas/Template"
						"application/x-yaml": schema: $ref: "#/components/schemas/Template"
					}
				}
				default: {
					description: "Unexpected error"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
			}
		}
		"/tasks/{taskID}": {
			get: {
				operationId: "GetTasksID"
				tags: ["Tasks"]
				summary: "Retrieve a task"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "taskID"
					schema: type: "string"
					required:    true
					description: "The task ID."
				}]
				responses: {
					"200": {
						description: "Task details"
						content: "application/json": schema: $ref: "#/components/schemas/Task"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			patch: {
				operationId: "PatchTasksID"
				tags: ["Tasks"]
				summary:     "Update a task"
				description: "Update a task. This will cancel all queued runs."
				requestBody: {
					description: "Task update to apply"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/TaskUpdateRequest"
				}
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "taskID"
					schema: type: "string"
					required:    true
					description: "The task ID."
				}]
				responses: {
					"200": {
						description: "Task updated"
						content: "application/json": schema: $ref: "#/components/schemas/Task"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			delete: {
				operationId: "DeleteTasksID"
				tags: ["Tasks"]
				summary:     "Delete a task"
				description: "Deletes a task and all associated records"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "taskID"
					schema: type: "string"
					required:    true
					description: "The ID of the task to delete."
				}]
				responses: {
					"204": description: "Task deleted"
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
		}
		"/tasks/{taskID}/runs": {
			get: {
				operationId: "GetTasksIDRuns"
				tags: ["Tasks"]
				summary: "List runs for a task"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "taskID"
					schema: type: "string"
					required:    true
					description: "The ID of the task to get runs for."
				}, {
					in:   "query"
					name: "after"
					schema: type: "string"
					description: "Returns runs after a specific ID."
				}, {
					in:   "query"
					name: "limit"
					schema: {
						type:    "integer"
						minimum: 1
						maximum: 500
						default: 100
					}
					description: "The number of runs to return"
				}, {
					in:   "query"
					name: "afterTime"
					schema: {
						type:   "string"
						format: "date-time"
					}
					description: "Filter runs to those scheduled after this time, RFC3339"
				}, {
					in:   "query"
					name: "beforeTime"
					schema: {
						type:   "string"
						format: "date-time"
					}
					description: "Filter runs to those scheduled before this time, RFC3339"
				}]
				responses: {
					"200": {
						description: "A list of task runs"
						content: "application/json": schema: $ref: "#/components/schemas/Runs"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			post: {
				operationId: "PostTasksIDRuns"
				tags: ["Tasks"]
				summary: "Manually start a task run, overriding the current schedule"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "taskID"
					schema: type: "string"
					required: true
				}]
				requestBody: content: "application/json": schema: $ref: "#/components/schemas/RunManually"
				responses: {
					"201": {
						description: "Run scheduled to start"
						content: "application/json": schema: $ref: "#/components/schemas/Run"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
		}
		"/tasks/{taskID}/runs/{runID}": {
			get: {
				operationId: "GetTasksIDRunsID"
				tags: ["Tasks"]
				summary: "Retrieve a single run for a task"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "taskID"
					schema: type: "string"
					required:    true
					description: "The task ID."
				}, {
					in:   "path"
					name: "runID"
					schema: type: "string"
					required:    true
					description: "The run ID."
				}]
				responses: {
					"200": {
						description: "The run record"
						content: "application/json": schema: $ref: "#/components/schemas/Run"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			delete: {
				operationId: "DeleteTasksIDRunsID"
				tags: ["Tasks"]
				summary: "Cancel a running task"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "taskID"
					schema: type: "string"
					required:    true
					description: "The task ID."
				}, {
					in:   "path"
					name: "runID"
					schema: type: "string"
					required:    true
					description: "The run ID."
				}]
				responses: {
					"204": description: "Delete has been accepted"
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
		}
		"/tasks/{taskID}/runs/{runID}/retry": post: {
			operationId: "PostTasksIDRunsIDRetry"
			tags: ["Tasks"]
			summary: "Retry a task run"
			requestBody: content: "application/json; charset=utf-8": schema: type: "object"
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}, {
				in:   "path"
				name: "taskID"
				schema: type: "string"
				required:    true
				description: "The task ID."
			}, {
				in:   "path"
				name: "runID"
				schema: type: "string"
				required:    true
				description: "The run ID."
			}]
			responses: {
				"200": {
					description: "Run that has been queued"
					content: "application/json": schema: $ref: "#/components/schemas/Run"
				}
				default: {
					description: "Unexpected error"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
			}
		}
		"/tasks/{taskID}/logs": get: {
			operationId: "GetTasksIDLogs"
			tags: ["Tasks"]
			summary: "Retrieve all logs for a task"
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}, {
				in:   "path"
				name: "taskID"
				schema: type: "string"
				required:    true
				description: "The task ID."
			}]
			responses: {
				"200": {
					description: "All logs for a task"
					content: "application/json": schema: $ref: "#/components/schemas/Logs"
				}
				default: {
					description: "Unexpected error"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
			}
		}
		"/tasks/{taskID}/runs/{runID}/logs": get: {
			operationId: "GetTasksIDRunsIDLogs"
			tags: ["Tasks"]
			summary: "Retrieve all logs for a run"
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}, {
				in:   "path"
				name: "taskID"
				schema: type: "string"
				required:    true
				description: "ID of task to get logs for."
			}, {
				in:   "path"
				name: "runID"
				schema: type: "string"
				required:    true
				description: "ID of run to get logs for."
			}]
			responses: {
				"200": {
					description: "All logs for a run"
					content: "application/json": schema: $ref: "#/components/schemas/Logs"
				}
				default: {
					description: "Unexpected error"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
			}
		}
		"/tasks/{taskID}/labels": {
			get: {
				operationId: "GetTasksIDLabels"
				tags: ["Tasks"]
				summary: "List all labels for a task"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "taskID"
					schema: type: "string"
					required:    true
					description: "The task ID."
				}]
				responses: {
					"200": {
						description: "A list of all labels for a task"
						content: "application/json": schema: $ref: "#/components/schemas/LabelsResponse"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			post: {
				operationId: "PostTasksIDLabels"
				tags: ["Tasks"]
				summary: "Add a label to a task"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "taskID"
					schema: type: "string"
					required:    true
					description: "The task ID."
				}]
				requestBody: {
					description: "Label to add"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/LabelMapping"
				}
				responses: {
					"201": {
						description: "A list of all labels for a task"
						content: "application/json": schema: $ref: "#/components/schemas/LabelResponse"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
		}
		"/tasks/{taskID}/labels/{labelID}": delete: {
			operationId: "DeleteTasksIDLabelsID"
			tags: ["Tasks"]
			summary: "Delete a label from a task"
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}, {
				in:   "path"
				name: "taskID"
				schema: type: "string"
				required:    true
				description: "The task ID."
			}, {
				in:   "path"
				name: "labelID"
				schema: type: "string"
				required:    true
				description: "The label ID."
			}]
			responses: {
				"204": description: "Delete has been accepted"
				"404": {
					description: "Task not found"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
				default: {
					description: "Unexpected error"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
			}
		}
		"/flags": get: {
			operationId: "GetFlags"
			tags: ["Users"]
			summary: "Return the feature flags for the currently authenticated user"
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}]
			responses: {
				"200": {
					description: "Feature flags for the currently authenticated user"
					content: "application/json": schema: $ref: "#/components/schemas/Flags"
				}
				default: {
					description: "Unexpected error"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
			}
		}
		"/me": get: {
			operationId: "GetMe"
			tags: ["Users"]
			summary: "Retrieve the currently authenticated user"
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}]
			responses: {
				"200": {
					description: "The currently authenticated user."
					content: "application/json": schema: $ref: "#/components/schemas/UserResponse"
				}
				default: {
					description: "Unexpected error"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
			}
		}
		"/me/password": put: {
			operationId: "PutMePassword"
			tags: ["Users"]
			summary: "Update a password"
			security: [{
				BasicAuthentication: []
			}]
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}]
			requestBody: {
				description: "New password"
				required:    true
				content: "application/json": schema: $ref: "#/components/schemas/PasswordResetBody"
			}
			responses: {
				"204": description: "Password successfully updated"
				default: {
					description: "Unsuccessful authentication"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
			}
		}
		"/tasks/{taskID}/members": {
			get: {
				operationId: "GetTasksIDMembers"
				tags: ["Tasks"]
				summary: "List all task members"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "taskID"
					schema: type: "string"
					required:    true
					description: "The task ID."
				}]
				responses: {
					"200": {
						description: "A list of users who have member privileges for a task"
						content: "application/json": schema: $ref: "#/components/schemas/ResourceMembers"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			post: {
				operationId: "PostTasksIDMembers"
				tags: ["Tasks"]
				summary: "Add a member to a task"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "taskID"
					schema: type: "string"
					required:    true
					description: "The task ID."
				}]
				requestBody: {
					description: "User to add as member"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/AddResourceMemberRequestBody"
				}
				responses: {
					"201": {
						description: "Added to task members"
						content: "application/json": schema: $ref: "#/components/schemas/ResourceMember"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
		}
		"/tasks/{taskID}/members/{userID}": delete: {
			operationId: "DeleteTasksIDMembersID"
			tags: ["Tasks"]
			summary: "Remove a member from a task"
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}, {
				in:   "path"
				name: "userID"
				schema: type: "string"
				required:    true
				description: "The ID of the member to remove."
			}, {
				in:   "path"
				name: "taskID"
				schema: type: "string"
				required:    true
				description: "The task ID."
			}]
			responses: {
				"204": description: "Member removed"
				default: {
					description: "Unexpected error"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
			}
		}
		"/tasks/{taskID}/owners": {
			get: {
				operationId: "GetTasksIDOwners"
				tags: ["Tasks"]
				summary: "List all owners of a task"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "taskID"
					schema: type: "string"
					required:    true
					description: "The task ID."
				}]
				responses: {
					"200": {
						description: "A list of users who have owner privileges for a task"
						content: "application/json": schema: $ref: "#/components/schemas/ResourceOwners"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			post: {
				operationId: "PostTasksIDOwners"
				tags: ["Tasks"]
				summary: "Add an owner to a task"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "taskID"
					schema: type: "string"
					required:    true
					description: "The task ID."
				}]
				requestBody: {
					description: "User to add as owner"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/AddResourceMemberRequestBody"
				}
				responses: {
					"201": {
						description: "Added to task owners"
						content: "application/json": schema: $ref: "#/components/schemas/ResourceOwner"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
		}
		"/tasks/{taskID}/owners/{userID}": delete: {
			operationId: "DeleteTasksIDOwnersID"
			tags: ["Tasks"]
			summary: "Remove an owner from a task"
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}, {
				in:   "path"
				name: "userID"
				schema: type: "string"
				required:    true
				description: "The ID of the owner to remove."
			}, {
				in:   "path"
				name: "taskID"
				schema: type: "string"
				required:    true
				description: "The task ID."
			}]
			responses: {
				"204": description: "Owner removed"
				default: {
					description: "Unexpected error"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
			}
		}
		"/users/{userID}/password": post: {
			operationId: "PostUsersIDPassword"
			tags: ["Users"]
			summary: "Update a password"
			security: [{
				BasicAuthentication: []
			}]
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}, {
				in:   "path"
				name: "userID"
				schema: type: "string"
				required:    true
				description: "The user ID."
			}]
			requestBody: {
				description: "New password"
				required:    true
				content: "application/json": schema: $ref: "#/components/schemas/PasswordResetBody"
			}
			responses: {
				"204": description: "Password successfully updated"
				default: {
					description: "Unsuccessful authentication"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
			}
		}
		"/checks": {
			get: {
				operationId: "GetChecks"
				tags: ["Checks"]
				summary: "List all checks"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					$ref: "#/components/parameters/Offset"
				}, {
					$ref: "#/components/parameters/Limit"
				}, {
					in:          "query"
					name:        "orgID"
					required:    true
					description: "Only show checks that belong to a specific organization ID."
					schema: type: "string"
				}]
				responses: {
					"200": {
						description: "A list of checks"
						content: "application/json": schema: $ref: "#/components/schemas/Checks"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			post: {
				operationId: "CreateCheck"
				tags: ["Checks"]
				summary: "Add new check"
				requestBody: {
					description: "Check to create"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/PostCheck"
				}
				responses: {
					"201": {
						description: "Check created"
						content: "application/json": schema: $ref: "#/components/schemas/Check"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
		}
		"/checks/{checkID}": {
			get: {
				operationId: "GetChecksID"
				tags: ["Checks"]
				summary: "Retrieve a check"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "checkID"
					schema: type: "string"
					required:    true
					description: "The check ID."
				}]
				responses: {
					"200": {
						description: "The check requested"
						content: "application/json": schema: $ref: "#/components/schemas/Check"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			put: {
				operationId: "PutChecksID"
				tags: ["Checks"]
				summary: "Update a check"
				requestBody: {
					description: "Check update to apply"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/Check"
				}
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "checkID"
					schema: type: "string"
					required:    true
					description: "The check ID."
				}]
				responses: {
					"200": {
						description: "An updated check"
						content: "application/json": schema: $ref: "#/components/schemas/Check"
					}
					"404": {
						description: "The check was not found"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			patch: {
				operationId: "PatchChecksID"
				tags: ["Checks"]
				summary: "Update a check"
				requestBody: {
					description: "Check update to apply"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/CheckPatch"
				}
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "checkID"
					schema: type: "string"
					required:    true
					description: "The check ID."
				}]
				responses: {
					"200": {
						description: "An updated check"
						content: "application/json": schema: $ref: "#/components/schemas/Check"
					}
					"404": {
						description: "The check was not found"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			delete: {
				operationId: "DeleteChecksID"
				tags: ["Checks"]
				summary: "Delete a check"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "checkID"
					schema: type: "string"
					required:    true
					description: "The check ID."
				}]
				responses: {
					"204": description: "Delete has been accepted"
					"404": {
						description: "The check was not found"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
		}
		"/checks/{checkID}/labels": {
			get: {
				operationId: "GetChecksIDLabels"
				tags: ["Checks"]
				summary: "List all labels for a check"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "checkID"
					schema: type: "string"
					required:    true
					description: "The check ID."
				}]
				responses: {
					"200": {
						description: "A list of all labels for a check"
						content: "application/json": schema: $ref: "#/components/schemas/LabelsResponse"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			post: {
				operationId: "PostChecksIDLabels"
				tags: ["Checks"]
				summary: "Add a label to a check"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "checkID"
					schema: type: "string"
					required:    true
					description: "The check ID."
				}]
				requestBody: {
					description: "Label to add"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/LabelMapping"
				}
				responses: {
					"201": {
						description: "The label was added to the check"
						content: "application/json": schema: $ref: "#/components/schemas/LabelResponse"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
		}
		"/checks/{checkID}/labels/{labelID}": delete: {
			operationId: "DeleteChecksIDLabelsID"
			tags: ["Checks"]
			summary: "Delete label from a check"
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}, {
				in:   "path"
				name: "checkID"
				schema: type: "string"
				required:    true
				description: "The check ID."
			}, {
				in:   "path"
				name: "labelID"
				schema: type: "string"
				required:    true
				description: "The ID of the label to delete."
			}]
			responses: {
				"204": description: "Delete has been accepted"
				"404": {
					description: "Check or label not found"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
				default: {
					description: "Unexpected error"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
			}
		}
		"/notificationRules": {
			get: {
				operationId: "GetNotificationRules"
				tags: ["NotificationRules"]
				summary: "List all notification rules"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					$ref: "#/components/parameters/Offset"
				}, {
					$ref: "#/components/parameters/Limit"
				}, {
					in:          "query"
					name:        "orgID"
					required:    true
					description: "Only show notification rules that belong to a specific organization ID."
					schema: type: "string"
				}, {
					in:          "query"
					name:        "checkID"
					description: "Only show notifications that belong to the specific check ID."
					schema: type: "string"
				}, {
					in:          "query"
					name:        "tag"
					description: "Only return notification rules that \"would match\" statuses which contain the tag key value pairs provided."
					schema: {
						type:    "string"
						pattern: "^[a-zA-Z0-9_]+:[a-zA-Z0-9_]+$"
						example: "env:prod"
					}
				}]
				responses: {
					"200": {
						description: "A list of notification rules"
						content: "application/json": schema: $ref: "#/components/schemas/NotificationRules"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			post: {
				operationId: "CreateNotificationRule"
				tags: ["NotificationRules"]
				summary: "Add a notification rule"
				requestBody: {
					description: "Notification rule to create"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/PostNotificationRule"
				}
				responses: {
					"201": {
						description: "Notification rule created"
						content: "application/json": schema: $ref: "#/components/schemas/NotificationRule"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
		}
		"/checks/{checkID}/query": get: {
			operationId: "GetChecksIDQuery"
			tags: ["Checks"]
			summary: "Retrieve a check query"
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}, {
				in:   "path"
				name: "checkID"
				schema: type: "string"
				required:    true
				description: "The check ID."
			}]
			responses: {
				"200": {
					description: "The check query requested"
					content: "application/json": schema: $ref: "#/components/schemas/FluxResponse"
				}
				"400": {
					description: "Invalid request"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
				"404": {
					description: "Check not found"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
				default: {
					description: "Unexpected error"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
			}
		}
		"/notificationRules/{ruleID}": {
			get: {
				operationId: "GetNotificationRulesID"
				tags: ["NotificationRules"]
				summary: "Retrieve a notification rule"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "ruleID"
					schema: type: "string"
					required:    true
					description: "The notification rule ID."
				}]
				responses: {
					"200": {
						description: "The notification rule requested"
						content: "application/json": schema: $ref: "#/components/schemas/NotificationRule"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			put: {
				operationId: "PutNotificationRulesID"
				tags: ["NotificationRules"]
				summary: "Update a notification rule"
				requestBody: {
					description: "Notification rule update to apply"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/NotificationRule"
				}
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "ruleID"
					schema: type: "string"
					required:    true
					description: "The notification rule ID."
				}]
				responses: {
					"200": {
						description: "An updated notification rule"
						content: "application/json": schema: $ref: "#/components/schemas/NotificationRule"
					}
					"404": {
						description: "The notification rule was not found"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			patch: {
				operationId: "PatchNotificationRulesID"
				tags: ["NotificationRules"]
				summary: "Update a notification rule"
				requestBody: {
					description: "Notification rule update to apply"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/NotificationRuleUpdate"
				}
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "ruleID"
					schema: type: "string"
					required:    true
					description: "The notification rule ID."
				}]
				responses: {
					"200": {
						description: "An updated notification rule"
						content: "application/json": schema: $ref: "#/components/schemas/NotificationRule"
					}
					"404": {
						description: "The notification rule was not found"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			delete: {
				operationId: "DeleteNotificationRulesID"
				tags: ["NotificationRules"]
				summary: "Delete a notification rule"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "ruleID"
					schema: type: "string"
					required:    true
					description: "The notification rule ID."
				}]
				responses: {
					"204": description: "Delete has been accepted"
					"404": {
						description: "The check was not found"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
		}
		"/notificationRules/{ruleID}/labels": {
			get: {
				operationId: "GetNotificationRulesIDLabels"
				tags: ["NotificationRules"]
				summary: "List all labels for a notification rule"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "ruleID"
					schema: type: "string"
					required:    true
					description: "The notification rule ID."
				}]
				responses: {
					"200": {
						description: "A list of all labels for a notification rule"
						content: "application/json": schema: $ref: "#/components/schemas/LabelsResponse"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			post: {
				operationId: "PostNotificationRuleIDLabels"
				tags: ["NotificationRules"]
				summary: "Add a label to a notification rule"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "ruleID"
					schema: type: "string"
					required:    true
					description: "The notification rule ID."
				}]
				requestBody: {
					description: "Label to add"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/LabelMapping"
				}
				responses: {
					"201": {
						description: "The label was added to the notification rule"
						content: "application/json": schema: $ref: "#/components/schemas/LabelResponse"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
		}
		"/notificationRules/{ruleID}/labels/{labelID}": delete: {
			operationId: "DeleteNotificationRulesIDLabelsID"
			tags: ["NotificationRules"]
			summary: "Delete label from a notification rule"
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}, {
				in:   "path"
				name: "ruleID"
				schema: type: "string"
				required:    true
				description: "The notification rule ID."
			}, {
				in:   "path"
				name: "labelID"
				schema: type: "string"
				required:    true
				description: "The ID of the label to delete."
			}]
			responses: {
				"204": description: "Delete has been accepted"
				"404": {
					description: "Rule or label not found"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
				default: {
					description: "Unexpected error"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
			}
		}
		"/notificationRules/{ruleID}/query": get: {
			operationId: "GetNotificationRulesIDQuery"
			tags: ["Rules"]
			summary: "Retrieve a notification rule query"
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}, {
				in:   "path"
				name: "ruleID"
				schema: type: "string"
				required:    true
				description: "The notification rule ID."
			}]
			responses: {
				"200": {
					description: "The notification rule query requested"
					content: "application/json": schema: $ref: "#/components/schemas/FluxResponse"
				}
				"400": {
					description: "Invalid request"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
				"404": {
					description: "Notification rule not found"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
				default: {
					description: "Unexpected error"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
			}
		}
		"/notificationEndpoints": {
			get: {
				operationId: "GetNotificationEndpoints"
				tags: ["NotificationEndpoints"]
				summary: "List all notification endpoints"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					$ref: "#/components/parameters/Offset"
				}, {
					$ref: "#/components/parameters/Limit"
				}, {
					in:          "query"
					name:        "orgID"
					required:    true
					description: "Only show notification endpoints that belong to specific organization ID."
					schema: type: "string"
				}]
				responses: {
					"200": {
						description: "A list of notification endpoints"
						content: "application/json": schema: $ref: "#/components/schemas/NotificationEndpoints"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			post: {
				operationId: "CreateNotificationEndpoint"
				tags: ["NotificationEndpoints"]
				summary: "Add a notification endpoint"
				requestBody: {
					description: "Notification endpoint to create"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/PostNotificationEndpoint"
				}
				responses: {
					"201": {
						description: "Notification endpoint created"
						content: "application/json": schema: $ref: "#/components/schemas/NotificationEndpoint"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
		}
		"/notificationEndpoints/{endpointID}": {
			get: {
				operationId: "GetNotificationEndpointsID"
				tags: ["NotificationEndpoints"]
				summary: "Retrieve a notification endpoint"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "endpointID"
					schema: type: "string"
					required:    true
					description: "The notification endpoint ID."
				}]
				responses: {
					"200": {
						description: "The notification endpoint requested"
						content: "application/json": schema: $ref: "#/components/schemas/NotificationEndpoint"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			put: {
				operationId: "PutNotificationEndpointsID"
				tags: ["NotificationEndpoints"]
				summary: "Update a notification endpoint"
				requestBody: {
					description: "A new notification endpoint to replace the existing endpoint with"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/NotificationEndpoint"
				}
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "endpointID"
					schema: type: "string"
					required:    true
					description: "The notification endpoint ID."
				}]
				responses: {
					"200": {
						description: "An updated notification endpoint"
						content: "application/json": schema: $ref: "#/components/schemas/NotificationEndpoint"
					}
					"404": {
						description: "The notification endpoint was not found"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			patch: {
				operationId: "PatchNotificationEndpointsID"
				tags: ["NotificationEndpoints"]
				summary: "Update a notification endpoint"
				requestBody: {
					description: "Check update to apply"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/NotificationEndpointUpdate"
				}
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "endpointID"
					schema: type: "string"
					required:    true
					description: "The notification endpoint ID."
				}]
				responses: {
					"200": {
						description: "An updated notification endpoint"
						content: "application/json": schema: $ref: "#/components/schemas/NotificationEndpoint"
					}
					"404": {
						description: "The notification endpoint was not found"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			delete: {
				operationId: "DeleteNotificationEndpointsID"
				tags: ["NotificationEndpoints"]
				summary: "Delete a notification endpoint"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "endpointID"
					schema: type: "string"
					required:    true
					description: "The notification endpoint ID."
				}]
				responses: {
					"204": description: "Delete has been accepted"
					"404": {
						description: "The endpoint was not found"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
		}
		"/notificationEndpoints/{endpointID}/labels": {
			get: {
				operationId: "GetNotificationEndpointsIDLabels"
				tags: ["NotificationEndpoints"]
				summary: "List all labels for a notification endpoint"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "endpointID"
					schema: type: "string"
					required:    true
					description: "The notification endpoint ID."
				}]
				responses: {
					"200": {
						description: "A list of all labels for a notification endpoint"
						content: "application/json": schema: $ref: "#/components/schemas/LabelsResponse"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			post: {
				operationId: "PostNotificationEndpointIDLabels"
				tags: ["NotificationEndpoints"]
				summary: "Add a label to a notification endpoint"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "endpointID"
					schema: type: "string"
					required:    true
					description: "The notification endpoint ID."
				}]
				requestBody: {
					description: "Label to add"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/LabelMapping"
				}
				responses: {
					"201": {
						description: "The label was added to the notification endpoint"
						content: "application/json": schema: $ref: "#/components/schemas/LabelResponse"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
		}
		"/notificationEndpoints/{endpointID}/labels/{labelID}": delete: {
			operationId: "DeleteNotificationEndpointsIDLabelsID"
			tags: ["NotificationEndpoints"]
			summary: "Delete a label from a notification endpoint"
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}, {
				in:   "path"
				name: "endpointID"
				schema: type: "string"
				required:    true
				description: "The notification endpoint ID."
			}, {
				in:   "path"
				name: "labelID"
				schema: type: "string"
				required:    true
				description: "The ID of the label to delete."
			}]
			responses: {
				"204": description: "Delete has been accepted"
				"404": {
					description: "Endpoint or label not found"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
				default: {
					description: "Unexpected error"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
			}
		}
		"/health": get: {
			operationId: "GetHealth"
			tags: ["Health"]
			summary: "Get the health of an instance"
			servers: [{
				url: ""
			}]
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}]
			responses: {
				"200": {
					description: "The instance is healthy"
					content: "application/json": schema: $ref: "#/components/schemas/HealthCheck"
				}
				"503": {
					description: "The instance is unhealthy"
					content: "application/json": schema: $ref: "#/components/schemas/HealthCheck"
				}
				default: {
					description: "Unexpected error"
					$ref:        "#/components/responses/ServerError"
				}
			}
		}
		"/ready": get: {
			operationId: "GetReady"
			tags: ["Ready"]
			summary: "Get the readiness of an instance at startup"
			servers: [{
				url: ""
			}]
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}]
			responses: {
				"200": {
					description: "The instance is ready"
					content: "application/json": schema: $ref: "#/components/schemas/Ready"
				}
				default: {
					description: "Unexpected error"
					$ref:        "#/components/responses/ServerError"
				}
			}
		}
		"/users": {
			get: {
				operationId: "GetUsers"
				tags: ["Users"]
				summary: "List all users"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					$ref: "#/components/parameters/Offset"
				}, {
					$ref: "#/components/parameters/Limit"
				}, {
					$ref: "#/components/parameters/After"
				}, {
					in:   "query"
					name: "name"
					schema: type: "string"
				}, {
					in:   "query"
					name: "id"
					schema: type: "string"
				}]
				responses: {
					"200": {
						description: "A list of users"
						content: "application/json": schema: $ref: "#/components/schemas/Users"
					}
					default: {
						description: "Unexpected error"
						$ref:        "#/components/responses/ServerError"
					}
				}
			}
			post: {
				operationId: "PostUsers"
				tags: ["Users"]
				summary: "Create a user"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}]
				requestBody: {
					description: "User to create"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/User"
				}
				responses: {
					"201": {
						description: "User created"
						content: "application/json": schema: $ref: "#/components/schemas/UserResponse"
					}
					default: {
						description: "Unexpected error"
						$ref:        "#/components/responses/ServerError"
					}
				}
			}
		}
		"/users/{userID}": {
			get: {
				operationId: "GetUsersID"
				tags: ["Users"]
				summary: "Retrieve a user"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "userID"
					schema: type: "string"
					required:    true
					description: "The user ID."
				}]
				responses: {
					"200": {
						description: "User details"
						content: "application/json": schema: $ref: "#/components/schemas/UserResponse"
					}
					default: {
						description: "Unexpected error"
						$ref:        "#/components/responses/ServerError"
					}
				}
			}
			patch: {
				operationId: "PatchUsersID"
				tags: ["Users"]
				summary: "Update a user"
				requestBody: {
					description: "User update to apply"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/User"
				}
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "userID"
					schema: type: "string"
					required:    true
					description: "The ID of the user to update."
				}]
				responses: {
					"200": {
						description: "User updated"
						content: "application/json": schema: $ref: "#/components/schemas/UserResponse"
					}
					default: {
						description: "Unexpected error"
						$ref:        "#/components/responses/ServerError"
					}
				}
			}
			delete: {
				operationId: "DeleteUsersID"
				tags: ["Users"]
				summary: "Delete a user"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "userID"
					schema: type: "string"
					required:    true
					description: "The ID of the user to delete."
				}]
				responses: {
					"204": description: "User deleted"
					default: {
						description: "Unexpected error"
						$ref:        "#/components/responses/ServerError"
					}
				}
			}
		}
		"/setup": {
			get: {
				operationId: "GetSetup"
				tags: ["Setup"]
				summary:     "Check if database has default user, org, bucket"
				description: "Returns `true` if no default user, organization, or bucket has been created."
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}]
				responses: "200": {
					description: "allowed true or false"
					content: "application/json": schema: $ref: "#/components/schemas/IsOnboarding"
				}
			}
			post: {
				operationId: "PostSetup"
				tags: ["Setup"]
				summary:     "Set up initial user, org and bucket"
				description: "Post an onboarding request to set up initial user, org and bucket."
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}]
				requestBody: {
					description: "Source to create"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/OnboardingRequest"
				}
				responses: {
					"201": {
						description: "Created default user, bucket, org"
						content: "application/json": schema: $ref: "#/components/schemas/OnboardingResponse"
					}
					default: {
						description: "Unexpected error"
						$ref:        "#/components/responses/ServerError"
					}
				}
			}
		}
		"/authorizations": {
			get: {
				operationId: "GetAuthorizations"
				tags: ["Authorizations"]
				summary: "List all authorizations"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "query"
					name: "userID"
					schema: type: "string"
					description: "Only show authorizations that belong to a user ID."
				}, {
					in:   "query"
					name: "user"
					schema: type: "string"
					description: "Only show authorizations that belong to a user name."
				}, {
					in:   "query"
					name: "orgID"
					schema: type: "string"
					description: "Only show authorizations that belong to an organization ID."
				}, {
					in:   "query"
					name: "org"
					schema: type: "string"
					description: "Only show authorizations that belong to a organization name."
				}]
				responses: {
					"200": {
						description: "A list of authorizations"
						content: "application/json": schema: $ref: "#/components/schemas/Authorizations"
					}
					default: {
						description: "Unexpected error"
						$ref:        "#/components/responses/ServerError"
					}
				}
			}
			post: {
				operationId: "PostAuthorizations"
				tags: ["Authorizations"]
				summary: "Create an authorization"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}]
				requestBody: {
					description: "Authorization to create"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/AuthorizationPostRequest"
				}
				responses: {
					"201": {
						description: "Authorization created"
						content: "application/json": schema: $ref: "#/components/schemas/Authorization"
					}
					"400": {
						description: "Invalid request"
						$ref:        "#/components/responses/ServerError"
					}
					default: {
						description: "Unexpected error"
						$ref:        "#/components/responses/ServerError"
					}
				}
			}
		}
		"/authorizations/{authID}": {
			get: {
				operationId: "GetAuthorizationsID"
				tags: ["Authorizations"]
				summary: "Retrieve an authorization"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "authID"
					schema: type: "string"
					required:    true
					description: "The ID of the authorization to get."
				}]
				responses: {
					"200": {
						description: "Authorization details"
						content: "application/json": schema: $ref: "#/components/schemas/Authorization"
					}
					default: {
						description: "Unexpected error"
						$ref:        "#/components/responses/ServerError"
					}
				}
			}
			patch: {
				operationId: "PatchAuthorizationsID"
				tags: ["Authorizations"]
				summary: "Update an authorization to be active or inactive"
				requestBody: {
					description: "Authorization to update"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/AuthorizationUpdateRequest"
				}
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "authID"
					schema: type: "string"
					required:    true
					description: "The ID of the authorization to update."
				}]
				responses: {
					"200": {
						description: "The active or inactive authorization"
						content: "application/json": schema: $ref: "#/components/schemas/Authorization"
					}
					default: {
						description: "Unexpected error"
						$ref:        "#/components/responses/ServerError"
					}
				}
			}
			delete: {
				operationId: "DeleteAuthorizationsID"
				tags: ["Authorizations"]
				summary: "Delete an authorization"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "authID"
					schema: type: "string"
					required:    true
					description: "The ID of the authorization to delete."
				}]
				responses: {
					"204": description: "Authorization deleted"
					default: {
						description: "Unexpected error"
						$ref:        "#/components/responses/ServerError"
					}
				}
			}
		}
		"/legacy/authorizations": {
			servers: [{
				url: "/private"
			}]
			get: {
				operationId: "GetLegacyAuthorizations"
				tags: ["Legacy Authorizations"]
				summary: "List all legacy authorizations"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "query"
					name: "userID"
					schema: type: "string"
					description: "Only show legacy authorizations that belong to a user ID."
				}, {
					in:   "query"
					name: "user"
					schema: type: "string"
					description: "Only show legacy authorizations that belong to a user name."
				}, {
					in:   "query"
					name: "orgID"
					schema: type: "string"
					description: "Only show legacy authorizations that belong to an organization ID."
				}, {
					in:   "query"
					name: "org"
					schema: type: "string"
					description: "Only show legacy authorizations that belong to a organization name."
				}, {
					in:   "query"
					name: "token"
					schema: type: "string"
					description: "Only show legacy authorizations with a specified token (auth name)."
				}, {
					in:   "query"
					name: "authID"
					schema: type: "string"
					description: "Only show legacy authorizations with a specified auth ID."
				}]
				responses: {
					"200": {
						description: "A list of legacy authorizations"
						content: "application/json": schema: $ref: "#/components/schemas/Authorizations"
					}
					default: {
						description: "Unexpected error"
						$ref:        "#/components/responses/ServerError"
					}
				}
			}
			post: {
				operationId: "PostLegacyAuthorizations"
				tags: ["Legacy Authorizations"]
				summary: "Create a legacy authorization"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}]
				requestBody: {
					description: "Legacy authorization to create"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/LegacyAuthorizationPostRequest"
				}
				responses: {
					"201": {
						description: "Legacy authorization created"
						content: "application/json": schema: $ref: "#/components/schemas/Authorization"
					}
					"400": {
						description: "Invalid request"
						$ref:        "#/components/responses/ServerError"
					}
					default: {
						description: "Unexpected error"
						$ref:        "#/components/responses/ServerError"
					}
				}
			}
		}
		"/legacy/authorizations/{authID}": {
			servers: [{
				url: "/private"
			}]
			get: {
				operationId: "GetLegacyAuthorizationsID"
				tags: ["Legacy Authorizations"]
				summary: "Retrieve a legacy authorization"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "authID"
					schema: type: "string"
					required:    true
					description: "The ID of the legacy authorization to get."
				}]
				responses: {
					"200": {
						description: "Legacy authorization details"
						content: "application/json": schema: $ref: "#/components/schemas/Authorization"
					}
					default: {
						description: "Unexpected error"
						$ref:        "#/components/responses/ServerError"
					}
				}
			}
			patch: {
				operationId: "PatchLegacyAuthorizationsID"
				tags: ["Legacy Authorizations"]
				summary: "Update a legacy authorization to be active or inactive"
				requestBody: {
					description: "Legacy authorization to update"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/AuthorizationUpdateRequest"
				}
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "authID"
					schema: type: "string"
					required:    true
					description: "The ID of the legacy authorization to update."
				}]
				responses: {
					"200": {
						description: "The active or inactive legacy authorization"
						content: "application/json": schema: $ref: "#/components/schemas/Authorization"
					}
					default: {
						description: "Unexpected error"
						$ref:        "#/components/responses/ServerError"
					}
				}
			}
			delete: {
				operationId: "DeleteLegacyAuthorizationsID"
				tags: ["Legacy Authorizations"]
				summary: "Delete a legacy authorization"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "authID"
					schema: type: "string"
					required:    true
					description: "The ID of the legacy authorization to delete."
				}]
				responses: {
					"204": description: "Legacy authorization deleted"
					default: {
						description: "Unexpected error"
						$ref:        "#/components/responses/ServerError"
					}
				}
			}
		}
		"/legacy/authorizations/{authID}/password": {
			servers: [{
				url: "/private"
			}]
			post: {
				operationId: "PostLegacyAuthorizationsIDPassword"
				tags: ["Legacy Authorizations"]
				summary: "Set a legacy authorization password"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "authID"
					schema: type: "string"
					required:    true
					description: "The ID of the legacy authorization to update."
				}]
				requestBody: {
					description: "New password"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/PasswordResetBody"
				}
				responses: {
					"204": description: "Legacy authorization password set"
					default: {
						description: "Unexpected error"
						$ref:        "#/components/responses/ServerError"
					}
				}
			}
		}
		"/variables": {
			get: {
				operationId: "GetVariables"
				tags: ["Variables"]
				summary: "List all variables"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:          "query"
					name:        "org"
					description: "The name of the organization."
					schema: type: "string"
				}, {
					in:          "query"
					name:        "orgID"
					description: "The organization ID."
					schema: type: "string"
				}]
				responses: {
					"200": {
						description: "A list of variables for an organization"
						content: "application/json": schema: $ref: "#/components/schemas/Variables"
					}
					"400": {
						description: "Invalid request"
						$ref:        "#/components/responses/ServerError"
					}
					default: {
						description: "Internal server error"
						$ref:        "#/components/responses/ServerError"
					}
				}
			}
			post: {
				operationId: "PostVariables"
				summary:     "Create a variable"
				tags: ["Variables"]
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}]
				requestBody: {
					description: "Variable to create"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/Variable"
				}
				responses: {
					"201": {
						description: "Variable created"
						content: "application/json": schema: $ref: "#/components/schemas/Variable"
					}
					default: {
						description: "Internal server error"
						$ref:        "#/components/responses/ServerError"
					}
				}
			}
		}
		"/variables/{variableID}": {
			get: {
				operationId: "GetVariablesID"
				tags: ["Variables"]
				summary: "Retrieve a variable"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:       "path"
					name:     "variableID"
					required: true
					schema: type: "string"
					description: "The variable ID."
				}]
				responses: {
					"200": {
						description: "Variable found"
						content: "application/json": schema: $ref: "#/components/schemas/Variable"
					}
					"404": {
						description: "Variable not found"
						$ref:        "#/components/responses/ServerError"
					}
					default: {
						description: "Internal server error"
						$ref:        "#/components/responses/ServerError"
					}
				}
			}
			delete: {
				operationId: "DeleteVariablesID"
				tags: ["Variables"]
				summary: "Delete a variable"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:       "path"
					name:     "variableID"
					required: true
					schema: type: "string"
					description: "The variable ID."
				}]
				responses: {
					"204": description: "Variable deleted"
					default: {
						description: "Internal server error"
						$ref:        "#/components/responses/ServerError"
					}
				}
			}
			patch: {
				operationId: "PatchVariablesID"
				summary:     "Update a variable"
				tags: ["Variables"]
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:       "path"
					name:     "variableID"
					required: true
					schema: type: "string"
					description: "The variable ID."
				}]
				requestBody: {
					description: "Variable update to apply"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/Variable"
				}
				responses: {
					"200": {
						description: "Variable updated"
						content: "application/json": schema: $ref: "#/components/schemas/Variable"
					}
					default: {
						description: "Internal server error"
						$ref:        "#/components/responses/ServerError"
					}
				}
			}
			put: {
				operationId: "PutVariablesID"
				summary:     "Replace a variable"
				tags: ["Variables"]
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:       "path"
					name:     "variableID"
					required: true
					schema: type: "string"
					description: "The variable ID."
				}]
				requestBody: {
					description: "Variable to replace"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/Variable"
				}
				responses: {
					"200": {
						description: "Variable updated"
						content: "application/json": schema: $ref: "#/components/schemas/Variable"
					}
					default: {
						description: "Internal server error"
						$ref:        "#/components/responses/ServerError"
					}
				}
			}
		}
		"/sources": {
			post: {
				operationId: "PostSources"
				tags: ["Sources"]
				summary: "Create a source"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}]
				requestBody: {
					description: "Source to create"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/Source"
				}
				responses: {
					"201": {
						description: "Created Source"
						content: "application/json": schema: $ref: "#/components/schemas/Source"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			get: {
				operationId: "GetSources"
				tags: ["Sources"]
				summary: "List all sources"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:          "query"
					name:        "org"
					description: "The name of the organization."
					schema: type: "string"
				}]
				responses: {
					"200": {
						description: "A list of sources"
						content: "application/json": schema: $ref: "#/components/schemas/Sources"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
		}
		"/sources/{sourceID}": {
			delete: {
				operationId: "DeleteSourcesID"
				tags: ["Sources"]
				summary: "Delete a source"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "sourceID"
					schema: type: "string"
					required:    true
					description: "The source ID."
				}]
				responses: {
					"204": description: "Delete has been accepted"
					"404": {
						description: "View not found"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			patch: {
				operationId: "PatchSourcesID"
				tags: ["Sources"]
				summary: "Update a Source"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "sourceID"
					schema: type: "string"
					required:    true
					description: "The source ID."
				}]
				requestBody: {
					description: "Source update"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/Source"
				}
				responses: {
					"200": {
						description: "Created Source"
						content: "application/json": schema: $ref: "#/components/schemas/Source"
					}
					"404": {
						description: "Source not found"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			get: {
				operationId: "GetSourcesID"
				tags: ["Sources"]
				summary: "Retrieve a source"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "sourceID"
					schema: type: "string"
					required:    true
					description: "The source ID."
				}]
				responses: {
					"200": {
						description: "A source"
						content: "application/json": schema: $ref: "#/components/schemas/Source"
					}
					"404": {
						description: "Source not found"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
		}
		"/sources/{sourceID}/health": get: {
			operationId: "GetSourcesIDHealth"
			tags: ["Sources"]
			summary: "Get the health of a source"
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}, {
				in:   "path"
				name: "sourceID"
				schema: type: "string"
				required:    true
				description: "The source ID."
			}]
			responses: {
				"200": {
					description: "The source is healthy"
					content: "application/json": schema: $ref: "#/components/schemas/HealthCheck"
				}
				"503": {
					description: "The source is not healthy"
					content: "application/json": schema: $ref: "#/components/schemas/HealthCheck"
				}
				default: {
					description: "Unexpected error"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
			}
		}
		"/sources/{sourceID}/buckets": get: {
			operationId: "GetSourcesIDBuckets"
			tags: ["Sources", "Buckets"]
			summary: "Get buckets in a source"
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}, {
				in:   "path"
				name: "sourceID"
				schema: type: "string"
				required:    true
				description: "The source ID."
			}, {
				in:          "query"
				name:        "org"
				description: "The name of the organization."
				schema: type: "string"
			}]
			responses: {
				"200": {
					description: "A source"
					content: "application/json": schema: $ref: "#/components/schemas/Buckets"
				}
				"404": {
					description: "Source not found"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
				default: {
					description: "Unexpected error"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
			}
		}
		"/scrapers": {
			get: {
				operationId: "GetScrapers"
				tags: ["Scraper Targets"]
				summary: "List all scraper targets"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:          "query"
					name:        "name"
					description: "Specifies the name of the scraper target."
					schema: type: "string"
				}, {
					in:          "query"
					name:        "id"
					description: "List of scraper target IDs to return. If both `id` and `owner` are specified, only `id` is used."
					schema: {
						type: "array"
						items: type: "string"
					}
				}, {
					in:          "query"
					name:        "orgID"
					description: "Specifies the organization ID of the scraper target."
					schema: type: "string"
				}, {
					in:          "query"
					name:        "org"
					description: "Specifies the organization name of the scraper target."
					schema: type: "string"
				}]
				responses: "200": {
					description: "All scraper targets"
					content: "application/json": schema: $ref: "#/components/schemas/ScraperTargetResponses"
				}
			}
			post: {
				operationId: "PostScrapers"
				summary:     "Create a scraper target"
				tags: ["Scraper Targets"]
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}]
				requestBody: {
					description: "Scraper target to create"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/ScraperTargetRequest"
				}
				responses: {
					"201": {
						description: "Scraper target created"
						content: "application/json": schema: $ref: "#/components/schemas/ScraperTargetResponse"
					}
					default: {
						description: "Internal server error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
		}
		"/scrapers/{scraperTargetID}": {
			get: {
				operationId: "GetScrapersID"
				tags: ["Scraper Targets"]
				summary: "Retrieve a scraper target"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:       "path"
					name:     "scraperTargetID"
					required: true
					schema: type: "string"
					description: "The identifier of the scraper target."
				}]
				responses: {
					"200": {
						description: "The scraper target"
						content: "application/json": schema: $ref: "#/components/schemas/ScraperTargetResponse"
					}
					default: {
						description: "Internal server error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			delete: {
				operationId: "DeleteScrapersID"
				tags: ["Scraper Targets"]
				summary: "Delete a scraper target"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:       "path"
					name:     "scraperTargetID"
					required: true
					schema: type: "string"
					description: "The identifier of the scraper target."
				}]
				responses: {
					"204": description: "Scraper target deleted"
					default: {
						description: "Internal server error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			patch: {
				operationId: "PatchScrapersID"
				summary:     "Update a scraper target"
				tags: ["Scraper Targets"]
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:       "path"
					name:     "scraperTargetID"
					required: true
					schema: type: "string"
					description: "The identifier of the scraper target."
				}]
				requestBody: {
					description: "Scraper target update to apply"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/ScraperTargetRequest"
				}
				responses: {
					"200": {
						description: "Scraper target updated"
						content: "application/json": schema: $ref: "#/components/schemas/ScraperTargetResponse"
					}
					default: {
						description: "Internal server error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
		}
		"/scrapers/{scraperTargetID}/labels": {
			get: {
				operationId: "GetScrapersIDLabels"
				tags: ["Scraper Targets"]
				summary: "List all labels for a scraper target"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "scraperTargetID"
					schema: type: "string"
					required:    true
					description: "The scraper target ID."
				}]
				responses: {
					"200": {
						description: "A list of labels for a scraper target."
						content: "application/json": schema: $ref: "#/components/schemas/LabelsResponse"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			post: {
				operationId: "PostScrapersIDLabels"
				tags: ["Scraper Targets"]
				summary: "Add a label to a scraper target"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "scraperTargetID"
					schema: type: "string"
					required:    true
					description: "The scraper target ID."
				}]
				requestBody: {
					description: "Label to add"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/LabelMapping"
				}
				responses: {
					"201": {
						description: "The newly added label"
						content: "application/json": schema: $ref: "#/components/schemas/LabelResponse"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
		}
		"/scrapers/{scraperTargetID}/labels/{labelID}": delete: {
			operationId: "DeleteScrapersIDLabelsID"
			tags: ["Scraper Targets"]
			summary: "Delete a label from a scraper target"
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}, {
				in:   "path"
				name: "scraperTargetID"
				schema: type: "string"
				required:    true
				description: "The scraper target ID."
			}, {
				in:   "path"
				name: "labelID"
				schema: type: "string"
				required:    true
				description: "The label ID."
			}]
			responses: {
				"204": description: "Delete has been accepted"
				"404": {
					description: "Scraper target not found"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
				default: {
					description: "Unexpected error"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
			}
		}
		"/scrapers/{scraperTargetID}/members": {
			get: {
				operationId: "GetScrapersIDMembers"
				tags: ["Scraper Targets"]
				summary: "List all users with member privileges for a scraper target"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "scraperTargetID"
					schema: type: "string"
					required:    true
					description: "The scraper target ID."
				}]
				responses: {
					"200": {
						description: "A list of scraper target members"
						content: "application/json": schema: $ref: "#/components/schemas/ResourceMembers"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			post: {
				operationId: "PostScrapersIDMembers"
				tags: ["Scraper Targets"]
				summary: "Add a member to a scraper target"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "scraperTargetID"
					schema: type: "string"
					required:    true
					description: "The scraper target ID."
				}]
				requestBody: {
					description: "User to add as member"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/AddResourceMemberRequestBody"
				}
				responses: {
					"201": {
						description: "Member added to scraper targets"
						content: "application/json": schema: $ref: "#/components/schemas/ResourceMember"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
		}
		"/scrapers/{scraperTargetID}/members/{userID}": delete: {
			operationId: "DeleteScrapersIDMembersID"
			tags: ["Scraper Targets"]
			summary: "Remove a member from a scraper target"
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}, {
				in:   "path"
				name: "userID"
				schema: type: "string"
				required:    true
				description: "The ID of member to remove."
			}, {
				in:   "path"
				name: "scraperTargetID"
				schema: type: "string"
				required:    true
				description: "The scraper target ID."
			}]
			responses: {
				"204": description: "Member removed"
				default: {
					description: "Unexpected error"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
			}
		}
		"/scrapers/{scraperTargetID}/owners": {
			get: {
				operationId: "GetScrapersIDOwners"
				tags: ["Scraper Targets"]
				summary: "List all owners of a scraper target"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "scraperTargetID"
					schema: type: "string"
					required:    true
					description: "The scraper target ID."
				}]
				responses: {
					"200": {
						description: "A list of scraper target owners"
						content: "application/json": schema: $ref: "#/components/schemas/ResourceOwners"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			post: {
				operationId: "PostScrapersIDOwners"
				tags: ["Scraper Targets"]
				summary: "Add an owner to a scraper target"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "scraperTargetID"
					schema: type: "string"
					required:    true
					description: "The scraper target ID."
				}]
				requestBody: {
					description: "User to add as owner"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/AddResourceMemberRequestBody"
				}
				responses: {
					"201": {
						description: "Scraper target owner added"
						content: "application/json": schema: $ref: "#/components/schemas/ResourceOwner"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
		}
		"/scrapers/{scraperTargetID}/owners/{userID}": delete: {
			operationId: "DeleteScrapersIDOwnersID"
			tags: ["Scraper Targets"]
			summary: "Remove an owner from a scraper target"
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}, {
				in:   "path"
				name: "userID"
				schema: type: "string"
				required:    true
				description: "The ID of owner to remove."
			}, {
				in:   "path"
				name: "scraperTargetID"
				schema: type: "string"
				required:    true
				description: "The scraper target ID."
			}]
			responses: {
				"204": description: "Owner removed"
				default: {
					description: "Unexpected error"
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
			}
		}
		"/backup/kv": get: {
			operationId: "GetBackupKV"
			tags: ["Backup"]
			summary:    "Download snapshot of metadata stored in the server's embedded KV store. Should not be used in versions greater than 2.1.x, as it doesn't include metadata stored in embedded SQL."
			deprecated: true
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}]
			responses: {
				"200": {
					description: "Snapshot of KV metadata"
					content: "application/octet-stream": schema: {
						type:   "string"
						format: "binary"
					}
				}
				default: {
					description: "Unexpected error"
					$ref:        "#/components/responses/ServerError"
				}
			}
		}
		"/backup/metadata": get: {
			operationId: "GetBackupMetadata"
			tags: ["Backup"]
			summary: "Download snapshot of all metadata in the server"
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}, {
				in:          "header"
				name:        "Accept-Encoding"
				description: "Indicates the content encoding (usually a compression algorithm) that the client can understand."
				schema: {
					type:        "string"
					description: "The content coding.  Use `gzip` for compressed data or `identity` for unmodified, uncompressed data."
					default:     "identity"
					enum: ["gzip", "identity"]
				}
			}]
			responses: {
				"200": {
					description: "Snapshot of metadata"
					headers: "Content-Encoding": {
						description: "Lists any encodings (usually compression algorithms) that have been applied to the response payload."
						schema: {
							type: "string"
							description: """
										The content coding: `gzip` for compressed data or `identity` for unmodified, uncompressed data.

										"""
							default: "identity"
							enum: ["gzip", "identity"]
						}
					}
					content: "multipart/mixed": schema: $ref: "#/components/schemas/MetadataBackup"
				}
				default: {
					description: "Unexpected error"
					$ref:        "#/components/responses/ServerError"
				}
			}
		}
		"/backup/shards/{shardID}": get: {
			operationId: "GetBackupShardId"
			tags: ["Backup"]
			summary: "Download snapshot of all TSM data in a shard"
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}, {
				in:          "header"
				name:        "Accept-Encoding"
				description: "Indicates the content encoding (usually a compression algorithm) that the client can understand."
				schema: {
					type:        "string"
					description: "The content coding.  Use `gzip` for compressed data or `identity` for unmodified, uncompressed data."
					default:     "identity"
					enum: ["gzip", "identity"]
				}
			}, {
				in:   "path"
				name: "shardID"
				schema: {
					type:   "integer"
					format: "int64"
				}
				required:    true
				description: "The shard ID."
			}, {
				in:          "query"
				name:        "since"
				description: "Earliest time to include in the snapshot. RFC3339 format."
				schema: {
					type:   "string"
					format: "date-time"
				}
			}]
			responses: {
				"200": {
					description: "TSM snapshot."
					headers: "Content-Encoding": {
						description: "Lists any encodings (usually compression algorithms) that have been applied to the response payload."
						schema: {
							type: "string"
							description: """
										The content coding: `gzip` for compressed data or `identity` for unmodified, uncompressed data.

										"""
							default: "identity"
							enum: ["gzip", "identity"]
						}
					}
					content: "application/octet-stream": schema: {
						type:   "string"
						format: "binary"
					}
				}
				"404": {
					description: "Shard not found."
					content: "application/json": schema: $ref: "#/components/schemas/Error"
				}
				default: {
					description: "Unexpected error"
					$ref:        "#/components/responses/ServerError"
				}
			}
		}
		"/restore/kv": post: {
			operationId: "PostRestoreKV"
			tags: ["Restore"]
			summary: "Overwrite the embedded KV store on the server with a backed-up snapshot."
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}, {
				in:   "header"
				name: "Content-Encoding"
				description: """
					The value tells InfluxDB what compression is applied to the line protocol in the request payload.
					To make an API request with a GZIP payload, send `Content-Encoding: gzip` as a request header.

					"""
				schema: {
					type:        "string"
					description: "The content coding.  Use `gzip` for compressed data or `identity` for unmodified, uncompressed data."
					default:     "identity"
					enum: ["gzip", "identity"]
				}
			}, {
				in:   "header"
				name: "Content-Type"
				schema: {
					type:    "string"
					default: "application/octet-stream"
					enum: ["application/octet-stream"]
				}
			}]
			requestBody: {
				description: "Full KV snapshot."
				required:    true
				content: "text/plain": schema: {
					type:   "string"
					format: "binary"
				}
			}
			responses: {
				"200": {
					description: "KV store successfully overwritten."
					content: "application/json": schema: {
						type: "object"
						properties: token: {
							description: "token is the root token for the instance after restore (this is overwritten during the restore)"
							type:        "string"
						}
					}
				}
				"204": description: "KV store successfully overwritten."
				default: {
					description: "Unexpected error"
					$ref:        "#/components/responses/ServerError"
				}
			}
		}
		"/restore/sql": post: {
			operationId: "PostRestoreSQL"
			tags: ["Restore"]
			summary: "Overwrite the embedded SQL store on the server with a backed-up snapshot."
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}, {
				in:   "header"
				name: "Content-Encoding"
				description: """
					The value tells InfluxDB what compression is applied to the line protocol in the request payload.
					To make an API request with a GZIP payload, send `Content-Encoding: gzip` as a request header.

					"""
				schema: {
					type:        "string"
					description: "Specifies that the line protocol in the body is encoded with gzip or not encoded with identity."
					default:     "identity"
					enum: ["gzip", "identity"]
				}
			}, {
				in:   "header"
				name: "Content-Type"
				schema: {
					type:    "string"
					default: "application/octet-stream"
					enum: ["application/octet-stream"]
				}
			}]
			requestBody: {
				description: "Full SQL snapshot."
				required:    true
				content: "text/plain": schema: {
					type:   "string"
					format: "binary"
				}
			}
			responses: {
				"204": description: "SQL store successfully overwritten."
				default: {
					description: "Unexpected error"
					$ref:        "#/components/responses/ServerError"
				}
			}
		}
		"/restore/bucket/{bucketID}": post: {
			operationId: "PostRestoreBucketID"
			tags: ["Restore"]
			summary:    "Overwrite storage metadata for a bucket with shard info from a backup."
			deprecated: true
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}, {
				in:   "path"
				name: "bucketID"
				schema: type: "string"
				required:    true
				description: "The bucket ID."
			}, {
				in:   "header"
				name: "Content-Type"
				schema: {
					type:    "string"
					default: "application/octet-stream"
					enum: ["application/octet-stream"]
				}
			}]
			requestBody: {
				description: "Database info serialized as protobuf."
				required:    true
				content: "text/plain": schema: {
					type:   "string"
					format: "byte"
				}
			}
			responses: {
				"200": {
					description: "ID mappings for shards in bucket."
					content: "application/json": schema: {
						type:   "string"
						format: "byte"
					}
				}
				default: {
					description: "Unexpected error"
					$ref:        "#/components/responses/ServerError"
				}
			}
		}
		"/restore/bucketMetadata": post: {
			operationId: "PostRestoreBucketMetadata"
			tags: ["Restore"]
			summary: "Create a new bucket pre-seeded with shard info from a backup."
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}]
			requestBody: {
				description: "Metadata manifest for a bucket."
				required:    true
				content: "application/json": schema: $ref: "#/components/schemas/BucketMetadataManifest"
			}
			responses: {
				"201": {
					description: "ID mappings for shards in new bucket."
					content: "application/json": schema: $ref: "#/components/schemas/RestoredBucketMappings"
				}
				default: {
					description: "Unexpected error"
					$ref:        "#/components/responses/ServerError"
				}
			}
		}
		"/restore/shards/{shardID}": post: {
			operationId: "PostRestoreShardId"
			tags: ["Restore"]
			summary: "Restore a TSM snapshot into a shard."
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}, {
				in:   "header"
				name: "Content-Encoding"
				description: """
					The value tells InfluxDB what compression is applied to the line protocol in the request payload.
					To make an API request with a GZIP payload, send `Content-Encoding: gzip` as a request header.

					"""
				schema: {
					type:        "string"
					description: "Specifies that the line protocol in the body is encoded with gzip or not encoded with identity."
					default:     "identity"
					enum: ["gzip", "identity"]
				}
			}, {
				in:   "header"
				name: "Content-Type"
				schema: {
					type:    "string"
					default: "application/octet-stream"
					enum: ["application/octet-stream"]
				}
			}, {
				in:   "path"
				name: "shardID"
				schema: type: "string"
				required:    true
				description: "The shard ID."
			}]
			requestBody: {
				description: "TSM snapshot."
				required:    true
				content: "text/plain": schema: {
					type:   "string"
					format: "binary"
				}
			}
			responses: {
				"204": description: "TSM snapshot successfully restored."
				default: {
					description: "Unexpected error"
					$ref:        "#/components/responses/ServerError"
				}
			}
		}
		"/dashboards": {
			post: {
				operationId: "PostDashboards"
				tags: ["Dashboards"]
				summary: "Create a dashboard"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}]
				requestBody: {
					description: "Dashboard to create"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/CreateDashboardRequest"
				}
				responses: {
					"201": {
						description: "Added dashboard"
						content: "application/json": schema: oneOf: [{
							$ref: "#/components/schemas/Dashboard"
						}, {
							$ref: "#/components/schemas/DashboardWithViewProperties"
						}]
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			get: {
				operationId: "GetDashboards"
				tags: ["Dashboards"]
				summary: "List all dashboards"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					$ref: "#/components/parameters/Offset"
				}, {
					$ref: "#/components/parameters/Limit"
				}, {
					$ref: "#/components/parameters/Descending"
				}, {
					in:          "query"
					name:        "owner"
					description: "A user identifier. Returns only dashboards where this user has the `owner` role."
					schema: type: "string"
				}, {
					in:          "query"
					name:        "sortBy"
					description: "The column to sort by."
					schema: {
						type: "string"
						enum: ["ID", "CreatedAt", "UpdatedAt"]
					}
				}, {
					in:          "query"
					name:        "id"
					description: "A list of dashboard identifiers. Returns only the listed dashboards. If both `id` and `owner` are specified, only `id` is used."
					schema: {
						type: "array"
						items: type: "string"
					}
				}, {
					in:          "query"
					name:        "orgID"
					description: "The identifier of the organization."
					schema: type: "string"
				}, {
					in:          "query"
					name:        "org"
					description: "The name of the organization."
					schema: type: "string"
				}]
				responses: {
					"200": {
						description: "All dashboards"
						content: "application/json": schema: $ref: "#/components/schemas/Dashboards"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
		}
		"/tasks": {
			get: {
				operationId: "GetTasks"
				tags: ["Tasks"]
				summary: "List all tasks"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:          "query"
					name:        "name"
					description: "Returns task with a specific name."
					schema: type: "string"
				}, {
					in:   "query"
					name: "after"
					schema: type: "string"
					description: "Return tasks after a specified ID."
				}, {
					in:   "query"
					name: "user"
					schema: type: "string"
					description: "Filter tasks to a specific user ID."
				}, {
					in:   "query"
					name: "org"
					schema: type: "string"
					description: "Filter tasks to a specific organization name."
				}, {
					in:   "query"
					name: "orgID"
					schema: type: "string"
					description: "Filter tasks to a specific organization ID."
				}, {
					in:   "query"
					name: "status"
					schema: {
						type: "string"
						enum: ["active", "inactive"]
					}
					description: "Filter tasks by a status--\"inactive\" or \"active\"."
				}, {
					in:   "query"
					name: "limit"
					schema: {
						type:    "integer"
						minimum: 1
						maximum: 500
						default: 100
					}
					description: "The number of tasks to return"
				}, {
					in:          "query"
					name:        "type"
					description: "Type of task, unset by default."
					required:    false
					schema: {
						default: ""
						type:    "string"
						enum: ["basic", "system"]
					}
				}]
				responses: {
					"200": {
						description: "A list of tasks"
						content: "application/json": schema: $ref: "#/components/schemas/Tasks"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
			post: {
				operationId: "PostTasks"
				tags: ["Tasks"]
				summary: "Create a new task"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}]
				requestBody: {
					description: "Task to create"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/TaskCreateRequest"
				}
				responses: {
					"201": {
						description: "Task created"
						content: "application/json": schema: $ref: "#/components/schemas/Task"
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/schemas/Error"
					}
				}
			}
		}
		"/write": post: {
			operationId: "PostWrite"
			tags: ["Write"]
			summary: "Write data"
			description: """
				Writes data to a bucket.

				To write data into InfluxDB, you need the following:
				- **organization** – _See [View organizations](https://docs.influxdata.com/influxdb/v2.1/organizations/view-orgs/#view-your-organization-id) for instructions on viewing your organization ID._
				- **bucket** – _See [View buckets](https://docs.influxdata.com/influxdb/v2.1/organizations/buckets/view-buckets/) for
				 instructions on viewing your bucket ID._
				- **API token** – _See [View tokens](https://docs.influxdata.com/influxdb/v2.1/security/tokens/view-tokens/)
				 for instructions on viewing your API token._
				- **InfluxDB URL** – _See [InfluxDB URLs](https://docs.influxdata.com/influxdb/v2.1/reference/urls/)_.
				- data in [line protocol](https://docs.influxdata.com/influxdb/v2.1/reference/syntax/line-protocol) format.

				For more information and examples, see the following:
				- [Write data with the InfluxDB API](https://docs.influxdata.com/influxdb/v2.1/write-data/developer-tools/api).
				- [Optimize writes to InfluxDB](https://docs.influxdata.com/influxdb/v2.1/write-data/best-practices/optimize-writes/).

				"""
			requestBody: {
				description: "Data in line protocol format."
				required:    true
				content: "text/plain": schema: {
					type:   "string"
					format: "byte"
				}
			}
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}, {
				in:   "header"
				name: "Content-Encoding"
				description: """
					The value tells InfluxDB what compression is applied to the line protocol in the request payload.
					To make an API request with a GZIP payload, send `Content-Encoding: gzip` as a request header.

					"""
				schema: {
					type:        "string"
					description: "The header value specifies that the line protocol in the request body is encoded with gzip or not encoded with identity."
					default:     "identity"
					enum: ["gzip", "identity"]
				}
			}, {
				in:          "header"
				name:        "Content-Type"
				description: "The header value indicates the format of the data in the request body."
				schema: {
					type: "string"
					description: """
						`text/plain` specifies line protocol. `UTF-8` is the default character set.

						"""
					default: "text/plain; charset=utf-8"
					enum: ["text/plain", "text/plain; charset=utf-8", "application/vnd.influx.arrow"]
				}
			}, {
				in:          "header"
				name:        "Content-Length"
				description: "The header value indicates the size of the entity-body, in bytes, sent to the database. If the length is greater than the database's `max body` configuration option, the server responds with status code `413`."
				schema: {
					type:        "integer"
					description: "The length in decimal number of octets."
				}
			}, {
				in:          "header"
				name:        "Accept"
				description: "The header value specifies the response format."
				schema: {
					type:        "string"
					description: "The response format for errors."
					default:     "application/json"
					enum: ["application/json"]
				}
			}, {
				in:          "query"
				name:        "org"
				description: "The parameter value specifies the destination organization for writes. The database writes all points in the batch to this organization. If you provide both `orgID` and `org` parameters, `org` takes precedence."
				required:    true
				schema: {
					type:        "string"
					description: "Organization name or ID."
				}
			}, {
				in:          "query"
				name:        "orgID"
				description: "The parameter value specifies the ID of the destination organization for writes. If both `orgID` and `org` are specified, `org` takes precedence."
				schema: type: "string"
			}, {
				in:          "query"
				name:        "bucket"
				description: "The destination bucket for writes."
				required:    true
				schema: {
					type:        "string"
					description: "All points within batch are written to this bucket."
				}
			}, {
				in:          "query"
				name:        "precision"
				description: "The precision for the unix timestamps within the body line-protocol."
				schema: $ref: "#/components/schemas/WritePrecision"
			}]
			responses: {
				"204": description: "InfluxDB validated the request data format and accepted the data for writing to the bucket. `204` doesn't indicate a successful write operation since writes are asynchronous. See [how to check for write errors](https://docs.influxdata.com/influxdb/v2.1/write-data/troubleshoot)."
				"400": {
					description: "Bad request. The line protocol data in the request is malformed. The response body contains the first malformed line in the data. InfluxDB rejected the batch and did not write any data."
					content: "application/json": {
						schema: $ref: "#/components/schemas/LineProtocolError"
						examples: measurementSchemaFieldTypeConflict: {
							summary: "Example of a field type conflict thrown by an explicit bucket schema"
							value: {
								code:    "invalid"
								message: "partial write error (2 written): unable to parse 'air_sensor,service=S1,sensor=L1 temperature=\"90.5\",humidity=70.0 1632850122': schema: field type for field \"temperature\" not permitted by schema; got String but expected Float"
							}
						}
					}
				}
				"401": {
					description: """
						Unauthorized. The error may indicate one of the following:
						  * The `Authorization: Token` header is missing or malformed.
						  * The API token value is missing from the header.
						  * The token does not have sufficient permissions to write to this organization and bucket.

						"""
					content: "application/json": {
						schema: $ref: "#/components/schemas/Error"
						examples: tokenNotAuthorized: {
							summary: "Token is not authorized to access the organization or resource"
							value: {
								code:    "unauthorized"
								message: "unauthorized access"
							}
						}
					}
				}
				"404": {
					description: "Not found. A requested resource was not found. The response body contains the requested resource type, e.g. `organization name` or `bucket`, and name."
					content: "application/json": {
						schema: $ref: "#/components/schemas/Error"
						examples: "resource-not-found": {
							summary: "Not found error"
							value: {
								code:    "not found"
								message: "bucket \"air_sensor\" not found"
							}
						}
					}
				}
				"413": {
					description: """
						All request data was rejected and not written. InfluxDB OSS only returns this error if the [Go (golang) `ioutil.ReadAll()`](https://pkg.go.dev/io/ioutil#ReadAll) function raises an error.

						"""
					content: "application/json": schema: $ref: "#/components/schemas/LineProtocolLengthError"
				}
				"500": {
					description: "Internal server error."
					content: "application/json": {
						schema: $ref: "#/components/schemas/Error"
						examples: internalError: {
							summary: "Internal error example"
							value: code: "internal error"
						}
					}
				}
				"503": {
					description: "The server is temporarily unavailable to accept writes.  The `Retry-After` header describes when to try the write again."
					headers: "Retry-After": {
						description: "A non-negative decimal integer indicating the seconds to delay after the response is received."
						schema: {
							type:   "integer"
							format: "int32"
						}
					}
				}
				default: $ref: "#/components/responses/ServerError"
			}
		}
	}
	components: {
		parameters: {
			TraceSpan: {
				in:          "header"
				name:        "Zap-Trace-Span"
				description: "OpenTracing span context"
				example: {
					trace_id: "1"
					span_id:  "1"
					baggage: key: "value"
				}
				required: false
				schema: type: "string"
			}
			Offset: {
				in:       "query"
				name:     "offset"
				required: false
				schema: {
					type:    "integer"
					minimum: 0
				}
			}
			Limit: {
				in:       "query"
				name:     "limit"
				required: false
				schema: {
					type:    "integer"
					minimum: 1
					maximum: 100
					default: 20
				}
			}
			Descending: {
				in:       "query"
				name:     "descending"
				required: false
				schema: {
					type:    "boolean"
					default: false
				}
			}
			SortBy: {
				in:       "query"
				name:     "sortBy"
				required: false
				schema: type: "string"
			}
			After: {
				in:       "query"
				name:     "after"
				required: false
				schema: type: "string"
				description: """
					The last resource ID from which to seek from (but not including). This is to be used instead of `offset`.

					"""
			}
		}
		schemas: {
			LanguageRequest: {
				description: "Flux query to be analyzed."
				type:        "object"
				required: ["query"]
				properties: query: {
					description: "Flux query script to be analyzed"
					type:        "string"
				}
			}
			Query: {
				description: "Query influx using the Flux language"
				type:        "object"
				required: ["query"]
				properties: {
					extern: $ref: "#/components/schemas/File"
					query: {
						description: "Query script to execute."
						type:        "string"
					}
					type: {
						description: "The type of query. Must be \"flux\"."
						type:        "string"
						enum: ["flux"]
					}
					params: {
						type:                 "object"
						additionalProperties: true
						description: """
							Enumeration of key/value pairs that respresent parameters to be injected into query (can only specify either this field or extern and not both)

							"""
					}
					dialect: $ref: "#/components/schemas/Dialect"
					now: {
						description: "Specifies the time that should be reported as \"now\" in the query. Default is the server's now time."
						type:        "string"
						format:      "date-time"
					}
				}
			}
			Package: {
				description: "Represents a complete package source tree."
				type:        "object"
				properties: {
					type: $ref: "#/components/schemas/NodeType"
					path: {
						description: "Package import path"
						type:        "string"
					}
					package: {
						description: "Package name"
						type:        "string"
					}
					files: {
						description: "Package files"
						type:        "array"
						items: $ref: "#/components/schemas/File"
					}
				}
			}
			File: {
				description: "Represents a source from a single file"
				type:        "object"
				properties: {
					type: $ref: "#/components/schemas/NodeType"
					name: {
						description: "The name of the file."
						type:        "string"
					}
					package: $ref: "#/components/schemas/PackageClause"
					imports: {
						description: "A list of package imports"
						type:        "array"
						items: $ref: "#/components/schemas/ImportDeclaration"
					}
					body: {
						description: "List of Flux statements"
						type:        "array"
						items: $ref: "#/components/schemas/Statement"
					}
				}
			}
			PackageClause: {
				description: "Defines a package identifier"
				type:        "object"
				properties: {
					type: $ref: "#/components/schemas/NodeType"
					name: $ref: "#/components/schemas/Identifier"
				}
			}
			ImportDeclaration: {
				description: "Declares a package import"
				type:        "object"
				properties: {
					type: $ref: "#/components/schemas/NodeType"
					as: $ref:   "#/components/schemas/Identifier"
					path: $ref: "#/components/schemas/StringLiteral"
				}
			}
			DeletePredicateRequest: {
				description: "The delete predicate request."
				type:        "object"
				required: ["start", "stop"]
				properties: {
					start: {
						description: "RFC3339Nano"
						type:        "string"
						format:      "date-time"
					}
					stop: {
						description: "RFC3339Nano"
						type:        "string"
						format:      "date-time"
					}
					predicate: {
						description: "InfluxQL-like delete statement"
						example:     "tag1=\"value1\" and (tag2=\"value2\" and tag3!=\"value3\")"
						type:        "string"
					}
				}
			}
			Node: oneOf: [{
				$ref: "#/components/schemas/Expression"
			}, {
				$ref: "#/components/schemas/Block"
			}]
			NodeType: {
				description: "Type of AST node"
				type:        "string"
			}
			Block: {
				description: "A set of statements"
				type:        "object"
				properties: {
					type: $ref: "#/components/schemas/NodeType"
					body: {
						description: "Block body"
						type:        "array"
						items: $ref: "#/components/schemas/Statement"
					}
				}
			}
			Statement: oneOf: [{
				$ref: "#/components/schemas/BadStatement"
			}, {
				$ref: "#/components/schemas/VariableAssignment"
			}, {
				$ref: "#/components/schemas/MemberAssignment"
			}, {
				$ref: "#/components/schemas/ExpressionStatement"
			}, {
				$ref: "#/components/schemas/ReturnStatement"
			}, {
				$ref: "#/components/schemas/OptionStatement"
			}, {
				$ref: "#/components/schemas/BuiltinStatement"
			}, {
				$ref: "#/components/schemas/TestStatement"
			}]
			BadStatement: {
				description: "A placeholder for statements for which no correct statement nodes can be created"
				type:        "object"
				properties: {
					type: $ref: "#/components/schemas/NodeType"
					text: {
						description: "Raw source text"
						type:        "string"
					}
				}
			}
			VariableAssignment: {
				description: "Represents the declaration of a variable"
				type:        "object"
				properties: {
					type: $ref: "#/components/schemas/NodeType"
					id: $ref:   "#/components/schemas/Identifier"
					init: $ref: "#/components/schemas/Expression"
				}
			}
			MemberAssignment: {
				description: "Object property assignment"
				type:        "object"
				properties: {
					type: $ref:   "#/components/schemas/NodeType"
					member: $ref: "#/components/schemas/MemberExpression"
					init: $ref:   "#/components/schemas/Expression"
				}
			}
			ExpressionStatement: {
				description: "May consist of an expression that does not return a value and is executed solely for its side-effects"
				type:        "object"
				properties: {
					type: $ref:       "#/components/schemas/NodeType"
					expression: $ref: "#/components/schemas/Expression"
				}
			}
			ReturnStatement: {
				description: "Defines an expression to return"
				type:        "object"
				properties: {
					type: $ref:     "#/components/schemas/NodeType"
					argument: $ref: "#/components/schemas/Expression"
				}
			}
			OptionStatement: {
				description: "A single variable declaration"
				type:        "object"
				properties: {
					type: $ref: "#/components/schemas/NodeType"
					assignment: oneOf: [{
						$ref: "#/components/schemas/VariableAssignment"
					}, {
						$ref: "#/components/schemas/MemberAssignment"
					}]
				}
			}
			BuiltinStatement: {
				description: "Declares a builtin identifier and its type"
				type:        "object"
				properties: {
					type: $ref: "#/components/schemas/NodeType"
					id: $ref:   "#/components/schemas/Identifier"
				}
			}
			TestStatement: {
				description: "Declares a Flux test case"
				type:        "object"
				properties: {
					type: $ref:       "#/components/schemas/NodeType"
					assignment: $ref: "#/components/schemas/VariableAssignment"
				}
			}
			Expression: oneOf: [{
				$ref: "#/components/schemas/ArrayExpression"
			}, {
				$ref: "#/components/schemas/DictExpression"
			}, {
				$ref: "#/components/schemas/FunctionExpression"
			}, {
				$ref: "#/components/schemas/BinaryExpression"
			}, {
				$ref: "#/components/schemas/CallExpression"
			}, {
				$ref: "#/components/schemas/ConditionalExpression"
			}, {
				$ref: "#/components/schemas/LogicalExpression"
			}, {
				$ref: "#/components/schemas/MemberExpression"
			}, {
				$ref: "#/components/schemas/IndexExpression"
			}, {
				$ref: "#/components/schemas/ObjectExpression"
			}, {
				$ref: "#/components/schemas/ParenExpression"
			}, {
				$ref: "#/components/schemas/PipeExpression"
			}, {
				$ref: "#/components/schemas/UnaryExpression"
			}, {
				$ref: "#/components/schemas/BooleanLiteral"
			}, {
				$ref: "#/components/schemas/DateTimeLiteral"
			}, {
				$ref: "#/components/schemas/DurationLiteral"
			}, {
				$ref: "#/components/schemas/FloatLiteral"
			}, {
				$ref: "#/components/schemas/IntegerLiteral"
			}, {
				$ref: "#/components/schemas/PipeLiteral"
			}, {
				$ref: "#/components/schemas/RegexpLiteral"
			}, {
				$ref: "#/components/schemas/StringLiteral"
			}, {
				$ref: "#/components/schemas/UnsignedIntegerLiteral"
			}, {
				$ref: "#/components/schemas/Identifier"
			}]
			ArrayExpression: {
				description: "Used to create and directly specify the elements of an array object"
				type:        "object"
				properties: {
					type: $ref: "#/components/schemas/NodeType"
					elements: {
						description: "Elements of the array"
						type:        "array"
						items: $ref: "#/components/schemas/Expression"
					}
				}
			}
			DictExpression: {
				description: "Used to create and directly specify the elements of a dictionary"
				type:        "object"
				properties: {
					type: $ref: "#/components/schemas/NodeType"
					elements: {
						description: "Elements of the dictionary"
						type:        "array"
						items: $ref: "#/components/schemas/DictItem"
					}
				}
			}
			DictItem: {
				description: "A key/value pair in a dictionary"
				type:        "object"
				properties: {
					type: $ref: "#/components/schemas/NodeType"
					key: $ref:  "#/components/schemas/Expression"
					val: $ref:  "#/components/schemas/Expression"
				}
			}
			FunctionExpression: {
				description: "Function expression"
				type:        "object"
				properties: {
					type: $ref: "#/components/schemas/NodeType"
					params: {
						description: "Function parameters"
						type:        "array"
						items: $ref: "#/components/schemas/Property"
					}
					body: $ref: "#/components/schemas/Node"
				}
			}
			BinaryExpression: {
				description: "uses binary operators to act on two operands in an expression"
				type:        "object"
				properties: {
					type: $ref:     "#/components/schemas/NodeType"
					operator: type: "string"
					left: $ref:     "#/components/schemas/Expression"
					right: $ref:    "#/components/schemas/Expression"
				}
			}
			CallExpression: {
				description: "Represents a function call"
				type:        "object"
				properties: {
					type: $ref:   "#/components/schemas/NodeType"
					callee: $ref: "#/components/schemas/Expression"
					arguments: {
						description: "Function arguments"
						type:        "array"
						items: $ref: "#/components/schemas/Expression"
					}
				}
			}
			ConditionalExpression: {
				description: "Selects one of two expressions, `Alternate` or `Consequent`, depending on a third boolean expression, `Test`"
				type:        "object"
				properties: {
					type: $ref:       "#/components/schemas/NodeType"
					test: $ref:       "#/components/schemas/Expression"
					alternate: $ref:  "#/components/schemas/Expression"
					consequent: $ref: "#/components/schemas/Expression"
				}
			}
			LogicalExpression: {
				description: "Represents the rule conditions that collectively evaluate to either true or false"
				type:        "object"
				properties: {
					type: $ref:     "#/components/schemas/NodeType"
					operator: type: "string"
					left: $ref:     "#/components/schemas/Expression"
					right: $ref:    "#/components/schemas/Expression"
				}
			}
			MemberExpression: {
				description: "Represents accessing a property of an object"
				type:        "object"
				properties: {
					type: $ref:     "#/components/schemas/NodeType"
					object: $ref:   "#/components/schemas/Expression"
					property: $ref: "#/components/schemas/PropertyKey"
				}
			}
			IndexExpression: {
				description: "Represents indexing into an array"
				type:        "object"
				properties: {
					type: $ref:  "#/components/schemas/NodeType"
					array: $ref: "#/components/schemas/Expression"
					index: $ref: "#/components/schemas/Expression"
				}
			}
			ObjectExpression: {
				description: "Allows the declaration of an anonymous object within a declaration"
				type:        "object"
				properties: {
					type: $ref: "#/components/schemas/NodeType"
					properties: {
						description: "Object properties"
						type:        "array"
						items: $ref: "#/components/schemas/Property"
					}
				}
			}
			ParenExpression: {
				description: "Represents an expression wrapped in parenthesis"
				type:        "object"
				properties: {
					type: $ref:       "#/components/schemas/NodeType"
					expression: $ref: "#/components/schemas/Expression"
				}
			}
			PipeExpression: {
				description: "Call expression with pipe argument"
				type:        "object"
				properties: {
					type: $ref:     "#/components/schemas/NodeType"
					argument: $ref: "#/components/schemas/Expression"
					call: $ref:     "#/components/schemas/CallExpression"
				}
			}
			UnaryExpression: {
				description: "Uses operators to act on a single operand in an expression"
				type:        "object"
				properties: {
					type: $ref:     "#/components/schemas/NodeType"
					operator: type: "string"
					argument: $ref: "#/components/schemas/Expression"
				}
			}
			BooleanLiteral: {
				description: "Represents boolean values"
				type:        "object"
				properties: {
					type: $ref:  "#/components/schemas/NodeType"
					value: type: "boolean"
				}
			}
			DateTimeLiteral: {
				description: "Represents an instant in time with nanosecond precision using the syntax of golang's RFC3339 Nanosecond variant"
				type:        "object"
				properties: {
					type: $ref: "#/components/schemas/NodeType"
					value: {
						type:   "string"
						format: "date-time"
					}
				}
			}
			DurationLiteral: {
				description: "Represents the elapsed time between two instants as an int64 nanosecond count with syntax of golang's time.Duration"
				type:        "object"
				properties: {
					type: $ref: "#/components/schemas/NodeType"
					values: {
						description: "Duration values"
						type:        "array"
						items: $ref: "#/components/schemas/Duration"
					}
				}
			}
			FloatLiteral: {
				description: "Represents floating point numbers according to the double representations defined by the IEEE-754-1985"
				type:        "object"
				properties: {
					type: $ref:  "#/components/schemas/NodeType"
					value: type: "number"
				}
			}
			IntegerLiteral: {
				description: "Represents integer numbers"
				type:        "object"
				properties: {
					type: $ref:  "#/components/schemas/NodeType"
					value: type: "string"
				}
			}
			PipeLiteral: {
				description: "Represents a specialized literal value, indicating the left hand value of a pipe expression"
				type:        "object"
				properties: type: $ref: "#/components/schemas/NodeType"
			}
			RegexpLiteral: {
				description: "Expressions begin and end with `/` and are regular expressions with syntax accepted by RE2"
				type:        "object"
				properties: {
					type: $ref:  "#/components/schemas/NodeType"
					value: type: "string"
				}
			}
			StringLiteral: {
				description: "Expressions begin and end with double quote marks"
				type:        "object"
				properties: {
					type: $ref:  "#/components/schemas/NodeType"
					value: type: "string"
				}
			}
			UnsignedIntegerLiteral: {
				description: "Represents integer numbers"
				type:        "object"
				properties: {
					type: $ref:  "#/components/schemas/NodeType"
					value: type: "string"
				}
			}
			Duration: {
				description: "A pair consisting of length of time and the unit of time measured. It is the atomic unit from which all duration literals are composed."
				type:        "object"
				properties: {
					type: $ref:      "#/components/schemas/NodeType"
					magnitude: type: "integer"
					unit: type:      "string"
				}
			}
			Property: {
				description: "The value associated with a key"
				type:        "object"
				properties: {
					type: $ref:  "#/components/schemas/NodeType"
					key: $ref:   "#/components/schemas/PropertyKey"
					value: $ref: "#/components/schemas/Expression"
				}
			}
			PropertyKey: oneOf: [{
				$ref: "#/components/schemas/Identifier"
			}, {
				$ref: "#/components/schemas/StringLiteral"
			}]
			Identifier: {
				description: "A valid Flux identifier"
				type:        "object"
				properties: {
					type: $ref: "#/components/schemas/NodeType"
					name: type: "string"
				}
			}
			Dialect: {
				description: "Dialect are options to change the default CSV output format; https://www.w3.org/TR/2015/REC-tabular-metadata-20151217/#dialect-descriptions"
				type:        "object"
				properties: {
					header: {
						description: "If true, the results will contain a header row"
						type:        "boolean"
						default:     true
					}
					delimiter: {
						description: "Separator between cells; the default is ,"
						type:        "string"
						default:     ","
						maxLength:   1
						minLength:   1
					}
					annotations: {
						description: "https://www.w3.org/TR/2015/REC-tabular-data-model-20151217/#columns"
						type:        "array"
						uniqueItems: true
						items: {
							type: "string"
							enum: ["group", "datatype", "default"]
						}
					}
					commentPrefix: {
						description: "Character prefixed to comment strings"
						type:        "string"
						default:     "#"
						maxLength:   1
						minLength:   0
					}
					dateTimeFormat: {
						description: "Format of timestamps"
						type:        "string"
						default:     "RFC3339"
						enum: ["RFC3339", "RFC3339Nano"]
					}
				}
			}
			AuthorizationUpdateRequest: properties: {
				status: {
					description: "If inactive the token is inactive and requests using the token will be rejected."
					default:     "active"
					type:        "string"
					enum: ["active", "inactive"]
				}
				description: {
					type:        "string"
					description: "A description of the token."
				}
			}
			PostBucketRequest: {
				properties: {
					orgID: type:          "string"
					name: type:           "string"
					description: type:    "string"
					rp: type:             "string"
					retentionRules: $ref: "#/components/schemas/RetentionRules"
					schemaType: {
						$ref:    "#/components/schemas/SchemaType"
						default: "implicit"
					}
				}
				required: ["orgID", "name", "retentionRules"]
			}
			Bucket: {
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
								$ref:        "#/components/schemas/Link"
							}
							members: {
								description: "URL to retrieve members that can read this bucket"
								$ref:        "#/components/schemas/Link"
							}
							org: {
								description: "URL to retrieve parent organization for this bucket"
								$ref:        "#/components/schemas/Link"
							}
							owners: {
								description: "URL to retrieve owners that can read and write to this bucket."
								$ref:        "#/components/schemas/Link"
							}
							self: {
								description: "URL for this bucket"
								$ref:        "#/components/schemas/Link"
							}
							write: {
								description: "URL to write line protocol for this bucket"
								$ref:        "#/components/schemas/Link"
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
						default:  "user"
						enum: ["user", "system"]
					}
					name: type:        "string"
					description: type: "string"
					orgID: type:       "string"
					rp: type:          "string"
					schemaType: {
						$ref:    "#/components/schemas/SchemaType"
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
					retentionRules: $ref: "#/components/schemas/RetentionRules"
					labels: $ref:         "#/components/schemas/Labels"
				}
				required: ["name", "retentionRules"]
			}
			Buckets: {
				type: "object"
				properties: {
					links: {
						readOnly: true
						$ref:     "#/components/schemas/Links"
					}
					buckets: {
						type: "array"
						items: $ref: "#/components/schemas/Bucket"
					}
				}
			}
			RetentionRules: {
				type:        "array"
				description: "Rules to expire or retain data.  No rules means data never expires."
				items: $ref: "#/components/schemas/RetentionRule"
			}
			PatchBucketRequest: {
				type:        "object"
				description: "Updates to an existing bucket resource."
				properties: {
					name: type:           "string"
					description: type:    "string"
					retentionRules: $ref: "#/components/schemas/PatchRetentionRules"
				}
			}
			PatchRetentionRules: {
				type:        "array"
				description: "Updates to rules to expire or retain data. No rules means no updates."
				items: $ref: "#/components/schemas/PatchRetentionRule"
			}
			PatchRetentionRule: {
				type:        "object"
				description: "Updates to a rule to expire or retain data."
				properties: {
					type: {
						type:    "string"
						default: "expire"
						enum: ["expire"]
					}
					everySeconds: {
						type:        "integer"
						format:      "int64"
						description: "Duration in seconds for how long data will be kept in the database. 0 means infinite."
						example:     86400
						minimum:     0
					}
					shardGroupDurationSeconds: {
						type:        "integer"
						format:      "int64"
						description: "Shard duration measured in seconds."
					}
				}
				required: ["type"]
			}
			RetentionRule: {
				type: "object"
				properties: {
					type: {
						type:    "string"
						default: "expire"
						enum: ["expire"]
					}
					everySeconds: {
						type:        "integer"
						format:      "int64"
						description: "Duration in seconds for how long data will be kept in the database. 0 means infinite."
						example:     86400
						minimum:     0
					}
					shardGroupDurationSeconds: {
						type:        "integer"
						format:      "int64"
						description: "Shard duration measured in seconds."
					}
				}
				required: ["type", "everySeconds"]
			}
			Link: {
				type:        "string"
				format:      "uri"
				readOnly:    true
				description: "URI of resource."
			}
			Links: {
				type: "object"
				properties: {
					next: $ref: "#/components/schemas/Link"
					self: $ref: "#/components/schemas/Link"
					prev: $ref: "#/components/schemas/Link"
				}
				required: ["self"]
			}
			Logs: {
				type: "object"
				properties: events: {
					readOnly: true
					type:     "array"
					items: $ref: "#/components/schemas/LogEvent"
				}
			}
			LogEvent: {
				type: "object"
				properties: {
					time: {
						readOnly:    true
						description: "Time event occurred, RFC3339Nano."
						type:        "string"
						format:      "date-time"
					}
					message: {
						readOnly:    true
						description: "A description of the event that occurred."
						type:        "string"
						example:     "Halt and catch fire"
					}
					runID: {
						readOnly:    true
						description: "the ID of the task that logged"
						type:        "string"
					}
				}
			}
			Organization: {
				properties: {
					links: {
						type:     "object"
						readOnly: true
						example: {
							self:       "/api/v2/orgs/1"
							members:    "/api/v2/orgs/1/members"
							owners:     "/api/v2/orgs/1/owners"
							labels:     "/api/v2/orgs/1/labels"
							secrets:    "/api/v2/orgs/1/secrets"
							buckets:    "/api/v2/buckets?org=myorg"
							tasks:      "/api/v2/tasks?org=myorg"
							dashboards: "/api/v2/dashboards?org=myorg"
						}
						properties: {
							self: $ref:       "#/components/schemas/Link"
							members: $ref:    "#/components/schemas/Link"
							owners: $ref:     "#/components/schemas/Link"
							labels: $ref:     "#/components/schemas/Link"
							secrets: $ref:    "#/components/schemas/Link"
							buckets: $ref:    "#/components/schemas/Link"
							tasks: $ref:      "#/components/schemas/Link"
							dashboards: $ref: "#/components/schemas/Link"
						}
					}
					id: {
						readOnly: true
						type:     "string"
					}
					name: type:        "string"
					description: type: "string"
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
					status: {
						description: "If inactive the organization is inactive."
						default:     "active"
						type:        "string"
						enum: ["active", "inactive"]
					}
				}
				required: ["name"]
			}
			Organizations: {
				type: "object"
				properties: {
					links: $ref: "#/components/schemas/Links"
					orgs: {
						type: "array"
						items: $ref: "#/components/schemas/Organization"
					}
				}
			}
			PostOrganizationRequest: {
				type: "object"
				properties: {
					name: type:        "string"
					description: type: "string"
				}
				required: ["name"]
			}
			PatchOrganizationRequest: {
				type: "object"
				properties: {
					name: {
						type:        "string"
						description: "New name to set on the organization"
					}
					description: {
						type:        "string"
						description: "New description to set on the organization"
					}
				}
			}
			TemplateApply: {
				type: "object"
				properties: {
					dryRun: type:  "boolean"
					orgID: type:   "string"
					stackID: type: "string"
					template: {
						type: "object"
						properties: {
							contentType: type: "string"
							sources: {
								type: "array"
								items: type: "string"
							}
							contents: $ref: "#/components/schemas/Template"
						}
					}
					templates: {
						type: "array"
						items: {
							type: "object"
							properties: {
								contentType: type: "string"
								sources: {
									type: "array"
									items: type: "string"
								}
								contents: $ref: "#/components/schemas/Template"
							}
						}
					}
					envRefs: {
						type: "object"
						additionalProperties: oneOf: [{
							type: "string"
						}, {
							type: "integer"
						}, {
							type: "number"
						}, {
							type: "boolean"
						}]
					}
					secrets: {
						type: "object"
						additionalProperties: type: "string"
					}
					remotes: {
						type: "array"
						items: {
							type: "object"
							properties: {
								url: type:         "string"
								contentType: type: "string"
							}
							required: ["url"]
						}
					}
					actions: {
						type: "array"
						items: oneOf: [{
							type: "object"
							properties: {
								action: {
									type: "string"
									enum: ["skipKind"]
								}
								properties: {
									type: "object"
									properties: kind: $ref: "#/components/schemas/TemplateKind"
									required: ["kind"]
								}
							}
						}, {
							type: "object"
							properties: {
								action: {
									type: "string"
									enum: ["skipResource"]
								}
								properties: {
									type: "object"
									properties: {
										kind: $ref:                 "#/components/schemas/TemplateKind"
										resourceTemplateName: type: "string"
									}
									required: ["kind", "resourceTemplateName"]
								}
							}
						}]
					}
				}
			}
			TemplateKind: {
				type: "string"
				enum: ["Bucket", "Check", "CheckDeadman", "CheckThreshold", "Dashboard", "Label", "NotificationEndpoint", "NotificationEndpointHTTP", "NotificationEndpointPagerDuty", "NotificationEndpointSlack", "NotificationRule", "Task", "Telegraf", "Variable"]
			}
			TemplateExportByID: {
				type: "object"
				properties: {
					stackID: type: "string"
					orgIDs: {
						type: "array"
						items: {
							type: "object"
							properties: {
								orgID: type: "string"
								resourceFilters: {
									type: "object"
									properties: {
										byLabel: {
											type: "array"
											items: type: "string"
										}
										byResourceKind: {
											type: "array"
											items: $ref: "#/components/schemas/TemplateKind"
										}
									}
								}
							}
						}
					}
					resources: {
						type: "array"
						items: {
							type: "object"
							properties: {
								id: type:   "string"
								kind: $ref: "#/components/schemas/TemplateKind"
								name: {
									type:        "string"
									description: "if defined with id, name is used for resource exported by id. if defined independently, resources strictly matching name are exported"
								}
							}
							required: ["id", "kind"]
						}
					}
				}
			}
			TemplateExportByName: {
				type: "object"
				properties: {
					stackID: type: "string"
					orgIDs: {
						type: "array"
						items: {
							type: "object"
							properties: {
								orgID: type: "string"
								resourceFilters: {
									type: "object"
									properties: {
										byLabel: {
											type: "array"
											items: type: "string"
										}
										byResourceKind: {
											type: "array"
											items: $ref: "#/components/schemas/TemplateKind"
										}
									}
								}
							}
						}
					}
					resources: {
						type: "array"
						items: {
							type: "object"
							properties: {
								kind: $ref: "#/components/schemas/TemplateKind"
								name: type: "string"
							}
							required: ["name", "kind"]
						}
					}
				}
			}
			Template: {
				type: "array"
				items: {
					type: "object"
					properties: {
						apiVersion: type: "string"
						kind: $ref:       "#/components/schemas/TemplateKind"
						meta: {
							type: "object"
							properties: name: type: "string"
						}
						spec: type: "object"
					}
				}
			}
			TemplateEnvReferences: {
				type: "array"
				items: {
					type: "object"
					properties: {
						resourceField: {
							type:        "string"
							description: "Field the environment reference corresponds too"
						}
						envRefKey: {
							type:        "string"
							description: "Key identified as environment reference and is the key identified in the template"
						}
						value: {
							description: "Value provided to fulfill reference"
							nullable:    true
							oneOf: [{
								type: "string"
							}, {
								type: "integer"
							}, {
								type: "number"
							}, {
								type: "boolean"
							}]
						}
						defaultValue: {
							description: "Default value that will be provided for the reference when no value is provided"
							nullable:    true
							oneOf: [{
								type: "string"
							}, {
								type: "integer"
							}, {
								type: "number"
							}, {
								type: "boolean"
							}]
						}
					}
					required: ["resourceField", "envRefKey"]
				}
			}
			TemplateSummary: {
				type: "object"
				properties: {
					sources: {
						type: "array"
						items: type: "string"
					}
					stackID: type: "string"
					summary: {
						type: "object"
						properties: {
							buckets: {
								type: "array"
								items: {
									type: "object"
									properties: {
										id: type:               "string"
										orgID: type:            "string"
										kind: $ref:             "#/components/schemas/TemplateKind"
										templateMetaName: type: "string"
										name: type:             "string"
										description: type:      "string"
										retentionPeriod: type:  "integer"
										labelAssociations: {
											type: "array"
											items: $ref: "#/components/schemas/TemplateSummaryLabel"
										}
										envReferences: $ref: "#/components/schemas/TemplateEnvReferences"
									}
								}
							}
							checks: {
								type: "array"
								items: allOf: [{
									$ref: "#/components/schemas/CheckDiscriminator"
								}, {
									type: "object"
									properties: {
										kind: $ref:             "#/components/schemas/TemplateKind"
										templateMetaName: type: "string"
										labelAssociations: {
											type: "array"
											items: $ref: "#/components/schemas/TemplateSummaryLabel"
										}
										envReferences: $ref: "#/components/schemas/TemplateEnvReferences"
									}
								}]
							}
							dashboards: {
								type: "array"
								items: {
									type: "object"
									properties: {
										id: type:               "string"
										orgID: type:            "string"
										kind: $ref:             "#/components/schemas/TemplateKind"
										templateMetaName: type: "string"
										name: type:             "string"
										description: type:      "string"
										labelAssociations: {
											type: "array"
											items: $ref: "#/components/schemas/TemplateSummaryLabel"
										}
										charts: {
											type: "array"
											items: $ref: "#/components/schemas/TemplateChart"
										}
										envReferences: $ref: "#/components/schemas/TemplateEnvReferences"
									}
								}
							}
							labels: {
								type: "array"
								items: $ref: "#/components/schemas/TemplateSummaryLabel"
							}
							labelMappings: {
								type: "array"
								items: {
									type: "object"
									properties: {
										status: type:                   "string"
										resourceTemplateMetaName: type: "string"
										resourceName: type:             "string"
										resourceID: type:               "string"
										resourceType: type:             "string"
										labelTemplateMetaName: type:    "string"
										labelName: type:                "string"
										labelID: type:                  "string"
									}
								}
							}
							missingEnvRefs: {
								type: "array"
								items: type: "string"
							}
							missingSecrets: {
								type: "array"
								items: type: "string"
							}
							notificationEndpoints: {
								type: "array"
								items: allOf: [{
									$ref: "#/components/schemas/NotificationEndpointDiscriminator"
								}, {
									type: "object"
									properties: {
										kind: $ref:             "#/components/schemas/TemplateKind"
										templateMetaName: type: "string"
										labelAssociations: {
											type: "array"
											items: $ref: "#/components/schemas/TemplateSummaryLabel"
										}
										envReferences: $ref: "#/components/schemas/TemplateEnvReferences"
									}
								}]
							}
							notificationRules: {
								type: "array"
								items: {
									type: "object"
									properties: {
										kind: $ref:                     "#/components/schemas/TemplateKind"
										templateMetaName: type:         "string"
										name: type:                     "string"
										description: type:              "string"
										endpointTemplateMetaName: type: "string"
										endpointID: type:               "string"
										endpointType: type:             "string"
										every: type:                    "string"
										offset: type:                   "string"
										messageTemplate: type:          "string"
										status: type:                   "string"
										statusRules: {
											type: "array"
											items: {
												type: "object"
												properties: {
													currentLevel: type:  "string"
													previousLevel: type: "string"
												}
											}
										}
										tagRules: {
											type: "array"
											items: {
												type: "object"
												properties: {
													key: type:      "string"
													value: type:    "string"
													operator: type: "string"
												}
											}
										}
										labelAssociations: {
											type: "array"
											items: $ref: "#/components/schemas/TemplateSummaryLabel"
										}
										envReferences: $ref: "#/components/schemas/TemplateEnvReferences"
									}
								}
							}
							tasks: {
								type: "array"
								items: {
									type: "object"
									properties: {
										kind: $ref:             "#/components/schemas/TemplateKind"
										templateMetaName: type: "string"
										id: type:               "string"
										name: type:             "string"
										cron: type:             "string"
										description: type:      "string"
										every: type:            "string"
										offset: type:           "string"
										query: type:            "string"
										status: type:           "string"
										envReferences: $ref:    "#/components/schemas/TemplateEnvReferences"
									}
								}
							}
							telegrafConfigs: {
								type: "array"
								items: allOf: [{
									$ref: "#/components/schemas/TelegrafRequest"
								}, {
									type: "object"
									properties: {
										kind: $ref:             "#/components/schemas/TemplateKind"
										templateMetaName: type: "string"
										labelAssociations: {
											type: "array"
											items: $ref: "#/components/schemas/TemplateSummaryLabel"
										}
										envReferences: $ref: "#/components/schemas/TemplateEnvReferences"
									}
								}]
							}
							variables: {
								type: "array"
								items: {
									type: "object"
									properties: {
										kind: $ref:             "#/components/schemas/TemplateKind"
										templateMetaName: type: "string"
										id: type:               "string"
										orgID: type:            "string"
										name: type:             "string"
										description: type:      "string"
										arguments: $ref:        "#/components/schemas/VariableProperties"
										labelAssociations: {
											type: "array"
											items: $ref: "#/components/schemas/TemplateSummaryLabel"
										}
										envReferences: $ref: "#/components/schemas/TemplateEnvReferences"
									}
								}
							}
						}
					}
					diff: {
						type: "object"
						properties: {
							buckets: {
								type: "array"
								items: {
									type: "object"
									properties: {
										kind: $ref:             "#/components/schemas/TemplateKind"
										stateStatus: type:      "string"
										id: type:               "string"
										templateMetaName: type: "string"
										new: {
											type: "object"
											properties: {
												name: type:           "string"
												description: type:    "string"
												retentionRules: $ref: "#/components/schemas/RetentionRules"
											}
										}
										old: {
											type: "object"
											properties: {
												name: type:           "string"
												description: type:    "string"
												retentionRules: $ref: "#/components/schemas/RetentionRules"
											}
										}
									}
								}
							}
							checks: {
								type: "array"
								items: {
									type: "object"
									properties: {
										kind: $ref:             "#/components/schemas/TemplateKind"
										stateStatus: type:      "string"
										id: type:               "string"
										templateMetaName: type: "string"
										new: $ref:              "#/components/schemas/CheckDiscriminator"
										old: $ref:              "#/components/schemas/CheckDiscriminator"
									}
								}
							}
							dashboards: {
								type: "array"
								items: {
									type: "object"
									properties: {
										stateStatus: type:      "string"
										id: type:               "string"
										kind: $ref:             "#/components/schemas/TemplateKind"
										templateMetaName: type: "string"
										new: {
											type: "object"
											properties: {
												name: type:        "string"
												description: type: "string"
												charts: {
													type: "array"
													items: $ref: "#/components/schemas/TemplateChart"
												}
											}
										}
										old: {
											type: "object"
											properties: {
												name: type:        "string"
												description: type: "string"
												charts: {
													type: "array"
													items: $ref: "#/components/schemas/TemplateChart"
												}
											}
										}
									}
								}
							}
							labels: {
								type: "array"
								items: {
									type: "object"
									properties: {
										stateStatus: type:      "string"
										kind: $ref:             "#/components/schemas/TemplateKind"
										id: type:               "string"
										templateMetaName: type: "string"
										new: {
											type: "object"
											properties: {
												name: type:        "string"
												color: type:       "string"
												description: type: "string"
											}
										}
										old: {
											type: "object"
											properties: {
												name: type:        "string"
												color: type:       "string"
												description: type: "string"
											}
										}
									}
								}
							}
							labelMappings: {
								type: "array"
								items: {
									type: "object"
									properties: {
										status: type:                   "string"
										resourceType: type:             "string"
										resourceID: type:               "string"
										resourceTemplateMetaName: type: "string"
										resourceName: type:             "string"
										labelID: type:                  "string"
										labelTemplateMetaName: type:    "string"
										labelName: type:                "string"
									}
								}
							}
							notificationEndpoints: {
								type: "array"
								items: {
									type: "object"
									properties: {
										kind: $ref:             "#/components/schemas/TemplateKind"
										stateStatus: type:      "string"
										id: type:               "string"
										templateMetaName: type: "string"
										new: $ref:              "#/components/schemas/NotificationEndpointDiscriminator"
										old: $ref:              "#/components/schemas/NotificationEndpointDiscriminator"
									}
								}
							}
							notificationRules: {
								type: "array"
								items: {
									type: "object"
									properties: {
										kind: $ref:             "#/components/schemas/TemplateKind"
										stateStatus: type:      "string"
										id: type:               "string"
										templateMetaName: type: "string"
										new: {
											type: "object"
											properties: {
												name: type:            "string"
												description: type:     "string"
												endpointName: type:    "string"
												endpointID: type:      "string"
												endpointType: type:    "string"
												every: type:           "string"
												offset: type:          "string"
												messageTemplate: type: "string"
												status: type:          "string"
												statusRules: {
													type: "array"
													items: {
														type: "object"
														properties: {
															currentLevel: type:  "string"
															previousLevel: type: "string"
														}
													}
												}
												tagRules: {
													type: "array"
													items: {
														type: "object"
														properties: {
															key: type:      "string"
															value: type:    "string"
															operator: type: "string"
														}
													}
												}
											}
										}
										old: {
											type: "object"
											properties: {
												name: type:            "string"
												description: type:     "string"
												endpointName: type:    "string"
												endpointID: type:      "string"
												endpointType: type:    "string"
												every: type:           "string"
												offset: type:          "string"
												messageTemplate: type: "string"
												status: type:          "string"
												statusRules: {
													type: "array"
													items: {
														type: "object"
														properties: {
															currentLevel: type:  "string"
															previousLevel: type: "string"
														}
													}
												}
												tagRules: {
													type: "array"
													items: {
														type: "object"
														properties: {
															key: type:      "string"
															value: type:    "string"
															operator: type: "string"
														}
													}
												}
											}
										}
									}
								}
							}
							tasks: {
								type: "array"
								items: {
									type: "object"
									properties: {
										kind: $ref:             "#/components/schemas/TemplateKind"
										stateStatus: type:      "string"
										id: type:               "string"
										templateMetaName: type: "string"
										new: {
											type: "object"
											properties: {
												name: type:        "string"
												cron: type:        "string"
												description: type: "string"
												every: type:       "string"
												offset: type:      "string"
												query: type:       "string"
												status: type:      "string"
											}
										}
										old: {
											type: "object"
											properties: {
												name: type:        "string"
												cron: type:        "string"
												description: type: "string"
												every: type:       "string"
												offset: type:      "string"
												query: type:       "string"
												status: type:      "string"
											}
										}
									}
								}
							}
							telegrafConfigs: {
								type: "array"
								items: {
									type: "object"
									properties: {
										kind: $ref:             "#/components/schemas/TemplateKind"
										stateStatus: type:      "string"
										id: type:               "string"
										templateMetaName: type: "string"
										new: $ref:              "#/components/schemas/TelegrafRequest"
										old: $ref:              "#/components/schemas/TelegrafRequest"
									}
								}
							}
							variables: {
								type: "array"
								items: {
									type: "object"
									properties: {
										kind: $ref:             "#/components/schemas/TemplateKind"
										stateStatus: type:      "string"
										id: type:               "string"
										templateMetaName: type: "string"
										new: {
											type: "object"
											properties: {
												name: type:        "string"
												description: type: "string"
												args: $ref:        "#/components/schemas/VariableProperties"
											}
										}
										old: {
											type: "object"
											properties: {
												name: type:        "string"
												description: type: "string"
												args: $ref:        "#/components/schemas/VariableProperties"
											}
										}
									}
								}
							}
						}
					}
					errors: {
						type: "array"
						items: {
							type: "object"
							properties: {
								kind: $ref:   "#/components/schemas/TemplateKind"
								reason: type: "string"
								fields: {
									type: "array"
									items: type: "string"
								}
								indexes: {
									type: "array"
									items: type: "integer"
								}
							}
						}
					}
				}
			}
			TemplateSummaryLabel: {
				type: "object"
				properties: {
					id: type:               "string"
					orgID: type:            "string"
					kind: $ref:             "#/components/schemas/TemplateKind"
					templateMetaName: type: "string"
					name: type:             "string"
					properties: {
						type: "object"
						properties: {
							color: type:       "string"
							description: type: "string"
						}
					}
					envReferences: $ref: "#/components/schemas/TemplateEnvReferences"
				}
			}
			TemplateChart: {
				type: "object"
				properties: {
					xPos: type:       "integer"
					yPos: type:       "integer"
					height: type:     "integer"
					width: type:      "integer"
					properties: $ref: "#/components/schemas/ViewProperties"
				}
			}
			Stack: {
				type: "object"
				properties: {
					id: type:    "string"
					orgID: type: "string"
					createdAt: {
						type:     "string"
						format:   "date-time"
						readOnly: true
					}
					events: {
						type: "array"
						items: {
							type: "object"
							properties: {
								eventType: type:   "string"
								name: type:        "string"
								description: type: "string"
								sources: {
									type: "array"
									items: type: "string"
								}
								resources: {
									type: "array"
									items: {
										type: "object"
										properties: {
											apiVersion: type:       "string"
											resourceID: type:       "string"
											kind: $ref:             "#/components/schemas/TemplateKind"
											templateMetaName: type: "string"
											associations: {
												type: "array"
												items: {
													type: "object"
													properties: {
														kind: $ref:     "#/components/schemas/TemplateKind"
														metaName: type: "string"
													}
												}
											}
											links: {
												type: "object"
												properties: self: type: "string"
											}
										}
									}
								}
								urls: {
									type: "array"
									items: type: "string"
								}
								updatedAt: {
									type:     "string"
									format:   "date-time"
									readOnly: true
								}
							}
						}
					}
				}
			}
			Runs: {
				type: "object"
				properties: {
					links: $ref: "#/components/schemas/Links"
					runs: {
						type: "array"
						items: $ref: "#/components/schemas/Run"
					}
				}
			}
			Run: properties: {
				id: {
					readOnly: true
					type:     "string"
				}
				taskID: {
					readOnly: true
					type:     "string"
				}
				status: {
					readOnly: true
					type:     "string"
					enum: ["scheduled", "started", "failed", "success", "canceled"]
				}
				scheduledFor: {
					description: "Time used for run's \"now\" option, RFC3339."
					type:        "string"
					format:      "date-time"
				}
				log: {
					description: "An array of logs associated with the run."
					type:        "array"
					readOnly:    true
					items: $ref: "#/components/schemas/LogEvent"
				}
				startedAt: {
					readOnly:    true
					description: "Time run started executing, RFC3339Nano."
					type:        "string"
					format:      "date-time"
				}
				finishedAt: {
					readOnly:    true
					description: "Time run finished executing, RFC3339Nano."
					type:        "string"
					format:      "date-time"
				}
				requestedAt: {
					readOnly:    true
					description: "Time run was manually requested, RFC3339Nano."
					type:        "string"
					format:      "date-time"
				}
				links: {
					type:     "object"
					readOnly: true
					example: {
						self:  "/api/v2/tasks/1/runs/1"
						task:  "/api/v2/tasks/1"
						retry: "/api/v2/tasks/1/runs/1/retry"
					}
					properties: {
						self: {
							type:   "string"
							format: "uri"
						}
						task: {
							type:   "string"
							format: "uri"
						}
						retry: {
							type:   "string"
							format: "uri"
						}
					}
				}
			}
			RunManually: properties: scheduledFor: {
				nullable:    true
				description: "Time used for run's \"now\" option, RFC3339.  Default is the server's now time."
				type:        "string"
				format:      "date-time"
			}
			Tasks: {
				type: "object"
				properties: {
					links: {
						readOnly: true
						$ref:     "#/components/schemas/Links"
					}
					tasks: {
						type: "array"
						items: $ref: "#/components/schemas/Task"
					}
				}
			}
			Task: {
				type: "object"
				properties: {
					id: {
						readOnly: true
						type:     "string"
					}
					type: {
						description: "The type of task, this can be used for filtering tasks on list actions."
						type:        "string"
					}
					orgID: {
						description: "The ID of the organization that owns this Task."
						type:        "string"
					}
					org: {
						description: "The name of the organization that owns this Task."
						type:        "string"
					}
					name: {
						description: "The name of the task."
						type:        "string"
					}
					ownerID: {
						description: "The ID of the user who owns this Task."
						type:        "string"
					}
					description: {
						description: "An optional description of the task."
						type:        "string"
					}
					status: $ref: "#/components/schemas/TaskStatusType"
					labels: $ref: "#/components/schemas/Labels"
					authorizationID: {
						description: "The ID of the authorization used when this task communicates with the query engine."
						type:        "string"
					}
					flux: {
						description: "The Flux script to run for this task."
						type:        "string"
					}
					every: {
						description: "A simple task repetition schedule; parsed from Flux."
						type:        "string"
					}
					cron: {
						description: "A task repetition schedule in the form '* * * * * *'; parsed from Flux."
						type:        "string"
					}
					offset: {
						description: "Duration to delay after the schedule, before executing the task; parsed from flux, if set to zero it will remove this option and use 0 as the default."
						type:        "string"
					}
					latestCompleted: {
						description: "Timestamp of latest scheduled, completed run, RFC3339."
						type:        "string"
						format:      "date-time"
						readOnly:    true
					}
					lastRunStatus: {
						readOnly: true
						type:     "string"
						enum: ["failed", "success", "canceled"]
					}
					lastRunError: {
						readOnly: true
						type:     "string"
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
					links: {
						type:     "object"
						readOnly: true
						example: {
							self:    "/api/v2/tasks/1"
							owners:  "/api/v2/tasks/1/owners"
							members: "/api/v2/tasks/1/members"
							labels:  "/api/v2/tasks/1/labels"
							runs:    "/api/v2/tasks/1/runs"
							logs:    "/api/v2/tasks/1/logs"
						}
						properties: {
							self: $ref:    "#/components/schemas/Link"
							owners: $ref:  "#/components/schemas/Link"
							members: $ref: "#/components/schemas/Link"
							runs: $ref:    "#/components/schemas/Link"
							logs: $ref:    "#/components/schemas/Link"
							labels: $ref:  "#/components/schemas/Link"
						}
					}
				}
				required: ["id", "name", "orgID", "flux"]
			}
			TaskStatusType: {
				type: "string"
				enum: ["active", "inactive"]
			}
			UserResponse: {
				properties: {
					id: {
						readOnly: true
						type:     "string"
					}
					oauthID: type: "string"
					name: type:    "string"
					status: {
						description: "If inactive the user is inactive."
						default:     "active"
						type:        "string"
						enum: ["active", "inactive"]
					}
					links: {
						type:     "object"
						readOnly: true
						example: self: "/api/v2/users/1"
						properties: self: {
							type:   "string"
							format: "uri"
						}
					}
				}
				required: ["name"]
			}
			Flags: {
				type:                 "object"
				additionalProperties: true
			}
			ResourceMember: allOf: [{
				$ref: "#/components/schemas/UserResponse"
			}, {
				type: "object"
				properties: role: {
					type:    "string"
					default: "member"
					enum: ["member"]
				}
			}]
			ResourceMembers: {
				type: "object"
				properties: {
					links: {
						type: "object"
						properties: self: {
							type:   "string"
							format: "uri"
						}
					}
					users: {
						type: "array"
						items: $ref: "#/components/schemas/ResourceMember"
					}
				}
			}
			ResourceOwner: allOf: [{
				$ref: "#/components/schemas/UserResponse"
			}, {
				type: "object"
				properties: role: {
					type:    "string"
					default: "owner"
					enum: ["owner"]
				}
			}]
			ResourceOwners: {
				type: "object"
				properties: {
					links: {
						type: "object"
						properties: self: {
							type:   "string"
							format: "uri"
						}
					}
					users: {
						type: "array"
						items: $ref: "#/components/schemas/ResourceOwner"
					}
				}
			}
			FluxSuggestions: {
				type: "object"
				properties: funcs: {
					type: "array"
					items: $ref: "#/components/schemas/FluxSuggestion"
				}
			}
			FluxSuggestion: {
				type: "object"
				properties: {
					name: type: "string"
					params: {
						type: "object"
						additionalProperties: type: "string"
					}
				}
			}
			Routes: properties: {
				authorizations: {
					type:   "string"
					format: "uri"
				}
				buckets: {
					type:   "string"
					format: "uri"
				}
				dashboards: {
					type:   "string"
					format: "uri"
				}
				external: {
					type: "object"
					properties: statusFeed: {
						type:   "string"
						format: "uri"
					}
				}
				variables: {
					type:   "string"
					format: "uri"
				}
				me: {
					type:   "string"
					format: "uri"
				}
				flags: {
					type:   "string"
					format: "uri"
				}
				orgs: {
					type:   "string"
					format: "uri"
				}
				query: {
					type: "object"
					properties: {
						self: {
							type:   "string"
							format: "uri"
						}
						ast: {
							type:   "string"
							format: "uri"
						}
						analyze: {
							type:   "string"
							format: "uri"
						}
						suggestions: {
							type:   "string"
							format: "uri"
						}
					}
				}
				setup: {
					type:   "string"
					format: "uri"
				}
				signin: {
					type:   "string"
					format: "uri"
				}
				signout: {
					type:   "string"
					format: "uri"
				}
				sources: {
					type:   "string"
					format: "uri"
				}
				system: {
					type: "object"
					properties: {
						metrics: {
							type:   "string"
							format: "uri"
						}
						debug: {
							type:   "string"
							format: "uri"
						}
						health: {
							type:   "string"
							format: "uri"
						}
					}
				}
				tasks: {
					type:   "string"
					format: "uri"
				}
				telegrafs: {
					type:   "string"
					format: "uri"
				}
				users: {
					type:   "string"
					format: "uri"
				}
				write: {
					type:   "string"
					format: "uri"
				}
			}
			Error: {
				properties: {
					code: {
						description: "code is the machine-readable error code."
						readOnly:    true
						type:        "string"
						enum: ["internal error", "not found", "conflict", "invalid", "unprocessable entity", "empty value", "unavailable", "forbidden", "too many requests", "unauthorized", "method not allowed", "request too large", "unsupported media type"]
					}
					message: {
						readOnly:    true
						description: "message is a human-readable message."
						type:        "string"
					}
					op: {
						readOnly:    true
						description: "op describes the logical code operation during error. Useful for debugging."
						type:        "string"
					}
					err: {
						readOnly:    true
						description: "err is a stack of errors that occurred during processing of the request. Useful for debugging."
						type:        "string"
					}
				}
				required: ["code", "message"]
			}
			LineProtocolError: {
				properties: {
					code: {
						description: "Code is the machine-readable error code."
						readOnly:    true
						type:        "string"
						enum: ["internal error", "not found", "conflict", "invalid", "empty value", "unavailable"]
					}
					message: {
						readOnly:    true
						description: "Message is a human-readable message."
						type:        "string"
					}
					op: {
						readOnly:    true
						description: "Op describes the logical code operation during error. Useful for debugging."
						type:        "string"
					}
					err: {
						readOnly:    true
						description: "Err is a stack of errors that occurred during processing of the request. Useful for debugging."
						type:        "string"
					}
					line: {
						readOnly:    true
						description: "First line within sent body containing malformed data"
						type:        "integer"
						format:      "int32"
					}
				}
				required: ["code", "message", "op", "err"]
			}
			LineProtocolLengthError: {
				properties: {
					code: {
						description: "Code is the machine-readable error code."
						readOnly:    true
						type:        "string"
						enum: ["invalid"]
					}
					message: {
						readOnly:    true
						description: "Message is a human-readable message."
						type:        "string"
					}
					maxLength: {
						readOnly:    true
						description: "Max length in bytes for a body of line-protocol."
						type:        "integer"
						format:      "int32"
					}
				}
				required: ["code", "message", "maxLength"]
			}
			Field: {
				type: "object"
				properties: {
					value: {
						description: "value is the value of the field.  Meaning of the value is implied by the `type` key"
						type:        "string"
					}
					type: {
						description: "`type` describes the field type. `func` is a function. `field` is a field reference."
						type:        "string"
						enum: ["func", "field", "integer", "number", "regex", "wildcard"]
					}
					alias: {
						description: "Alias overrides the field name in the returned response.  Applies only if type is `func`"
						type:        "string"
					}
					args: {
						description: "Args are the arguments to the function"
						type:        "array"
						items: $ref: "#/components/schemas/Field"
					}
				}
			}
			BuilderConfig: {
				type: "object"
				properties: {
					buckets: {
						type: "array"
						items: type: "string"
					}
					tags: {
						type: "array"
						items: $ref: "#/components/schemas/BuilderTagsType"
					}
					functions: {
						type: "array"
						items: $ref: "#/components/schemas/BuilderFunctionsType"
					}
					aggregateWindow: {
						type: "object"
						properties: {
							period: type:     "string"
							fillValues: type: "boolean"
						}
					}
				}
			}
			BuilderTagsType: {
				type: "object"
				properties: {
					key: type: "string"
					values: {
						type: "array"
						items: type: "string"
					}
					aggregateFunctionType: $ref: "#/components/schemas/BuilderAggregateFunctionType"
				}
			}
			BuilderAggregateFunctionType: {
				type: "string"
				enum: ["filter", "group"]
			}
			BuilderFunctionsType: {
				type: "object"
				properties: name: type: "string"
			}
			DashboardQuery: {
				type: "object"
				properties: {
					text: {
						type:        "string"
						description: "The text of the Flux query."
					}
					editMode: $ref:      "#/components/schemas/QueryEditMode"
					name: type:          "string"
					builderConfig: $ref: "#/components/schemas/BuilderConfig"
				}
			}
			QueryEditMode: {
				type: "string"
				enum: ["builder", "advanced"]
			}
			Axis: {
				type:        "object"
				description: "The description of a particular axis for a visualization."
				properties: {
					bounds: {
						type:        "array"
						minItems:    0
						maxItems:    2
						description: "The extents of an axis in the form [lower, upper]. Clients determine whether bounds are to be inclusive or exclusive of their limits"
						items: type: "string"
					}
					label: {
						description: "Label is a description of this Axis"
						type:        "string"
					}
					prefix: {
						description: "Prefix represents a label prefix for formatting axis values."
						type:        "string"
					}
					suffix: {
						description: "Suffix represents a label suffix for formatting axis values."
						type:        "string"
					}
					base: {
						description: "Base represents the radix for formatting axis values."
						type:        "string"
						enum: ["", "2", "10"]
					}
					scale: $ref: "#/components/schemas/AxisScale"
				}
			}
			AxisScale: {
				description: "Scale is the axis formatting scale. Supported: \"log\", \"linear\""
				type:        "string"
				enum: ["log", "linear"]
			}
			DashboardColor: {
				type:        "object"
				description: "Defines an encoding of data value into color space."
				required: ["id", "type", "hex", "name", "value"]
				properties: {
					id: {
						description: "The unique ID of the view color."
						type:        "string"
					}
					type: {
						description: "Type is how the color is used."
						type:        "string"
						enum: ["min", "max", "threshold", "scale", "text", "background"]
					}
					hex: {
						description: "The hex number of the color"
						type:        "string"
						maxLength:   7
						minLength:   7
					}
					name: {
						description: "The user-facing name of the hex color."
						type:        "string"
					}
					value: {
						description: "The data value mapped to this color."
						type:        "number"
						format:      "float"
					}
				}
			}
			RenamableField: {
				description: "Describes a field that can be renamed and made visible or invisible."
				type:        "object"
				properties: {
					internalName: {
						description: "The calculated name of a field."
						readOnly:    true
						type:        "string"
					}
					displayName: {
						description: "The name that a field is renamed to by the user."
						type:        "string"
					}
					visible: {
						description: "Indicates whether this field should be visible on the table."
						type:        "boolean"
					}
				}
			}
			XYViewProperties: {
				type: "object"
				required: ["type", "geom", "queries", "shape", "axes", "colors", "note", "showNoteWhenEmpty", "position"]
				properties: {
					timeFormat: type: "string"
					type: {
						type: "string"
						enum: ["xy"]
					}
					queries: {
						type: "array"
						items: $ref: "#/components/schemas/DashboardQuery"
					}
					colors: {
						description: "Colors define color encoding of data into a visualization"
						type:        "array"
						items: $ref: "#/components/schemas/DashboardColor"
					}
					shape: {
						type: "string"
						enum: ["chronograf-v2"]
					}
					note: type: "string"
					showNoteWhenEmpty: {
						description: "If true, will display note when empty"
						type:        "boolean"
					}
					axes: $ref:         "#/components/schemas/Axes"
					staticLegend: $ref: "#/components/schemas/StaticLegend"
					xColumn: type:      "string"
					generateXAxisTicks: {
						type: "array"
						items: type: "string"
					}
					xTotalTicks: type: "integer"
					xTickStart: {
						type:   "number"
						format: "float"
					}
					xTickStep: {
						type:   "number"
						format: "float"
					}
					yColumn: type: "string"
					generateYAxisTicks: {
						type: "array"
						items: type: "string"
					}
					yTotalTicks: type: "integer"
					yTickStart: {
						type:   "number"
						format: "float"
					}
					yTickStep: {
						type:   "number"
						format: "float"
					}
					shadeBelow: type: "boolean"
					hoverDimension: {
						type: "string"
						enum: ["auto", "x", "y", "xy"]
					}
					position: {
						type: "string"
						enum: ["overlaid", "stacked"]
					}
					geom: $ref:               "#/components/schemas/XYGeom"
					legendColorizeRows: type: "boolean"
					legendHide: type:         "boolean"
					legendOpacity: {
						type:   "number"
						format: "float"
					}
					legendOrientationThreshold: type: "integer"
				}
			}
			XYGeom: {
				type: "string"
				enum: ["line", "step", "stacked", "bar", "monotoneX"]
			}
			BandViewProperties: {
				type: "object"
				required: ["type", "geom", "queries", "shape", "axes", "colors", "note", "showNoteWhenEmpty"]
				properties: {
					timeFormat: type: "string"
					type: {
						type: "string"
						enum: ["band"]
					}
					queries: {
						type: "array"
						items: $ref: "#/components/schemas/DashboardQuery"
					}
					colors: {
						description: "Colors define color encoding of data into a visualization"
						type:        "array"
						items: $ref: "#/components/schemas/DashboardColor"
					}
					shape: {
						type: "string"
						enum: ["chronograf-v2"]
					}
					note: type: "string"
					showNoteWhenEmpty: {
						description: "If true, will display note when empty"
						type:        "boolean"
					}
					axes: $ref:         "#/components/schemas/Axes"
					staticLegend: $ref: "#/components/schemas/StaticLegend"
					xColumn: type:      "string"
					generateXAxisTicks: {
						type: "array"
						items: type: "string"
					}
					xTotalTicks: type: "integer"
					xTickStart: {
						type:   "number"
						format: "float"
					}
					xTickStep: {
						type:   "number"
						format: "float"
					}
					yColumn: type: "string"
					generateYAxisTicks: {
						type: "array"
						items: type: "string"
					}
					yTotalTicks: type: "integer"
					yTickStart: {
						type:   "number"
						format: "float"
					}
					yTickStep: {
						type:   "number"
						format: "float"
					}
					upperColumn: type: "string"
					mainColumn: type:  "string"
					lowerColumn: type: "string"
					hoverDimension: {
						type: "string"
						enum: ["auto", "x", "y", "xy"]
					}
					geom: $ref:               "#/components/schemas/XYGeom"
					legendColorizeRows: type: "boolean"
					legendHide: type:         "boolean"
					legendOpacity: {
						type:   "number"
						format: "float"
					}
					legendOrientationThreshold: type: "integer"
				}
			}
			LinePlusSingleStatProperties: {
				type: "object"
				required: ["type", "queries", "shape", "axes", "colors", "note", "showNoteWhenEmpty", "prefix", "suffix", "decimalPlaces", "position"]
				properties: {
					timeFormat: type: "string"
					type: {
						type: "string"
						enum: ["line-plus-single-stat"]
					}
					queries: {
						type: "array"
						items: $ref: "#/components/schemas/DashboardQuery"
					}
					colors: {
						description: "Colors define color encoding of data into a visualization"
						type:        "array"
						items: $ref: "#/components/schemas/DashboardColor"
					}
					shape: {
						type: "string"
						enum: ["chronograf-v2"]
					}
					note: type: "string"
					showNoteWhenEmpty: {
						description: "If true, will display note when empty"
						type:        "boolean"
					}
					axes: $ref:         "#/components/schemas/Axes"
					staticLegend: $ref: "#/components/schemas/StaticLegend"
					xColumn: type:      "string"
					generateXAxisTicks: {
						type: "array"
						items: type: "string"
					}
					xTotalTicks: type: "integer"
					xTickStart: {
						type:   "number"
						format: "float"
					}
					xTickStep: {
						type:   "number"
						format: "float"
					}
					yColumn: type: "string"
					generateYAxisTicks: {
						type: "array"
						items: type: "string"
					}
					yTotalTicks: type: "integer"
					yTickStart: {
						type:   "number"
						format: "float"
					}
					yTickStep: {
						type:   "number"
						format: "float"
					}
					shadeBelow: type: "boolean"
					hoverDimension: {
						type: "string"
						enum: ["auto", "x", "y", "xy"]
					}
					position: {
						type: "string"
						enum: ["overlaid", "stacked"]
					}
					prefix: type:             "string"
					suffix: type:             "string"
					decimalPlaces: $ref:      "#/components/schemas/DecimalPlaces"
					legendColorizeRows: type: "boolean"
					legendHide: type:         "boolean"
					legendOpacity: {
						type:   "number"
						format: "float"
					}
					legendOrientationThreshold: type: "integer"
				}
			}
			MosaicViewProperties: {
				type: "object"
				required: ["type", "queries", "colors", "shape", "note", "showNoteWhenEmpty", "xColumn", "ySeriesColumns", "fillColumns", "xDomain", "yDomain", "xAxisLabel", "yAxisLabel", "xPrefix", "yPrefix", "xSuffix", "ySuffix"]
				properties: {
					timeFormat: type: "string"
					type: {
						type: "string"
						enum: ["mosaic"]
					}
					queries: {
						type: "array"
						items: $ref: "#/components/schemas/DashboardQuery"
					}
					colors: {
						description: "Colors define color encoding of data into a visualization"
						type:        "array"
						items: type: "string"
					}
					shape: {
						type: "string"
						enum: ["chronograf-v2"]
					}
					note: type: "string"
					showNoteWhenEmpty: {
						description: "If true, will display note when empty"
						type:        "boolean"
					}
					xColumn: type: "string"
					generateXAxisTicks: {
						type: "array"
						items: type: "string"
					}
					xTotalTicks: type: "integer"
					xTickStart: {
						type:   "number"
						format: "float"
					}
					xTickStep: {
						type:   "number"
						format: "float"
					}
					yLabelColumnSeparator: type: "string"
					yLabelColumns: {
						type: "array"
						items: type: "string"
					}
					ySeriesColumns: {
						type: "array"
						items: type: "string"
					}
					fillColumns: {
						type: "array"
						items: type: "string"
					}
					xDomain: {
						type: "array"
						items: type: "number"
						maxItems: 2
					}
					yDomain: {
						type: "array"
						items: type: "number"
						maxItems: 2
					}
					xAxisLabel: type: "string"
					yAxisLabel: type: "string"
					xPrefix: type:    "string"
					xSuffix: type:    "string"
					yPrefix: type:    "string"
					ySuffix: type:    "string"
					hoverDimension: {
						type: "string"
						enum: ["auto", "x", "y", "xy"]
					}
					legendColorizeRows: type: "boolean"
					legendHide: type:         "boolean"
					legendOpacity: {
						type:   "number"
						format: "float"
					}
					legendOrientationThreshold: type: "integer"
				}
			}
			ScatterViewProperties: {
				type: "object"
				required: ["type", "queries", "colors", "shape", "note", "showNoteWhenEmpty", "xColumn", "yColumn", "fillColumns", "symbolColumns", "xDomain", "yDomain", "xAxisLabel", "yAxisLabel", "xPrefix", "yPrefix", "xSuffix", "ySuffix"]
				properties: {
					timeFormat: type: "string"
					type: {
						type: "string"
						enum: ["scatter"]
					}
					queries: {
						type: "array"
						items: $ref: "#/components/schemas/DashboardQuery"
					}
					colors: {
						description: "Colors define color encoding of data into a visualization"
						type:        "array"
						items: type: "string"
					}
					shape: {
						type: "string"
						enum: ["chronograf-v2"]
					}
					note: type: "string"
					showNoteWhenEmpty: {
						description: "If true, will display note when empty"
						type:        "boolean"
					}
					xColumn: type: "string"
					generateXAxisTicks: {
						type: "array"
						items: type: "string"
					}
					xTotalTicks: type: "integer"
					xTickStart: {
						type:   "number"
						format: "float"
					}
					xTickStep: {
						type:   "number"
						format: "float"
					}
					yColumn: type: "string"
					generateYAxisTicks: {
						type: "array"
						items: type: "string"
					}
					yTotalTicks: type: "integer"
					yTickStart: {
						type:   "number"
						format: "float"
					}
					yTickStep: {
						type:   "number"
						format: "float"
					}
					fillColumns: {
						type: "array"
						items: type: "string"
					}
					symbolColumns: {
						type: "array"
						items: type: "string"
					}
					xDomain: {
						type: "array"
						items: type: "number"
						maxItems: 2
					}
					yDomain: {
						type: "array"
						items: type: "number"
						maxItems: 2
					}
					xAxisLabel: type:         "string"
					yAxisLabel: type:         "string"
					xPrefix: type:            "string"
					xSuffix: type:            "string"
					yPrefix: type:            "string"
					ySuffix: type:            "string"
					legendColorizeRows: type: "boolean"
					legendHide: type:         "boolean"
					legendOpacity: {
						type:   "number"
						format: "float"
					}
					legendOrientationThreshold: type: "integer"
				}
			}
			HeatmapViewProperties: {
				type: "object"
				required: ["type", "queries", "colors", "shape", "note", "showNoteWhenEmpty", "xColumn", "yColumn", "xDomain", "yDomain", "xAxisLabel", "yAxisLabel", "xPrefix", "yPrefix", "xSuffix", "ySuffix", "binSize"]
				properties: {
					timeFormat: type: "string"
					type: {
						type: "string"
						enum: ["heatmap"]
					}
					queries: {
						type: "array"
						items: $ref: "#/components/schemas/DashboardQuery"
					}
					colors: {
						description: "Colors define color encoding of data into a visualization"
						type:        "array"
						items: type: "string"
					}
					shape: {
						type: "string"
						enum: ["chronograf-v2"]
					}
					note: type: "string"
					showNoteWhenEmpty: {
						description: "If true, will display note when empty"
						type:        "boolean"
					}
					xColumn: type: "string"
					generateXAxisTicks: {
						type: "array"
						items: type: "string"
					}
					xTotalTicks: type: "integer"
					xTickStart: {
						type:   "number"
						format: "float"
					}
					xTickStep: {
						type:   "number"
						format: "float"
					}
					yColumn: type: "string"
					generateYAxisTicks: {
						type: "array"
						items: type: "string"
					}
					yTotalTicks: type: "integer"
					yTickStart: {
						type:   "number"
						format: "float"
					}
					yTickStep: {
						type:   "number"
						format: "float"
					}
					xDomain: {
						type: "array"
						items: type: "number"
						maxItems: 2
					}
					yDomain: {
						type: "array"
						items: type: "number"
						maxItems: 2
					}
					xAxisLabel: type:         "string"
					yAxisLabel: type:         "string"
					xPrefix: type:            "string"
					xSuffix: type:            "string"
					yPrefix: type:            "string"
					ySuffix: type:            "string"
					binSize: type:            "number"
					legendColorizeRows: type: "boolean"
					legendHide: type:         "boolean"
					legendOpacity: {
						type:   "number"
						format: "float"
					}
					legendOrientationThreshold: type: "integer"
				}
			}
			SingleStatViewProperties: {
				type: "object"
				required: ["type", "queries", "colors", "shape", "note", "showNoteWhenEmpty", "prefix", "tickPrefix", "suffix", "tickSuffix", "decimalPlaces"]
				properties: {
					type: {
						type: "string"
						enum: ["single-stat"]
					}
					queries: {
						type: "array"
						items: $ref: "#/components/schemas/DashboardQuery"
					}
					colors: {
						description: "Colors define color encoding of data into a visualization"
						type:        "array"
						items: $ref: "#/components/schemas/DashboardColor"
					}
					shape: {
						type: "string"
						enum: ["chronograf-v2"]
					}
					note: type: "string"
					showNoteWhenEmpty: {
						description: "If true, will display note when empty"
						type:        "boolean"
					}
					prefix: type:        "string"
					tickPrefix: type:    "string"
					suffix: type:        "string"
					tickSuffix: type:    "string"
					staticLegend: $ref:  "#/components/schemas/StaticLegend"
					decimalPlaces: $ref: "#/components/schemas/DecimalPlaces"
				}
			}
			HistogramViewProperties: {
				type: "object"
				required: ["type", "queries", "colors", "shape", "note", "showNoteWhenEmpty", "xColumn", "fillColumns", "xDomain", "xAxisLabel", "position", "binCount"]
				properties: {
					type: {
						type: "string"
						enum: ["histogram"]
					}
					queries: {
						type: "array"
						items: $ref: "#/components/schemas/DashboardQuery"
					}
					colors: {
						description: "Colors define color encoding of data into a visualization"
						type:        "array"
						items: $ref: "#/components/schemas/DashboardColor"
					}
					shape: {
						type: "string"
						enum: ["chronograf-v2"]
					}
					note: type: "string"
					showNoteWhenEmpty: {
						description: "If true, will display note when empty"
						type:        "boolean"
					}
					xColumn: type: "string"
					fillColumns: {
						type: "array"
						items: type: "string"
					}
					xDomain: {
						type: "array"
						items: {
							type:   "number"
							format: "float"
						}
					}
					xAxisLabel: type: "string"
					position: {
						type: "string"
						enum: ["overlaid", "stacked"]
					}
					binCount: type:           "integer"
					legendColorizeRows: type: "boolean"
					legendHide: type:         "boolean"
					legendOpacity: {
						type:   "number"
						format: "float"
					}
					legendOrientationThreshold: type: "integer"
				}
			}
			GaugeViewProperties: {
				type: "object"
				required: ["type", "queries", "colors", "shape", "note", "showNoteWhenEmpty", "prefix", "tickPrefix", "suffix", "tickSuffix", "decimalPlaces"]
				properties: {
					type: {
						type: "string"
						enum: ["gauge"]
					}
					queries: {
						type: "array"
						items: $ref: "#/components/schemas/DashboardQuery"
					}
					colors: {
						description: "Colors define color encoding of data into a visualization"
						type:        "array"
						items: $ref: "#/components/schemas/DashboardColor"
					}
					shape: {
						type: "string"
						enum: ["chronograf-v2"]
					}
					note: type: "string"
					showNoteWhenEmpty: {
						description: "If true, will display note when empty"
						type:        "boolean"
					}
					prefix: type:        "string"
					tickPrefix: type:    "string"
					suffix: type:        "string"
					tickSuffix: type:    "string"
					decimalPlaces: $ref: "#/components/schemas/DecimalPlaces"
				}
			}
			TableViewProperties: {
				type: "object"
				required: ["type", "queries", "colors", "shape", "note", "showNoteWhenEmpty", "tableOptions", "fieldOptions", "timeFormat", "decimalPlaces"]
				properties: {
					type: {
						type: "string"
						enum: ["table"]
					}
					queries: {
						type: "array"
						items: $ref: "#/components/schemas/DashboardQuery"
					}
					colors: {
						description: "Colors define color encoding of data into a visualization"
						type:        "array"
						items: $ref: "#/components/schemas/DashboardColor"
					}
					shape: {
						type: "string"
						enum: ["chronograf-v2"]
					}
					note: type: "string"
					showNoteWhenEmpty: {
						description: "If true, will display note when empty"
						type:        "boolean"
					}
					tableOptions: {
						type: "object"
						properties: {
							verticalTimeAxis: {
								description: "verticalTimeAxis describes the orientation of the table by indicating whether the time axis will be displayed vertically"
								type:        "boolean"
							}
							sortBy: $ref: "#/components/schemas/RenamableField"
							wrapping: {
								description: "Wrapping describes the text wrapping style to be used in table views"
								type:        "string"
								enum: ["truncate", "wrap", "single-line"]
							}
							fixFirstColumn: {
								description: "fixFirstColumn indicates whether the first column of the table should be locked"
								type:        "boolean"
							}
						}
					}
					fieldOptions: {
						description: "fieldOptions represent the fields retrieved by the query with customization options"
						type:        "array"
						items: $ref: "#/components/schemas/RenamableField"
					}
					timeFormat: {
						description: "timeFormat describes the display format for time values according to moment.js date formatting"
						type:        "string"
					}
					decimalPlaces: $ref: "#/components/schemas/DecimalPlaces"
				}
			}
			SimpleTableViewProperties: {
				type: "object"
				required: ["type", "showAll", "queries", "shape", "note", "showNoteWhenEmpty"]
				properties: {
					type: {
						type: "string"
						enum: ["simple-table"]
					}
					showAll: type: "boolean"
					queries: {
						type: "array"
						items: $ref: "#/components/schemas/DashboardQuery"
					}
					shape: {
						type: "string"
						enum: ["chronograf-v2"]
					}
					note: type: "string"
					showNoteWhenEmpty: {
						description: "If true, will display note when empty"
						type:        "boolean"
					}
				}
			}
			MarkdownViewProperties: {
				type: "object"
				required: ["type", "shape", "note"]
				properties: {
					type: {
						type: "string"
						enum: ["markdown"]
					}
					shape: {
						type: "string"
						enum: ["chronograf-v2"]
					}
					note: type: "string"
				}
			}
			CheckViewProperties: {
				type: "object"
				required: ["type", "shape", "checkID", "queries", "colors"]
				properties: {
					type: {
						type: "string"
						enum: ["check"]
					}
					shape: {
						type: "string"
						enum: ["chronograf-v2"]
					}
					checkID: type: "string"
					check: $ref:   "#/components/schemas/Check"
					queries: {
						type: "array"
						items: $ref: "#/components/schemas/DashboardQuery"
					}
					colors: {
						description: "Colors define color encoding of data into a visualization"
						type:        "array"
						items: $ref: "#/components/schemas/DashboardColor"
					}
					legendColorizeRows: type: "boolean"
					legendHide: type:         "boolean"
					legendOpacity: {
						type:   "number"
						format: "float"
					}
					legendOrientationThreshold: type: "integer"
				}
			}
			GeoViewLayer: {
				type: "object"
				oneOf: [{
					$ref: "#/components/schemas/GeoCircleViewLayer"
				}, {
					$ref: "#/components/schemas/GeoHeatMapViewLayer"
				}, {
					$ref: "#/components/schemas/GeoPointMapViewLayer"
				}, {
					$ref: "#/components/schemas/GeoTrackMapViewLayer"
				}]
			}
			GeoViewLayerProperties: {
				type: "object"
				required: ["type"]
				properties: type: {
					type: "string"
					enum: ["heatmap", "circleMap", "pointMap", "trackMap"]
				}
			}
			GeoCircleViewLayer: allOf: [{
				$ref: "#/components/schemas/GeoViewLayerProperties"
			}, {
				type: "object"
				required: ["radiusField", "radiusDimension", "colorField", "colorDimension", "colors"]
				properties: {
					radiusField: {
						type:        "string"
						description: "Radius field"
					}
					radiusDimension: $ref: "#/components/schemas/Axis"
					colorField: {
						type:        "string"
						description: "Circle color field"
					}
					colorDimension: $ref: "#/components/schemas/Axis"
					colors: {
						description: "Colors define color encoding of data into a visualization"
						type:        "array"
						items: $ref: "#/components/schemas/DashboardColor"
					}
					radius: {
						description: "Maximum radius size in pixels"
						type:        "integer"
					}
					interpolateColors: {
						description: "Interpolate circle color based on displayed value"
						type:        "boolean"
					}
				}
			}]
			GeoPointMapViewLayer: allOf: [{
				$ref: "#/components/schemas/GeoViewLayerProperties"
			}, {
				type: "object"
				required: ["colorField", "colorDimension", "colors"]
				properties: {
					colorField: {
						type:        "string"
						description: "Marker color field"
					}
					colorDimension: $ref: "#/components/schemas/Axis"
					colors: {
						description: "Colors define color encoding of data into a visualization"
						type:        "array"
						items: $ref: "#/components/schemas/DashboardColor"
					}
					isClustered: {
						description: "Cluster close markers together"
						type:        "boolean"
					}
					tooltipColumns: {
						description: "An array for which columns to display in tooltip"
						type:        "array"
						items: type: "string"
					}
				}
			}]
			GeoTrackMapViewLayer: {
				allOf: [{
					$ref: "#/components/schemas/GeoViewLayerProperties"
				}, {
					type: "object"
					required: ["trackWidth", "speed", "randomColors", "trackPointVisualization"]
				}]
				properties: {
					trackWidth: {
						description: "Width of the track"
						type:        "integer"
					}
					speed: {
						description: "Speed of the track animation"
						type:        "integer"
					}
					randomColors: {
						description: "Assign different colors to different tracks"
						type:        "boolean"
					}
					colors: {
						description: "Colors define color encoding of data into a visualization"
						type:        "array"
						items: $ref: "#/components/schemas/DashboardColor"
					}
				}
			}
			GeoHeatMapViewLayer: allOf: [{
				$ref: "#/components/schemas/GeoViewLayerProperties"
			}, {
				type: "object"
				required: ["intensityField", "intensityDimension", "radius", "blur", "colors"]
				properties: {
					intensityField: {
						type:        "string"
						description: "Intensity field"
					}
					intensityDimension: $ref: "#/components/schemas/Axis"
					radius: {
						description: "Radius size in pixels"
						type:        "integer"
					}
					blur: {
						description: "Blur for heatmap points"
						type:        "integer"
					}
					colors: {
						description: "Colors define color encoding of data into a visualization"
						type:        "array"
						items: $ref: "#/components/schemas/DashboardColor"
					}
				}
			}]
			GeoViewProperties: {
				type: "object"
				required: ["type", "shape", "queries", "note", "showNoteWhenEmpty", "center", "zoom", "allowPanAndZoom", "detectCoordinateFields", "layers"]
				properties: {
					type: {
						type: "string"
						enum: ["geo"]
					}
					queries: {
						type: "array"
						items: $ref: "#/components/schemas/DashboardQuery"
					}
					shape: {
						type: "string"
						enum: ["chronograf-v2"]
					}
					center: {
						description: "Coordinates of the center of the map"
						type:        "object"
						required: ["lat", "lon"]
						properties: {
							lat: {
								description: "Latitude of the center of the map"
								type:        "number"
								format:      "double"
							}
							lon: {
								description: "Longitude of the center of the map"
								type:        "number"
								format:      "double"
							}
						}
					}
					zoom: {
						description: "Zoom level used for initial display of the map"
						type:        "number"
						format:      "double"
						minimum:     1
						maximum:     28
					}
					allowPanAndZoom: {
						description: "If true, map zoom and pan controls are enabled on the dashboard view"
						type:        "boolean"
						default:     true
					}
					detectCoordinateFields: {
						description: "If true, search results get automatically regroupped so that lon,lat and value are treated as columns"
						type:        "boolean"
						default:     true
					}
					useS2CellID: {
						description: "If true, S2 column is used to calculate lat/lon"
						type:        "boolean"
					}
					s2Column: {
						description: "String to define the column"
						type:        "string"
					}
					latLonColumns: $ref: "#/components/schemas/LatLonColumns"
					mapStyle: {
						description: "Define map type - regular, satellite etc."
						type:        "string"
					}
					note: type: "string"
					showNoteWhenEmpty: {
						description: "If true, will display note when empty"
						type:        "boolean"
					}
					colors: {
						description: "Colors define color encoding of data into a visualization"
						type:        "array"
						items: $ref: "#/components/schemas/DashboardColor"
					}
					layers: {
						description: "List of individual layers shown in the map"
						type:        "array"
						items: $ref: "#/components/schemas/GeoViewLayer"
					}
				}
			}
			LatLonColumns: {
				description: "Object type to define lat/lon columns"
				type:        "object"
				required: ["lat", "lon"]
				properties: {
					lat: $ref: "#/components/schemas/LatLonColumn"
					lon: $ref: "#/components/schemas/LatLonColumn"
				}
			}
			LatLonColumn: {
				description: "Object type for key and column definitions"
				type:        "object"
				required: ["key", "column"]
				properties: {
					key: {
						description: "Key to determine whether the column is tag/field"
						type:        "string"
					}
					column: {
						description: "Column to look up Lat/Lon"
						type:        "string"
					}
				}
			}
			Axes: {
				description: "The viewport for a View's visualizations"
				type:        "object"
				required: ["x", "y"]
				properties: {
					x: $ref: "#/components/schemas/Axis"
					y: $ref: "#/components/schemas/Axis"
				}
			}
			StaticLegend: {
				description: "StaticLegend represents the options specific to the static legend"
				type:        "object"
				properties: {
					colorizeRows: type: "boolean"
					heightRatio: {
						type:   "number"
						format: "float"
					}
					show: type: "boolean"
					opacity: {
						type:   "number"
						format: "float"
					}
					orientationThreshold: type: "integer"
					valueAxis: type:            "string"
					widthRatio: {
						type:   "number"
						format: "float"
					}
				}
			}
			DecimalPlaces: {
				description: "Indicates whether decimal places should be enforced, and how many digits it should show."
				type:        "object"
				properties: {
					isEnforced: {
						description: "Indicates whether decimal point setting should be enforced"
						type:        "boolean"
					}
					digits: {
						description: "The number of digits after decimal to display"
						type:        "integer"
						format:      "int32"
					}
				}
			}
			ConstantVariableProperties: properties: {
				type: {
					type: "string"
					enum: ["constant"]
				}
				values: {
					type: "array"
					items: type: "string"
				}
			}
			MapVariableProperties: properties: {
				type: {
					type: "string"
					enum: ["map"]
				}
				values: {
					type: "object"
					additionalProperties: type: "string"
				}
			}
			QueryVariableProperties: properties: {
				type: {
					type: "string"
					enum: ["query"]
				}
				values: {
					type: "object"
					properties: {
						query: type:    "string"
						language: type: "string"
					}
				}
			}
			VariableProperties: {
				type: "object"
				oneOf: [{
					$ref: "#/components/schemas/QueryVariableProperties"
				}, {
					$ref: "#/components/schemas/ConstantVariableProperties"
				}, {
					$ref: "#/components/schemas/MapVariableProperties"
				}]
			}
			ViewProperties: oneOf: [{
				$ref: "#/components/schemas/LinePlusSingleStatProperties"
			}, {
				$ref: "#/components/schemas/XYViewProperties"
			}, {
				$ref: "#/components/schemas/SingleStatViewProperties"
			}, {
				$ref: "#/components/schemas/HistogramViewProperties"
			}, {
				$ref: "#/components/schemas/GaugeViewProperties"
			}, {
				$ref: "#/components/schemas/TableViewProperties"
			}, {
				$ref: "#/components/schemas/SimpleTableViewProperties"
			}, {
				$ref: "#/components/schemas/MarkdownViewProperties"
			}, {
				$ref: "#/components/schemas/CheckViewProperties"
			}, {
				$ref: "#/components/schemas/ScatterViewProperties"
			}, {
				$ref: "#/components/schemas/HeatmapViewProperties"
			}, {
				$ref: "#/components/schemas/MosaicViewProperties"
			}, {
				$ref: "#/components/schemas/BandViewProperties"
			}, {
				$ref: "#/components/schemas/GeoViewProperties"
			}]
			View: {
				required: ["name", "properties"]
				properties: {
					links: {
						type:     "object"
						readOnly: true
						properties: self: type: "string"
					}
					id: {
						readOnly: true
						type:     "string"
					}
					name: type:       "string"
					properties: $ref: "#/components/schemas/ViewProperties"
				}
			}
			Views: {
				type: "object"
				properties: {
					links: {
						type: "object"
						properties: self: type: "string"
					}
					views: {
						type: "array"
						items: $ref: "#/components/schemas/View"
					}
				}
			}
			CellUpdate: {
				type: "object"
				properties: {
					x: {
						type:   "integer"
						format: "int32"
					}
					y: {
						type:   "integer"
						format: "int32"
					}
					w: {
						type:   "integer"
						format: "int32"
					}
					h: {
						type:   "integer"
						format: "int32"
					}
				}
			}
			CreateCell: {
				type: "object"
				properties: {
					name: type: "string"
					x: {
						type:   "integer"
						format: "int32"
					}
					y: {
						type:   "integer"
						format: "int32"
					}
					w: {
						type:   "integer"
						format: "int32"
					}
					h: {
						type:   "integer"
						format: "int32"
					}
					usingView: {
						type:        "string"
						description: "Makes a copy of the provided view."
					}
				}
			}
			AnalyzeQueryResponse: {
				type: "object"
				properties: errors: {
					type: "array"
					items: {
						type: "object"
						properties: {
							line: type:      "integer"
							column: type:    "integer"
							character: type: "integer"
							message: type:   "string"
						}
					}
				}
			}
			CellWithViewProperties: {
				type: "object"
				allOf: [{
					$ref: "#/components/schemas/Cell"
				}, {
					type: "object"
					properties: {
						name: type:       "string"
						properties: $ref: "#/components/schemas/ViewProperties"
					}
				}]
			}
			Cell: {
				type: "object"
				properties: {
					id: type: "string"
					links: {
						type: "object"
						properties: {
							self: type: "string"
							view: type: "string"
						}
					}
					x: {
						type:   "integer"
						format: "int32"
					}
					y: {
						type:   "integer"
						format: "int32"
					}
					w: {
						type:   "integer"
						format: "int32"
					}
					h: {
						type:   "integer"
						format: "int32"
					}
					viewID: {
						type:        "string"
						description: "The reference to a view from the views API."
					}
				}
			}
			CellsWithViewProperties: {
				type: "array"
				items: $ref: "#/components/schemas/CellWithViewProperties"
			}
			Cells: {
				type: "array"
				items: $ref: "#/components/schemas/Cell"
			}
			Secrets: {
				additionalProperties: type: "string"
				example: apikey:            "abc123xyz"
			}
			SecretKeys: {
				type: "object"
				properties: secrets: {
					type: "array"
					items: type: "string"
				}
			}
			SecretKeysResponse: allOf: [{
				$ref: "#/components/schemas/SecretKeys"
			}, {
				type: "object"
				properties: links: {
					readOnly: true
					type:     "object"
					properties: {
						self: type: "string"
						org: type:  "string"
					}
				}
			}]
			CreateDashboardRequest: {
				properties: {
					orgID: {
						type:        "string"
						description: "The ID of the organization that owns the dashboard."
					}
					name: {
						type:        "string"
						description: "The user-facing name of the dashboard."
					}
					description: {
						type:        "string"
						description: "The user-facing description of the dashboard."
					}
				}
				required: ["orgID", "name"]
			}
			DashboardWithViewProperties: {
				type: "object"
				allOf: [{
					$ref: "#/components/schemas/CreateDashboardRequest"
				}, {
					type: "object"
					properties: {
						links: {
							type: "object"
							example: {
								self:    "/api/v2/dashboards/1"
								cells:   "/api/v2/dashboards/1/cells"
								owners:  "/api/v2/dashboards/1/owners"
								members: "/api/v2/dashboards/1/members"
								labels:  "/api/v2/dashboards/1/labels"
								org:     "/api/v2/labels/1"
							}
							properties: {
								self: $ref:    "#/components/schemas/Link"
								cells: $ref:   "#/components/schemas/Link"
								members: $ref: "#/components/schemas/Link"
								owners: $ref:  "#/components/schemas/Link"
								labels: $ref:  "#/components/schemas/Link"
								org: $ref:     "#/components/schemas/Link"
							}
						}
						id: {
							readOnly: true
							type:     "string"
						}
						meta: {
							type: "object"
							properties: {
								createdAt: {
									type:   "string"
									format: "date-time"
								}
								updatedAt: {
									type:   "string"
									format: "date-time"
								}
							}
						}
						cells: $ref:  "#/components/schemas/CellsWithViewProperties"
						labels: $ref: "#/components/schemas/Labels"
					}
				}]
			}
			Dashboard: {
				type: "object"
				allOf: [{
					$ref: "#/components/schemas/CreateDashboardRequest"
				}, {
					type: "object"
					properties: {
						links: {
							type: "object"
							example: {
								self:    "/api/v2/dashboards/1"
								cells:   "/api/v2/dashboards/1/cells"
								owners:  "/api/v2/dashboards/1/owners"
								members: "/api/v2/dashboards/1/members"
								labels:  "/api/v2/dashboards/1/labels"
								org:     "/api/v2/labels/1"
							}
							properties: {
								self: $ref:    "#/components/schemas/Link"
								cells: $ref:   "#/components/schemas/Link"
								members: $ref: "#/components/schemas/Link"
								owners: $ref:  "#/components/schemas/Link"
								labels: $ref:  "#/components/schemas/Link"
								org: $ref:     "#/components/schemas/Link"
							}
						}
						id: {
							readOnly: true
							type:     "string"
						}
						meta: {
							type: "object"
							properties: {
								createdAt: {
									type:   "string"
									format: "date-time"
								}
								updatedAt: {
									type:   "string"
									format: "date-time"
								}
							}
						}
						cells: $ref:  "#/components/schemas/Cells"
						labels: $ref: "#/components/schemas/Labels"
					}
				}]
			}
			Dashboards: {
				type: "object"
				properties: {
					links: $ref: "#/components/schemas/Links"
					dashboards: {
						type: "array"
						items: $ref: "#/components/schemas/Dashboard"
					}
				}
			}
			TelegrafRequest: {
				type: "object"
				properties: {
					name: type:        "string"
					description: type: "string"
					metadata: {
						type: "object"
						properties: buckets: {
							type: "array"
							items: type: "string"
						}
					}
					config: type: "string"
					orgID: type:  "string"
				}
			}
			Telegraf: {
				type: "object"
				allOf: [{
					$ref: "#/components/schemas/TelegrafRequest"
				}, {
					type: "object"
					properties: {
						id: {
							type:     "string"
							readOnly: true
						}
						links: {
							type:     "object"
							readOnly: true
							example: {
								self:    "/api/v2/telegrafs/1"
								lables:  "/api/v2/telegrafs/1/labels"
								owners:  "/api/v2/telegrafs/1/owners"
								members: "/api/v2/telegrafs/1/members"
							}
							properties: {
								self: $ref:    "#/components/schemas/Link"
								labels: $ref:  "#/components/schemas/Link"
								members: $ref: "#/components/schemas/Link"
								owners: $ref:  "#/components/schemas/Link"
							}
						}
						labels: {
							readOnly: true
							$ref:     "#/components/schemas/Labels"
						}
					}
				}]
			}
			Telegrafs: {
				type: "object"
				properties: configurations: {
					type: "array"
					items: $ref: "#/components/schemas/Telegraf"
				}
			}
			TelegrafPlugin: {
				type: "object"
				properties: {
					type: type:        "string"
					name: type:        "string"
					description: type: "string"
					config: type:      "string"
				}
			}
			TelegrafPlugins: {
				type: "object"
				properties: {
					version: type: "string"
					os: type:      "string"
					plugins: {
						type: "array"
						items: $ref: "#/components/schemas/TelegrafPlugin"
					}
				}
			}
			IsOnboarding: {
				type: "object"
				properties: allowed: {
					description: "True means that the influxdb instance has NOT had initial setup; false means that the database has been setup."
					type:        "boolean"
				}
			}
			PasswordResetBody: {
				properties: password: type: "string"
				required: ["password"]
			}
			AddResourceMemberRequestBody: {
				type: "object"
				properties: {
					id: type:   "string"
					name: type: "string"
				}
				required: ["id"]
			}
			Ready: {
				type: "object"
				properties: {
					status: {
						type: "string"
						enum: ["ready"]
					}
					started: {
						type:    "string"
						format:  "date-time"
						example: "2019-03-13T10:09:33.891196-04:00"
					}
					up: {
						type:    "string"
						example: "14m45.911966424s"
					}
				}
			}
			HealthCheck: {
				type: "object"
				required: ["name", "status"]
				properties: {
					name: type:    "string"
					message: type: "string"
					checks: {
						type: "array"
						items: $ref: "#/components/schemas/HealthCheck"
					}
					status: {
						type: "string"
						enum: ["pass", "fail"]
					}
					version: type: "string"
					commit: type:  "string"
				}
			}
			Labels: {
				type: "array"
				items: $ref: "#/components/schemas/Label"
			}
			Label: {
				type: "object"
				properties: {
					id: {
						readOnly: true
						type:     "string"
					}
					orgID: {
						readOnly: true
						type:     "string"
					}
					name: type: "string"
					properties: {
						type: "object"
						additionalProperties: type: "string"
						description: "Key/Value pairs associated with this label. Keys can be removed by sending an update with an empty value."
						example: {
							color:       "ffb3b3"
							description: "this is a description"
						}
					}
				}
			}
			LabelCreateRequest: {
				type: "object"
				required: ["orgID", "name"]
				properties: {
					orgID: type: "string"
					name: type:  "string"
					properties: {
						type: "object"
						additionalProperties: type: "string"
						description: "Key/Value pairs associated with this label. Keys can be removed by sending an update with an empty value."
						example: {
							color:       "ffb3b3"
							description: "this is a description"
						}
					}
				}
			}
			LabelUpdate: {
				type: "object"
				properties: {
					name: type: "string"
					properties: {
						type: "object"
						additionalProperties: type: "string"
						description: "Key/Value pairs associated with this label. Keys can be removed by sending an update with an empty value."
						example: {
							color:       "ffb3b3"
							description: "this is a description"
						}
					}
				}
			}
			LabelMapping: {
				type: "object"
				properties: labelID: type: "string"
			}
			LabelsResponse: {
				type: "object"
				properties: {
					labels: $ref: "#/components/schemas/Labels"
					links: $ref:  "#/components/schemas/Links"
				}
			}
			LabelResponse: {
				type: "object"
				properties: {
					label: $ref: "#/components/schemas/Label"
					links: $ref: "#/components/schemas/Links"
				}
			}
			ASTResponse: {
				description: "Contains the AST for the supplied Flux query"
				type:        "object"
				properties: ast: $ref: "#/components/schemas/Package"
			}
			WritePrecision: {
				type: "string"
				enum: ["ms", "s", "us", "ns"]
			}
			TaskCreateRequest: {
				type: "object"
				properties: {
					orgID: {
						description: "The ID of the organization that owns this Task."
						type:        "string"
					}
					org: {
						description: "The name of the organization that owns this Task."
						type:        "string"
					}
					status: $ref: "#/components/schemas/TaskStatusType"
					flux: {
						description: "The Flux script to run for this task."
						type:        "string"
					}
					description: {
						description: "An optional description of the task."
						type:        "string"
					}
				}
				required: ["flux"]
			}
			TaskUpdateRequest: {
				type: "object"
				properties: {
					status: $ref: "#/components/schemas/TaskStatusType"
					flux: {
						description: "The Flux script to run for this task."
						type:        "string"
					}
					name: {
						description: "Override the 'name' option in the flux script."
						type:        "string"
					}
					every: {
						description: "Override the 'every' option in the flux script."
						type:        "string"
					}
					cron: {
						description: "Override the 'cron' option in the flux script."
						type:        "string"
					}
					offset: {
						description: "Override the 'offset' option in the flux script."
						type:        "string"
					}
					description: {
						description: "An optional description of the task."
						type:        "string"
					}
				}
			}
			FluxResponse: {
				description: "Rendered flux that backs the check or notification."
				properties: flux: type: "string"
			}
			CheckPatch: {
				type: "object"
				properties: {
					name: type:        "string"
					description: type: "string"
					status: {
						type: "string"
						enum: ["active", "inactive"]
					}
				}
			}
			CheckDiscriminator: {
				oneOf: [{
					$ref: "#/components/schemas/DeadmanCheck"
				}, {
					$ref: "#/components/schemas/ThresholdCheck"
				}, {
					$ref: "#/components/schemas/CustomCheck"
				}]
				discriminator: {
					propertyName: "type"
					mapping: {
						deadman:   "#/components/schemas/DeadmanCheck"
						threshold: "#/components/schemas/ThresholdCheck"
						custom:    "#/components/schemas/CustomCheck"
					}
				}
			}
			Check: allOf: [{
				$ref: "#/components/schemas/CheckDiscriminator"
			}]
			PostCheck: allOf: [{
				$ref: "#/components/schemas/CheckDiscriminator"
			}]
			Checks: properties: {
				checks: {
					type: "array"
					items: $ref: "#/components/schemas/Check"
				}
				links: $ref: "#/components/schemas/Links"
			}
			CheckBase: {
				properties: {
					id: {
						readOnly: true
						type:     "string"
					}
					name: type: "string"
					orgID: {
						description: "The ID of the organization that owns this check."
						type:        "string"
					}
					taskID: {
						description: "The ID of the task associated with this check."
						type:        "string"
					}
					ownerID: {
						description: "The ID of creator used to create this check."
						type:        "string"
						readOnly:    true
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
					query: $ref:  "#/components/schemas/DashboardQuery"
					status: $ref: "#/components/schemas/TaskStatusType"
					description: {
						description: "An optional description of the check."
						type:        "string"
					}
					latestCompleted: {
						description: "Timestamp of latest scheduled, completed run, RFC3339."
						type:        "string"
						format:      "date-time"
						readOnly:    true
					}
					lastRunStatus: {
						readOnly: true
						type:     "string"
						enum: ["failed", "success", "canceled"]
					}
					lastRunError: {
						readOnly: true
						type:     "string"
					}
					labels: $ref: "#/components/schemas/Labels"
					links: {
						type:     "object"
						readOnly: true
						example: {
							self:    "/api/v2/checks/1"
							labels:  "/api/v2/checks/1/labels"
							members: "/api/v2/checks/1/members"
							owners:  "/api/v2/checks/1/owners"
							query:   "/api/v2/checks/1/query"
						}
						properties: {
							self: {
								description: "URL for this check"
								$ref:        "#/components/schemas/Link"
							}
							labels: {
								description: "URL to retrieve labels for this check"
								$ref:        "#/components/schemas/Link"
							}
							members: {
								description: "URL to retrieve members for this check"
								$ref:        "#/components/schemas/Link"
							}
							owners: {
								description: "URL to retrieve owners for this check"
								$ref:        "#/components/schemas/Link"
							}
							query: {
								description: "URL to retrieve flux script for this check"
								$ref:        "#/components/schemas/Link"
							}
						}
					}
				}
				required: ["name", "orgID", "query"]
			}
			ThresholdCheck: allOf: [{
				$ref: "#/components/schemas/CheckBase"
			}, {
				type: "object"
				required: ["type"]
				properties: {
					type: {
						type: "string"
						enum: ["threshold"]
					}
					thresholds: {
						type: "array"
						items: $ref: "#/components/schemas/Threshold"
					}
					every: {
						description: "Check repetition interval."
						type:        "string"
					}
					offset: {
						description: "Duration to delay after the schedule, before executing check."
						type:        "string"
					}
					tags: {
						description: "List of tags to write to each status."
						type:        "array"
						items: {
							type: "object"
							properties: {
								key: type:   "string"
								value: type: "string"
							}
						}
					}
					statusMessageTemplate: {
						description: "The template used to generate and write a status message."
						type:        "string"
					}
				}
			}]
			Threshold: {
				oneOf: [{
					$ref: "#/components/schemas/GreaterThreshold"
				}, {
					$ref: "#/components/schemas/LesserThreshold"
				}, {
					$ref: "#/components/schemas/RangeThreshold"
				}]
				discriminator: {
					propertyName: "type"
					mapping: {
						greater: "#/components/schemas/GreaterThreshold"
						lesser:  "#/components/schemas/LesserThreshold"
						range:   "#/components/schemas/RangeThreshold"
					}
				}
			}
			DeadmanCheck: allOf: [{
				$ref: "#/components/schemas/CheckBase"
			}, {
				type: "object"
				required: ["type"]
				properties: {
					type: {
						type: "string"
						enum: ["deadman"]
					}
					timeSince: {
						description: "String duration before deadman triggers."
						type:        "string"
					}
					staleTime: {
						description: "String duration for time that a series is considered stale and should not trigger deadman."
						type:        "string"
					}
					reportZero: {
						description: "If only zero values reported since time, trigger an alert"
						type:        "boolean"
					}
					level: $ref: "#/components/schemas/CheckStatusLevel"
					every: {
						description: "Check repetition interval."
						type:        "string"
					}
					offset: {
						description: "Duration to delay after the schedule, before executing check."
						type:        "string"
					}
					tags: {
						description: "List of tags to write to each status."
						type:        "array"
						items: {
							type: "object"
							properties: {
								key: type:   "string"
								value: type: "string"
							}
						}
					}
					statusMessageTemplate: {
						description: "The template used to generate and write a status message."
						type:        "string"
					}
				}
			}]
			CustomCheck: allOf: [{
				$ref: "#/components/schemas/CheckBase"
			}, {
				type: "object"
				properties: type: {
					type: "string"
					enum: ["custom"]
				}
				required: ["type"]
			}]
			ThresholdBase: properties: {
				level: $ref: "#/components/schemas/CheckStatusLevel"
				allValues: {
					description: "If true, only alert if all values meet threshold."
					type:        "boolean"
				}
			}
			GreaterThreshold: allOf: [{
				$ref: "#/components/schemas/ThresholdBase"
			}, {
				type: "object"
				required: ["type", "value"]
				properties: {
					type: {
						type: "string"
						enum: ["greater"]
					}
					value: {
						type:   "number"
						format: "float"
					}
				}
			}]
			LesserThreshold: allOf: [{
				$ref: "#/components/schemas/ThresholdBase"
			}, {
				type: "object"
				required: ["type", "value"]
				properties: {
					type: {
						type: "string"
						enum: ["lesser"]
					}
					value: {
						type:   "number"
						format: "float"
					}
				}
			}]
			RangeThreshold: allOf: [{
				$ref: "#/components/schemas/ThresholdBase"
			}, {
				type: "object"
				required: ["type", "min", "max", "within"]
				properties: {
					type: {
						type: "string"
						enum: ["range"]
					}
					min: {
						type:   "number"
						format: "float"
					}
					max: {
						type:   "number"
						format: "float"
					}
					within: type: "boolean"
				}
			}]
			CheckStatusLevel: {
				description: "The state to record if check matches a criteria."
				type:        "string"
				enum: ["UNKNOWN", "OK", "INFO", "CRIT", "WARN"]
			}
			RuleStatusLevel: {
				description: "The state to record if check matches a criteria."
				type:        "string"
				enum: ["UNKNOWN", "OK", "INFO", "CRIT", "WARN", "ANY"]
			}
			NotificationRuleUpdate: {
				type: "object"
				properties: {
					name: type:        "string"
					description: type: "string"
					status: {
						type: "string"
						enum: ["active", "inactive"]
					}
				}
			}
			NotificationRuleDiscriminator: {
				oneOf: [{
					$ref: "#/components/schemas/SlackNotificationRule"
				}, {
					$ref: "#/components/schemas/SMTPNotificationRule"
				}, {
					$ref: "#/components/schemas/PagerDutyNotificationRule"
				}, {
					$ref: "#/components/schemas/HTTPNotificationRule"
				}, {
					$ref: "#/components/schemas/TelegramNotificationRule"
				}]
				discriminator: {
					propertyName: "type"
					mapping: {
						slack:     "#/components/schemas/SlackNotificationRule"
						smtp:      "#/components/schemas/SMTPNotificationRule"
						pagerduty: "#/components/schemas/PagerDutyNotificationRule"
						http:      "#/components/schemas/HTTPNotificationRule"
						telegram:  "#/components/schemas/TelegramNotificationRule"
					}
				}
			}
			NotificationRule: allOf: [{
				$ref: "#/components/schemas/NotificationRuleDiscriminator"
			}]
			PostNotificationRule: allOf: [{
				$ref: "#/components/schemas/NotificationRuleDiscriminator"
			}]
			NotificationRules: properties: {
				notificationRules: {
					type: "array"
					items: $ref: "#/components/schemas/NotificationRule"
				}
				links: $ref: "#/components/schemas/Links"
			}
			NotificationRuleBase: {
				type: "object"
				required: ["orgID", "status", "name", "statusRules", "endpointID"]
				properties: {
					latestCompleted: {
						description: "Timestamp of latest scheduled, completed run, RFC3339."
						type:        "string"
						format:      "date-time"
						readOnly:    true
					}
					lastRunStatus: {
						readOnly: true
						type:     "string"
						enum: ["failed", "success", "canceled"]
					}
					lastRunError: {
						readOnly: true
						type:     "string"
					}
					id: {
						readOnly: true
						type:     "string"
					}
					endpointID: type: "string"
					orgID: {
						description: "The ID of the organization that owns this notification rule."
						type:        "string"
					}
					taskID: {
						description: "The ID of the task associated with this notification rule."
						type:        "string"
					}
					ownerID: {
						description: "The ID of creator used to create this notification rule."
						type:        "string"
						readOnly:    true
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
					status: $ref: "#/components/schemas/TaskStatusType"
					name: {
						description: "Human-readable name describing the notification rule."
						type:        "string"
					}
					sleepUntil: type: "string"
					every: {
						description: "The notification repetition interval."
						type:        "string"
					}
					offset: {
						description: "Duration to delay after the schedule, before executing check."
						type:        "string"
					}
					runbookLink: type: "string"
					limitEvery: {
						description: "Don't notify me more than <limit> times every <limitEvery> seconds. If set, limit cannot be empty."
						type:        "integer"
					}
					limit: {
						description: "Don't notify me more than <limit> times every <limitEvery> seconds. If set, limitEvery cannot be empty."
						type:        "integer"
					}
					tagRules: {
						description: "List of tag rules the notification rule attempts to match."
						type:        "array"
						items: $ref: "#/components/schemas/TagRule"
					}
					description: {
						description: "An optional description of the notification rule."
						type:        "string"
					}
					statusRules: {
						description: "List of status rules the notification rule attempts to match."
						type:        "array"
						minItems:    1
						items: $ref: "#/components/schemas/StatusRule"
					}
					labels: $ref: "#/components/schemas/Labels"
					links: {
						type:     "object"
						readOnly: true
						example: {
							self:    "/api/v2/notificationRules/1"
							labels:  "/api/v2/notificationRules/1/labels"
							members: "/api/v2/notificationRules/1/members"
							owners:  "/api/v2/notificationRules/1/owners"
							query:   "/api/v2/notificationRules/1/query"
						}
						properties: {
							self: {
								description: "URL for this endpoint."
								$ref:        "#/components/schemas/Link"
							}
							labels: {
								description: "URL to retrieve labels for this notification rule."
								$ref:        "#/components/schemas/Link"
							}
							members: {
								description: "URL to retrieve members for this notification rule."
								$ref:        "#/components/schemas/Link"
							}
							owners: {
								description: "URL to retrieve owners for this notification rule."
								$ref:        "#/components/schemas/Link"
							}
							query: {
								description: "URL to retrieve flux script for this notification rule."
								$ref:        "#/components/schemas/Link"
							}
						}
					}
				}
			}
			TagRule: {
				type: "object"
				properties: {
					key: type:   "string"
					value: type: "string"
					operator: {
						type: "string"
						enum: ["equal", "notequal", "equalregex", "notequalregex"]
					}
				}
			}
			StatusRule: {
				type: "object"
				properties: {
					currentLevel: $ref:  "#/components/schemas/RuleStatusLevel"
					previousLevel: $ref: "#/components/schemas/RuleStatusLevel"
					count: type:         "integer"
					period: type:        "string"
				}
			}
			HTTPNotificationRuleBase: {
				type: "object"
				required: ["type"]
				properties: {
					type: {
						type: "string"
						enum: ["http"]
					}
					url: type: "string"
				}
			}
			HTTPNotificationRule: allOf: [{
				$ref: "#/components/schemas/NotificationRuleBase"
			}, {
				$ref: "#/components/schemas/HTTPNotificationRuleBase"
			}]
			SlackNotificationRuleBase: {
				type: "object"
				required: ["type", "messageTemplate"]
				properties: {
					type: {
						type: "string"
						enum: ["slack"]
					}
					channel: type:         "string"
					messageTemplate: type: "string"
				}
			}
			SlackNotificationRule: allOf: [{
				$ref: "#/components/schemas/NotificationRuleBase"
			}, {
				$ref: "#/components/schemas/SlackNotificationRuleBase"
			}]
			SMTPNotificationRule: allOf: [{
				$ref: "#/components/schemas/NotificationRuleBase"
			}, {
				$ref: "#/components/schemas/SMTPNotificationRuleBase"
			}]
			SMTPNotificationRuleBase: {
				type: "object"
				required: ["type", "subjectTemplate", "to"]
				properties: {
					type: {
						type: "string"
						enum: ["smtp"]
					}
					subjectTemplate: type: "string"
					bodyTemplate: type:    "string"
					to: type:              "string"
				}
			}
			PagerDutyNotificationRule: allOf: [{
				$ref: "#/components/schemas/NotificationRuleBase"
			}, {
				$ref: "#/components/schemas/PagerDutyNotificationRuleBase"
			}]
			PagerDutyNotificationRuleBase: {
				type: "object"
				required: ["type", "messageTemplate"]
				properties: {
					type: {
						type: "string"
						enum: ["pagerduty"]
					}
					messageTemplate: type: "string"
				}
			}
			TelegramNotificationRule: allOf: [{
				$ref: "#/components/schemas/NotificationRuleBase"
			}, {
				$ref: "#/components/schemas/TelegramNotificationRuleBase"
			}]
			TelegramNotificationRuleBase: {
				type: "object"
				required: ["type", "messageTemplate", "channel"]
				properties: {
					type: {
						description: "The discriminator between other types of notification rules is \"telegram\"."
						type:        "string"
						enum: ["telegram"]
					}
					messageTemplate: {
						description: "The message template as a flux interpolated string."
						type:        "string"
					}
					parseMode: {
						description: "Parse mode of the message text per https://core.telegram.org/bots/api#formatting-options . Defaults to \"MarkdownV2\" ."
						type:        "string"
						enum: ["MarkdownV2", "HTML", "Markdown"]
					}
					disableWebPagePreview: {
						description: "Disables preview of web links in the sent messages when \"true\". Defaults to \"false\" ."
						type:        "boolean"
					}
				}
			}
			NotificationEndpointUpdate: {
				type: "object"
				properties: {
					name: type:        "string"
					description: type: "string"
					status: {
						type: "string"
						enum: ["active", "inactive"]
					}
				}
			}
			NotificationEndpointDiscriminator: {
				oneOf: [{
					$ref: "#/components/schemas/SlackNotificationEndpoint"
				}, {
					$ref: "#/components/schemas/PagerDutyNotificationEndpoint"
				}, {
					$ref: "#/components/schemas/HTTPNotificationEndpoint"
				}, {
					$ref: "#/components/schemas/TelegramNotificationEndpoint"
				}]
				discriminator: {
					propertyName: "type"
					mapping: {
						slack:     "#/components/schemas/SlackNotificationEndpoint"
						pagerduty: "#/components/schemas/PagerDutyNotificationEndpoint"
						http:      "#/components/schemas/HTTPNotificationEndpoint"
						telegram:  "#/components/schemas/TelegramNotificationEndpoint"
					}
				}
			}
			NotificationEndpoint: allOf: [{
				$ref: "#/components/schemas/NotificationEndpointDiscriminator"
			}]
			PostNotificationEndpoint: allOf: [{
				$ref: "#/components/schemas/NotificationEndpointDiscriminator"
			}]
			NotificationEndpoints: properties: {
				notificationEndpoints: {
					type: "array"
					items: $ref: "#/components/schemas/NotificationEndpoint"
				}
				links: $ref: "#/components/schemas/Links"
			}
			NotificationEndpointBase: {
				type: "object"
				required: ["type", "name"]
				properties: {
					id: type:     "string"
					orgID: type:  "string"
					userID: type: "string"
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
					description: {
						description: "An optional description of the notification endpoint."
						type:        "string"
					}
					name: type: "string"
					status: {
						description: "The status of the endpoint."
						default:     "active"
						type:        "string"
						enum: ["active", "inactive"]
					}
					labels: $ref: "#/components/schemas/Labels"
					links: {
						type:     "object"
						readOnly: true
						example: {
							self:    "/api/v2/notificationEndpoints/1"
							labels:  "/api/v2/notificationEndpoints/1/labels"
							members: "/api/v2/notificationEndpoints/1/members"
							owners:  "/api/v2/notificationEndpoints/1/owners"
						}
						properties: {
							self: {
								description: "URL for this endpoint."
								$ref:        "#/components/schemas/Link"
							}
							labels: {
								description: "URL to retrieve labels for this endpoint."
								$ref:        "#/components/schemas/Link"
							}
							members: {
								description: "URL to retrieve members for this endpoint."
								$ref:        "#/components/schemas/Link"
							}
							owners: {
								description: "URL to retrieve owners for this endpoint."
								$ref:        "#/components/schemas/Link"
							}
						}
					}
					type: $ref: "#/components/schemas/NotificationEndpointType"
				}
			}
			SlackNotificationEndpoint: {
				type: "object"
				allOf: [{
					$ref: "#/components/schemas/NotificationEndpointBase"
				}, {
					type: "object"
					properties: {
						url: {
							description: "Specifies the URL of the Slack endpoint. Specify either `URL` or `Token`."
							type:        "string"
						}
						token: {
							description: "Specifies the API token string. Specify either `URL` or `Token`."
							type:        "string"
						}
					}
				}]
			}
			PagerDutyNotificationEndpoint: {
				type: "object"
				allOf: [{
					$ref: "#/components/schemas/NotificationEndpointBase"
				}, {
					type: "object"
					required: ["routingKey"]
					properties: {
						clientURL: type:  "string"
						routingKey: type: "string"
					}
				}]
			}
			HTTPNotificationEndpoint: {
				type: "object"
				allOf: [{
					$ref: "#/components/schemas/NotificationEndpointBase"
				}, {
					type: "object"
					required: ["url", "authMethod", "method"]
					properties: {
						url: type:      "string"
						username: type: "string"
						password: type: "string"
						token: type:    "string"
						method: {
							type: "string"
							enum: ["POST", "GET", "PUT"]
						}
						authMethod: {
							type: "string"
							enum: ["none", "basic", "bearer"]
						}
						contentTemplate: type: "string"
						headers: {
							type:        "object"
							description: "Customized headers."
							additionalProperties: type: "string"
						}
					}
				}]
			}
			TelegramNotificationEndpoint: {
				type: "object"
				allOf: [{
					$ref: "#/components/schemas/NotificationEndpointBase"
				}, {
					type: "object"
					required: ["token", "channel"]
					properties: {
						token: {
							description: "Specifies the Telegram bot token. See https://core.telegram.org/bots#creating-a-new-bot ."
							type:        "string"
						}
						channel: {
							description: "ID of the telegram channel, a chat_id in https://core.telegram.org/bots/api#sendmessage ."
							type:        "string"
						}
					}
				}]
			}
			NotificationEndpointType: {
				type: "string"
				enum: ["slack", "pagerduty", "http", "telegram"]
			}
			DBRP: {
				type: "object"
				properties: {
					id: {
						type:        "string"
						description: "the mapping identifier"
						readOnly:    true
					}
					orgID: {
						type:        "string"
						description: "the organization ID that owns this mapping."
					}
					bucketID: {
						type:        "string"
						description: "the bucket ID used as target for the translation."
					}
					database: {
						type:        "string"
						description: "InfluxDB v1 database"
					}
					retention_policy: {
						type:        "string"
						description: "InfluxDB v1 retention policy"
					}
					default: {
						type:        "boolean"
						description: "Specify if this mapping represents the default retention policy for the database specificed."
					}
					links: $ref: "#/components/schemas/Links"
				}
				required: ["id", "orgID", "bucketID", "database", "retention_policy", "default"]
			}
			DBRPs: properties: content: {
				type: "array"
				items: $ref: "#/components/schemas/DBRP"
			}
			DBRPUpdate: properties: {
				retention_policy: {
					type:        "string"
					description: "InfluxDB v1 retention policy"
				}
				default: type: "boolean"
			}
			DBRPCreate: {
				type: "object"
				properties: {
					orgID: {
						type:        "string"
						description: "the organization ID that owns this mapping."
					}
					org: {
						type:        "string"
						description: "the organization that owns this mapping."
					}
					bucketID: {
						type:        "string"
						description: "the bucket ID used as target for the translation."
					}
					database: {
						type:        "string"
						description: "InfluxDB v1 database"
					}
					retention_policy: {
						type:        "string"
						description: "InfluxDB v1 retention policy"
					}
					default: {
						type:        "boolean"
						description: "Specify if this mapping represents the default retention policy for the database specificed."
					}
				}
				required: ["bucketID", "database", "retention_policy"]
			}
			DBRPGet: {
				type: "object"
				properties: content: {
					$ref:     "#/components/schemas/DBRP"
					required: true
				}
			}
			SchemaType: {
				type: "string"
				enum: ["implicit", "explicit"]
			}
			Authorization: {
				required: ["orgID", "permissions"]
				allOf: [{
					$ref: "#/components/schemas/AuthorizationUpdateRequest"
				}, {
					type: "object"
					properties: {
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
						orgID: {
							type:        "string"
							description: "ID of org that authorization is scoped to."
						}
						permissions: {
							type:        "array"
							minItems:    1
							description: "List of permissions for an auth.  An auth must have at least one Permission."
							items: $ref: "#/components/schemas/Permission"
						}
						id: {
							readOnly: true
							type:     "string"
						}
						token: {
							readOnly:    true
							type:        "string"
							description: "Passed via the Authorization Header and Token Authentication type."
						}
						userID: {
							readOnly:    true
							type:        "string"
							description: "ID of user that created and owns the token."
						}
						user: {
							readOnly:    true
							type:        "string"
							description: "Name of user that created and owns the token."
						}
						org: {
							readOnly:    true
							type:        "string"
							description: "Name of the org token is scoped to."
						}
						links: {
							type:     "object"
							readOnly: true
							example: {
								self: "/api/v2/authorizations/1"
								user: "/api/v2/users/12"
							}
							properties: {
								self: {
									readOnly: true
									$ref:     "#/components/schemas/Link"
								}
								user: {
									readOnly: true
									$ref:     "#/components/schemas/Link"
								}
							}
						}
					}
				}]
			}
			AuthorizationPostRequest: {
				required: ["orgID", "permissions"]
				allOf: [{
					$ref: "#/components/schemas/AuthorizationUpdateRequest"
				}, {
					type: "object"
					properties: {
						orgID: {
							type:        "string"
							description: "ID of org that authorization is scoped to."
						}
						userID: {
							type:        "string"
							description: "ID of user that authorization is scoped to."
						}
						permissions: {
							type:        "array"
							minItems:    1
							description: "List of permissions for an auth.  An auth must have at least one Permission."
							items: $ref: "#/components/schemas/Permission"
						}
					}
				}]
			}
			LegacyAuthorizationPostRequest: {
				required: ["orgID", "permissions"]
				allOf: [{
					$ref: "#/components/schemas/AuthorizationUpdateRequest"
				}, {
					type: "object"
					properties: {
						orgID: {
							type:        "string"
							description: "ID of org that authorization is scoped to."
						}
						userID: {
							type:        "string"
							description: "ID of user that authorization is scoped to."
						}
						token: {
							type:        "string"
							description: "Token (name) of the authorization"
						}
						permissions: {
							type:        "array"
							minItems:    1
							description: "List of permissions for an auth.  An auth must have at least one Permission."
							items: $ref: "#/components/schemas/Permission"
						}
					}
				}]
			}
			Authorizations: {
				type: "object"
				properties: {
					links: {
						readOnly: true
						$ref:     "#/components/schemas/Links"
					}
					authorizations: {
						type: "array"
						items: $ref: "#/components/schemas/Authorization"
					}
				}
			}
			Permission: {
				required: ["action", "resource"]
				properties: {
					action: {
						type: "string"
						enum: ["read", "write"]
					}
					resource: $ref: "#/components/schemas/Resource"
				}
			}
			Resource: {
				type: "object"
				required: ["type"]
				properties: {
					type: {
						type: "string"
						enum: ["authorizations", "buckets", "dashboards", "orgs", "sources", "tasks", "telegrafs", "users", "variables", "scrapers", "secrets", "labels", "views", "documents", "notificationRules", "notificationEndpoints", "checks", "dbrp", "notebooks", "annotations", "remotes", "replications"]
					}
					id: {
						type:        "string"
						description: "If ID is set that is a permission for a specific resource. if it is not set it is a permission for all resources of that resource type."
					}
					name: {
						type:        "string"
						description: "Optional name of the resource if the resource has a name field."
					}
					orgID: {
						type:        "string"
						description: "If orgID is set that is a permission for all resources owned my that org. if it is not set it is a permission for all resources of that resource type."
					}
					org: {
						type:        "string"
						description: "Optional name of the organization of the organization with orgID."
					}
				}
			}
			User: {
				properties: {
					id: {
						readOnly: true
						type:     "string"
					}
					oauthID: type: "string"
					name: type:    "string"
					status: {
						description: "If inactive the user is inactive."
						default:     "active"
						type:        "string"
						enum: ["active", "inactive"]
					}
				}
				required: ["name"]
			}
			Users: {
				type: "object"
				properties: {
					links: {
						type: "object"
						properties: self: {
							type:   "string"
							format: "uri"
						}
					}
					users: {
						type: "array"
						items: $ref: "#/components/schemas/UserResponse"
					}
				}
			}
			OnboardingRequest: {
				type: "object"
				properties: {
					username: type: "string"
					password: type: "string"
					org: type:      "string"
					bucket: type:   "string"
					retentionPeriodSeconds: {
						type:   "integer"
						format: "int64"
					}
					retentionPeriodHrs: {
						type:       "integer"
						deprecated: true
						description: """
							Retention period *in nanoseconds* for the new bucket. This key's name has been misleading since OSS 2.0 GA, please transition to use `retentionPeriodSeconds`

							"""
					}
					token: {
						type: "string"
						description: """
							Authentication token to set on the initial user. If not specified, the server will generate a token.

							"""
					}
				}
				required: ["username", "org", "bucket"]
			}
			OnboardingResponse: {
				type: "object"
				properties: {
					user: $ref:   "#/components/schemas/UserResponse"
					org: $ref:    "#/components/schemas/Organization"
					bucket: $ref: "#/components/schemas/Bucket"
					auth: $ref:   "#/components/schemas/Authorization"
				}
			}
			Variable: {
				type: "object"
				required: ["name", "orgID", "arguments"]
				properties: {
					links: {
						type:     "object"
						readOnly: true
						properties: {
							self: {
								type:   "string"
								format: "uri"
							}
							org: {
								type:   "string"
								format: "uri"
							}
							labels: {
								type:   "string"
								format: "uri"
							}
						}
					}
					id: {
						readOnly: true
						type:     "string"
					}
					orgID: type:       "string"
					name: type:        "string"
					description: type: "string"
					selected: {
						type: "array"
						items: type: "string"
					}
					labels: $ref:    "#/components/schemas/Labels"
					arguments: $ref: "#/components/schemas/VariableProperties"
					createdAt: {
						type:   "string"
						format: "date-time"
					}
					updatedAt: {
						type:   "string"
						format: "date-time"
					}
				}
			}
			Variables: {
				type: "object"
				example: variables: [{
					id:   "1221432"
					name: ":ok:"
					selected: ["hello"]
					arguments: {
						type: "constant"
						values: ["howdy", "hello", "hi", "yo", "oy"]
					}
				}, {
					id:   "1221432"
					name: ":ok:"
					selected: ["c"]
					arguments: {
						type: "map"
						values: {
							a: "fdjaklfdjkldsfjlkjdsa"
							b: "dfaksjfkljekfajekdljfas"
							c: "fdjksajfdkfeawfeea"
						}
					}
				}, {
					id:   "1221432"
					name: ":ok:"
					selected: ["host"]
					arguments: {
						type:     "query"
						query:    "from(bucket: \"foo\") |> showMeasurements()"
						language: "flux"
					}
				}]
				properties: variables: {
					type: "array"
					items: $ref: "#/components/schemas/Variable"
				}
			}
			Source: {
				type: "object"
				properties: {
					links: {
						type: "object"
						properties: {
							self: type:    "string"
							query: type:   "string"
							health: type:  "string"
							buckets: type: "string"
						}
					}
					id: type:      "string"
					orgID: type:   "string"
					default: type: "boolean"
					name: type:    "string"
					type: {
						type: "string"
						enum: ["v1", "v2", "self"]
					}
					url: {
						type:   "string"
						format: "uri"
					}
					insecureSkipVerify: type: "boolean"
					telegraf: type:           "string"
					token: type:              "string"
					username: type:           "string"
					password: type:           "string"
					sharedSecret: type:       "string"
					metaUrl: {
						type:   "string"
						format: "uri"
					}
					defaultRP: type: "string"
					languages: {
						type:     "array"
						readOnly: true
						items: {
							type: "string"
							enum: ["flux", "influxql"]
						}
					}
				}
			}
			Sources: {
				type: "object"
				properties: {
					links: {
						type: "object"
						properties: self: {
							type:   "string"
							format: "uri"
						}
					}
					sources: {
						type: "array"
						items: $ref: "#/components/schemas/Source"
					}
				}
			}
			ScraperTargetRequest: {
				type: "object"
				properties: {
					name: {
						type:        "string"
						description: "The name of the scraper target."
					}
					type: {
						type:        "string"
						description: "The type of the metrics to be parsed."
						enum: ["prometheus"]
					}
					url: {
						type:        "string"
						description: "The URL of the metrics endpoint."
						example:     "http://localhost:9090/metrics"
					}
					orgID: {
						type:        "string"
						description: "The organization ID."
					}
					bucketID: {
						type:        "string"
						description: "The ID of the bucket to write to."
					}
					allowInsecure: {
						type:        "boolean"
						description: "Skip TLS verification on endpoint."
						default:     false
					}
				}
			}
			ScraperTargetResponse: {
				type: "object"
				allOf: [{
					$ref: "#/components/schemas/ScraperTargetRequest"
				}, {
					type: "object"
					properties: {
						id: {
							type:     "string"
							readOnly: true
						}
						org: {
							type:        "string"
							description: "The name of the organization."
						}
						bucket: {
							type:        "string"
							description: "The bucket name."
						}
						links: {
							type:     "object"
							readOnly: true
							example: {
								self:         "/api/v2/scrapers/1"
								owners:       "/api/v2/scrapers/1/owners"
								members:      "/api/v2/scrapers/1/members"
								bucket:       "/api/v2/buckets/1"
								organization: "/api/v2/orgs/1"
							}
							properties: {
								self: $ref:         "#/components/schemas/Link"
								members: $ref:      "#/components/schemas/Link"
								owners: $ref:       "#/components/schemas/Link"
								bucket: $ref:       "#/components/schemas/Link"
								organization: $ref: "#/components/schemas/Link"
							}
						}
					}
				}]
			}
			ScraperTargetResponses: {
				type: "object"
				properties: configurations: {
					type: "array"
					items: $ref: "#/components/schemas/ScraperTargetResponse"
				}
			}
			MetadataBackup: {
				type: "object"
				properties: {
					kv: {
						type:   "string"
						format: "binary"
					}
					sql: {
						type:   "string"
						format: "binary"
					}
					buckets: $ref: "#/components/schemas/BucketMetadataManifests"
				}
				required: ["kv", "sql", "buckets"]
			}
			BucketMetadataManifests: {
				type: "array"
				items: $ref: "#/components/schemas/BucketMetadataManifest"
			}
			BucketMetadataManifest: {
				type: "object"
				properties: {
					organizationID: type:         "string"
					organizationName: type:       "string"
					bucketID: type:               "string"
					bucketName: type:             "string"
					description: type:            "string"
					defaultRetentionPolicy: type: "string"
					retentionPolicies: $ref:      "#/components/schemas/RetentionPolicyManifests"
				}
				required: ["organizationID", "organizationName", "bucketID", "bucketName", "defaultRetentionPolicy", "retentionPolicies"]
			}
			RetentionPolicyManifests: {
				type: "array"
				items: $ref: "#/components/schemas/RetentionPolicyManifest"
			}
			RetentionPolicyManifest: {
				type: "object"
				properties: {
					name: type:     "string"
					replicaN: type: "integer"
					duration: {
						type:   "integer"
						format: "int64"
					}
					shardGroupDuration: {
						type:   "integer"
						format: "int64"
					}
					shardGroups: $ref:   "#/components/schemas/ShardGroupManifests"
					subscriptions: $ref: "#/components/schemas/SubscriptionManifests"
				}
				required: ["name", "replicaN", "duration", "shardGroupDuration", "shardGroups", "subscriptions"]
			}
			ShardGroupManifests: {
				type: "array"
				items: $ref: "#/components/schemas/ShardGroupManifest"
			}
			ShardGroupManifest: {
				type: "object"
				properties: {
					id: {
						type:   "integer"
						format: "int64"
					}
					startTime: {
						type:   "string"
						format: "date-time"
					}
					endTime: {
						type:   "string"
						format: "date-time"
					}
					deletedAt: {
						type:   "string"
						format: "date-time"
					}
					truncatedAt: {
						type:   "string"
						format: "date-time"
					}
					shards: $ref: "#/components/schemas/ShardManifests"
				}
				required: ["id", "startTime", "endTime", "shards"]
			}
			ShardManifests: {
				type: "array"
				items: $ref: "#/components/schemas/ShardManifest"
			}
			ShardManifest: {
				type: "object"
				properties: {
					id: {
						type:   "integer"
						format: "int64"
					}
					shardOwners: $ref: "#/components/schemas/ShardOwners"
				}
				required: ["id", "shardOwners"]
			}
			ShardOwners: {
				type: "array"
				items: $ref: "#/components/schemas/ShardOwner"
			}
			ShardOwner: {
				type: "object"
				properties: nodeID: {
					type:        "integer"
					format:      "int64"
					description: "ID of the node that owns a shard."
				}
				required: ["nodeID"]
			}
			SubscriptionManifests: {
				type: "array"
				items: $ref: "#/components/schemas/SubscriptionManifest"
			}
			SubscriptionManifest: {
				type: "object"
				properties: {
					name: type: "string"
					mode: type: "string"
					destinations: {
						type: "array"
						items: type: "string"
					}
				}
				required: ["name", "mode", "destinations"]
			}
			RestoredBucketMappings: {
				type: "object"
				properties: {
					id: {
						description: "New ID of the restored bucket"
						type:        "string"
					}
					name: type:          "string"
					shardMappings: $ref: "#/components/schemas/BucketShardMappings"
				}
				required: ["id", "name", "shardMappings"]
			}
			BucketShardMappings: {
				type: "array"
				items: $ref: "#/components/schemas/BucketShardMapping"
			}
			BucketShardMapping: {
				type: "object"
				properties: {
					oldId: {
						type:   "integer"
						format: "int64"
					}
					newId: {
						type:   "integer"
						format: "int64"
					}
				}
				required: ["oldId", "newId"]
			}
		}
		responses: ServerError: {
			description: "Non 2XX error response from server."
			content: "application/json": schema: $ref: "#/components/schemas/Error"
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
					     --header "Authorization: Token INFLUX_API_TOKEN"`

					Replace *`INFLUX_API_TOKEN`* with your [InfluxDB API token](https://docs.influxdata.com/influxdb/v2.1/reference/glossary/#token).

					For more information and examples, see the following:
					  - [`/authorizations`](#tag/Authorizations) endpoint.
					  - [Authorize API requests](https://docs.influxdata.com/influxdb/v2.1/api-guide/api_intro/#authentication).
					  - [Manage API tokens](https://docs.influxdata.com/influxdb/v2.1/security/tokens).
					  - [Assign a token to a specific user](https://docs.influxdata.com/influxdb/v2.1/security/tokens/create-token).

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

					`curl --get "http://localhost:8086/query"
					      --user "1.x_USERNAME":"INFLUX_API_TOKEN"`

					#### 1.x password example

					`curl --get "http://localhost:8086/query"
					      --user "1.x_USERNAME":"1.x_PASSWORD"`

					Replace the following:
					- *`1.x_USERNAME`*: your InfluxDB v1.x username
					- *`1.x_PASSWORD`*: your InfluxDB v1.x password
					- *`INFLUX_API_TOKEN`*: your [InfluxDB API token](https://docs.influxdata.com/influxdb/v2.1/reference/glossary/#token)

					For more information and examples, see how to [authenticate with a username and password scheme](https://docs.influxdata.com/influxdb/v2.1/reference/api/influxdb-1x/)

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

					`curl --get "http://localhost:8086/query"
					      --data-urlencode "u=1.x_USERNAME"
					      --data-urlencode "p=INFLUX_API_TOKEN"`

					#### 1.x password example

					`curl --get "http://localhost:8086/query"
					      --data-urlencode "u=1.x_USERNAME"
					      --data-urlencode "p=1.x_PASSWORD"`

					Replace the following:
					- *`1.x_USERNAME`*: your InfluxDB v1.x username
					- *`1.x_PASSWORD`*: your InfluxDB v1.x password
					- *`INFLUX_API_TOKEN`*: your [InfluxDB API token](https://docs.influxdata.com/influxdb/v2.1/reference/glossary/#token)

					For more information and examples, see how to [authenticate with a username and password scheme](https://docs.influxdata.com/influxdb/v2.1/reference/api/influxdb-1x/)

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
