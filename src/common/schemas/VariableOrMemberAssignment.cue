package schemas

VariableOrMemberAssignment: oneOf: [{
	$ref: "./VariableAssignment.yml"
}, {
	$ref: "./MemberAssignment.yml"
}]
