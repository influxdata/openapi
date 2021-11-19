package cloudschemas

DemoDataBuckets: {
	type: "object"
	properties: {
		links: {
			readOnly: true
			$ref:     "../../common/schemas/Links.yml"
		}
		buckets: {
			type: "array"
			items: $ref: "./DemoDataBucket.yml"
		}
	}
}
