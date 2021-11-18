package commonschemas

VariableOrMemberAssignment: oneOf: [{
	$ref: "./VariableAssignment.yml"
}, {
	$ref: "./MemberAssignment.yml"
}]
