package user_managment
import rego.v1

membersOfGroup contains member if {
	some member in data.members
	member.group_id == input.group.id
}

documents contains {"document": document, "read": true, "write": true} if {
	some document in data.documents
	document.documentType == "TechnicalSpecification"
	input.user.group == "Development"
}