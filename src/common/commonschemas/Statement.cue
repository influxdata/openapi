package commonschemas

Statement: oneOf: [{
	BadStatement.#Ref
}, {
	VariableAssignment.#Ref
}, {
	MemberAssignment.#Ref
}, {
	ExpressionStatement.#Ref
}, {
	ReturnStatement.#Ref
}, {
	OptionStatement.#Ref
}, {
	BuiltinStatement.#Ref
}, {
	TestStatement.#Ref
}]
