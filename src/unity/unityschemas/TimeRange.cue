package unityschemas

TimeRange: {
	type:        "string"
	description: "The timerange options for usage information"
	enum: [
		"24h",
		"7d",
		"30d",
	]
	default: "24h"
}
