package commonschemas

ViewProperties: oneOf: [{
	LinePlusSingleStatProperties.#Ref
}, {
	XYViewProperties.#Ref
}, {
	SingleStatViewProperties.#Ref
}, {
	HistogramViewProperties.#Ref
}, {
	GaugeViewProperties.#Ref
}, {
	TableViewProperties.#Ref
}, {
	SimpleTableViewProperties.#Ref
}, {
	MarkdownViewProperties.#Ref
}, {
	CheckViewProperties.#Ref
}, {
	ScatterViewProperties.#Ref
}, {
	HeatmapViewProperties.#Ref
}, {
	MosaicViewProperties.#Ref
}, {
	BandViewProperties.#Ref
}, {
	GeoViewProperties.#Ref
}]
