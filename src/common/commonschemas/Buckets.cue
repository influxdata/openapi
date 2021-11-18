package commonschemas

Buckets: {
	type: "object"
	properties: {
		links: {
			readOnly: true
			Links.#Ref
		}
		buckets: {
			type: "array"
			items: Bucket.#Ref
		}
	}
}
