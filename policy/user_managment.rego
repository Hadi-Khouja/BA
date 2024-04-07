package user_managment
import rego.v1

membersOfGroup contains member if {
	some member in data.members
	member.group_id == input.group.id
}
# Development Rights
documents contains {"filename": document.documemt_file_name, "type": document.documenttype, "read": true, "write": true} if {
	some document in data.documents
	document.documenttype == "TechnicalSpecification"
	input.user.groupname == "Development"
}

documents contains {"filename": document.documemt_file_name, "type": document.documenttype, "read": true, "write": true} if {
	some document in data.documents
	document.documenttype == "MaintenanceReport"
	input.user.groupname == "Development"
}

documents contains {"filename": document.documemt_file_name, "type": document.documenttype, "read": true, "write": false} if {
	some document in data.documents
	document.documenttype == "ServiceContract"
	input.user.groupname == "Development"
}

# Marketing Rights
documents contains {"filename": document.documemt_file_name, "type": document.documenttype, "read": true, "write": false} if {
	some document in data.documents
	document.documenttype == "ServiceContract"
	input.user.groupname == "Marketing"
}

documents contains {"filename": document.documemt_file_name, "type": document.documenttype, "read": true, "write": true} if {
	some document in data.documents
	document.documenttype == "MarketingPlan"
	input.user.groupname == "Marketing"
}

# Accounting rights
documents contains {"filename": document.documemt_file_name, "type": document.documenttype, "read": true, "write": true} if {
	some document in data.documents
	document.documenttype == "Invoice"
	input.user.groupname == "Accounting"
}

documents contains {"filename": document.documemt_file_name, "type": document.documenttype, "read": true, "write": false} if {
	some document in data.documents
	document.documenttype == "MarketingPlan"
	input.user.groupname == "Accounting"
}

documents contains {"filename": document.documemt_file_name, "type": document.documenttype, "read": true, "write": false} if {
	some document in data.documents
	document.documenttype == "ServiceContract"
	input.user.groupname == "Accounting"
}

# Management rights
documents contains {"filename": document.documemt_file_name, "type": document.documenttype, "read": true, "write": false} if {
	some document in data.documents
	document.documenttype == "Invoice"
	input.user.groupname == "Management"
}

documents contains {"filename": document.documemt_file_name, "type": document.documenttype, "read": true, "write": false} if {
	some document in data.documents
	document.documenttype == "MarketingPlan"
	input.user.groupname == "Management"
}

documents contains {"filename": document.documemt_file_name, "type": document.documenttype, "read": true, "write": true} if {
	some document in data.documents
	document.documenttype == "ServiceContract"
	input.user.groupname == "Management"
}

documents contains {"filename": document.documemt_file_name, "type": document.documenttype, "read": true, "write": false} if {
	some document in data.documents
	document.documenttype == "TechnicalSpecification"
	input.user.groupname == "Management"
}