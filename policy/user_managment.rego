package user_managment
import rego.v1

membersOfGroup contains member if {
	some member in data.members
	member.group_id == input.group.id
}

# Development Rights
documents contains {"filename": document.documemt_file_name, "type": document.documenttype, "read": true, "write": true} if {
	some document in data.documents
	document.documenttype in {"TechnicalSpecification", "MaintenanceReport"}
	input.user.groupname == "Development"
}

# Service contract
documents contains {"filename": document.documemt_file_name, "type": document.documenttype, "read": true, "write": false} if {
	some document in data.documents
	document.documenttype == "ServiceContract"
	input.user.groupname in {"Development", "Marketing", "Accounting" }
}

# Marketing Rights

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

# Management rights
documents contains {"filename": document.documemt_file_name, "type": document.documenttype, "read": true, "write": false} if {
	some document in data.documents
	document.documenttype in {"TechnicalSpecification", "Invoice", "MarketingPlan"}
	input.user.groupname == "Management"
}

documents contains {"filename": document.documemt_file_name, "type": document.documenttype, "read": right[0], "write": right[1]} if {
	some document in data.documents
	right := has_permission(document.documenttype, input.user.groupname)
}

has_permission(documenttype, "Management") := [true, false] if {
	documenttype in {"TechnicalSpecification", "Invoice", "MarketingPlan"}
}

has_permission(documenttype, "Management") := [true, true] if {
	documenttype == "ServiceContract"
}