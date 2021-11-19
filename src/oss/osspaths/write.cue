package osspaths

import "github.com/influxdata/openapi/src/common/commonschemas"

import "github.com/influxdata/openapi/src/common/commonparameters"

import "github.com/influxdata/openapi/src/common/commonresponses"

write: post: {
	operationId: "PostWrite"
	tags: [
		"Write",
	]
	summary: "Write data"
	description: """
		Writes data to a bucket.

		To write data into InfluxDB, you need the following:
		- **organization** – _See [View organizations](\(#DocsURL)/organizations/view-orgs/#view-your-organization-id) for instructions on viewing your organization ID._
		- **bucket** – _See [View buckets](\(#DocsURL)/organizations/buckets/view-buckets/) for
		 instructions on viewing your bucket ID._
		- **API token** – _See [View tokens](\(#DocsURL)/security/tokens/view-tokens/)
		 for instructions on viewing your API token._
		- **InfluxDB URL** – _See [InfluxDB URLs](\(#DocsURL)/reference/urls/)_.
		- data in [line protocol](\(#DocsURL)/reference/syntax/line-protocol) format.

		For more information and examples, see the following:
		- [Write data with the InfluxDB API](\(#DocsURL)/write-data/developer-tools/api).
		- [Optimize writes to InfluxDB](\(#DocsURL)/write-data/best-practices/optimize-writes/).

		"""

	requestBody: {
		description:
			"Data in line protocol format.", required:
			true, content: "text/plain": schema: {
			type:   "string"
			format: "byte"
		}
	}, parameters: [{
		commonparameters.TraceSpan.#Ref
	}, {
		in:
			"header", name:
			"Content-Encoding", description:
			"""
				The value tells InfluxDB what compression is applied to the line protocol in the request payload.
				To make an API request with a GZIP payload, send `Content-Encoding: gzip` as a request header.

				"""

		schema: {
			type:        "string"
			description: "The header value specifies that the line protocol in the request body is encoded with gzip or not encoded with identity."
			default:     "identity"
			enum: [
				"gzip",
				"identity",
			]
		}
	}, {
		in:
			"header", name:
			"Content-Type", description:
			"The header value indicates the format of the data in the request body.", schema: {

			type: "string"
			description: """
				`text/plain` specifies line protocol. `UTF-8` is the default character set.

				"""

			default: "text/plain; charset=utf-8"
			enum: [
				"text/plain",
				"text/plain; charset=utf-8",
				"application/vnd.influx.arrow",
			]
		}
	}, {
		in:
			"header", name:
			"Content-Length", description:
			"The header value indicates the size of the entity-body, in bytes, sent to the database. If the length is greater than the database's `max body` configuration option, the server responds with status code `413`.", schema: {

			type:        "integer"
			description: "The length in decimal number of octets."
		}
	}, {
		in:
			"header", name:
			"Accept", description:
			"The header value specifies the response format.", schema: {

			type:        "string"
			description: "The response format for errors."
			default:     "application/json"
			enum: ["application/json"]
		}
	}, {
		in:
			"query", name:
			"org", description:
			"The parameter value specifies the destination organization for writes. The database writes all points in the batch to this organization. If you provide both `orgID` and `org` parameters, `org` takes precedence.", required:
			true, schema: {

			type:        "string"
			description: "Organization name or ID."
		}
	}, {
		in:
			"query", name:
			"orgID", description:
			"The parameter value specifies the ID of the destination organization for writes. If both `orgID` and `org` are specified, `org` takes precedence.", schema: type: "string"
	}, {
		in:
			"query", name:
			"bucket", description:
			"The destination bucket for writes.", required:
			true, schema: {

			type:        "string"
			description: "All points within batch are written to this bucket."
		}
	}, {
		in:
			"query", name:
			"precision", description:
			"The precision for the unix timestamps within the body line-protocol.", schema: commonschemas.WritePrecision.#Ref
	}], responses: {
		"204": description:
			"InfluxDB validated the request data format and accepted the data for writing to the bucket. `204` doesn't indicate a successful write operation since writes are asynchronous. See [how to check for write errors](\(#DocsURL)/write-data/troubleshoot)."
		"400": {
			description:
				"Bad request. The line protocol data in the request is malformed. The response body contains the first malformed line in the data. InfluxDB rejected the batch and did not write any data.", content: "application/json": {
				schema: commonschemas.LineProtocolError.#Ref
				examples: measurementSchemaFieldTypeConflict: {
					summary: "Example of a field type conflict thrown by an explicit bucket schema"
					value: {
						code:    "invalid"
						message: "partial write error (2 written): unable to parse 'air_sensor,service=S1,sensor=L1 temperature=\"90.5\",humidity=70.0 1632850122': schema: field type for field \"temperature\" not permitted by schema; got String but expected Float"
					}
				}
			}
		}
		"401": commonresponses.AuthorizationError
		"404": commonresponses.ResourceNotFoundError
		"413": {
			description:
				"""
					All request data was rejected and not written. InfluxDB OSS only returns this error if the [Go (golang) `ioutil.ReadAll()`](https://pkg.go.dev/io/ioutil#ReadAll) function raises an error.

					"""

			content: "application/json": schema: commonschemas.LineProtocolLengthError.#Ref
		}
		"500": commonresponses.InternalServerError
		"503": {
			description:
				"The server is temporarily unavailable to accept writes.  The `Retry-After` header describes when to try the write again.", headers: "Retry-After": {
				description: "A non-negative decimal integer indicating the seconds to delay after the response is received."
				schema: {
					type:   "integer"
					format: "int32"
				}
			}
		}
		default: commonresponses.ServerError.#Ref
	}
}
