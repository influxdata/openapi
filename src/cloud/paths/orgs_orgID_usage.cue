package paths

orgs_orgID_usage: get: {
	tags: [
		"Usage",
	]
	summary: "Retrieve usage for an organization"
	parameters: [{
		in:          "path"
		name:        "orgID"
		description: "The identifier of the organization."
		required:    true
		schema: type: "string"
	}, {
		in:          "query"
		name:        "start"
		description: "start time"
		required:    true
		schema: type: "timestamp"
	}, {
		in:          "query"
		name:        "stop"
		description: "stop time"
		required:    false
		schema: type: "timestamp"
	}, {
		in:          "query"
		name:        "raw"
		description: "return raw usage data"
		required:    false
		schema: {
			type:    "boolean"
			default: false
		}
	}]
	responses: {
		"200": {
			description: "Usage data"
			headers: "Content-Encoding": {
				description: "Lists any encodings (usually compression algorithms) that have been applied to the response payload."
				schema: {
					type:        "string"
					description: "The content coding. `gzip` for compressed data or `identity` for unmodified, uncompressed data."
					default:     "identity"
					enum: [
						"gzip",
						"identity",
					]
				}
			}
			content: "text/csv": schema: {
				type: "string"
				example: """
					#group,false,false,true,true,false,false,true,true,true,true #datatype,string,long,dateTime:RFC3339,dateTime:RFC3339,dateTime:RFC3339,double,string,string,string,string #default,_result,,,,,,,,, ,result,table,_start,_stop,_time,_value,_field,_measurement,bucket_id,org_id ,,0,2021-05-10T14:25:10.865702397Z,2021-05-10T15:25:10.865702397Z,2021-05-10T15:00:00Z,5434066,gauge,storage_usage_bucket_bytes,2f6ba0cf9a2fdcbb,cec6fc1d2176dc11 ,,1,2021-05-10T14:25:10.865702397Z,2021-05-10T15:25:10.865702397Z,2021-05-10T15:00:00Z,9924053.966666665,gauge,storage_usage_bucket_bytes,8af67bcaf69d9daf,cec6fc1d2176dc11

					"""
			}
		}

		default: {
			description: "unexpected error"
			$ref:        "../../common/responses/ServerError.yml"
		}
	}
}
