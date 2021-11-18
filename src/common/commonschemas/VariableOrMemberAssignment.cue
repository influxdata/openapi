package commonschemas

VariableOrMemberAssignment: oneOf: [{
	VariableAssignment.#Ref
}, {
	MemberAssignment.#Ref
}]
