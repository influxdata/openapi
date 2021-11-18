package commonschemas

Axes: {
	description: "The viewport for a View's visualizations"
	type:        "object"
	required: ["x", "y"]
	properties: {
		x: Axis.#Ref
		y: {// Quoted to prevent YAML parser from interpreting y as shorthand for true.
			Axis.#Ref
		}
	}
}
