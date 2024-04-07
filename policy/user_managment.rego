package user_managment
import rego.v1

membersOfGroup contains member if {
	some member in data.members
	member.group_id == input.group.id
}

documents contains {"filename": document.documemt_file_name, "read": true, "write": true} if {
	some document in data.documents
	document.documenttype == "TechnicalSpecification"
	input.user.group == "Development"
}