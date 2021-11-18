package requestBodies

PinnedItemParams: {
	description: "Pinned Item record"
	required:    false
	content: "application/json": schema: $ref: "../schemas/pinnedItem.yml"
}
