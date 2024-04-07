package user_managment
import rego.v1
import data.custom_documents.custom_permission

membersOfGroup contains member if {
	some member in data.members
	member.group_id == input.group.id
}

# check for custom policies
documents contains {"filename": document.documemt_file_name, "type": document.documenttype, "read": right[0], "write": right[1]} if {
	some document in data.documents
	right := custom_permission(document.id, input.user.id)
	right != has_permission(document.documenttype, input.user.groupname)
}

# Generates Response
documents contains {"filename": document.documemt_file_name, "type": document.documenttype, "read": right[0], "write": right[1]} if {
	some document in data.documents
	right := has_permission(document.documenttype, input.user.groupname)
}

# Service contract
has_permission("ServiceContract", group) := [true, false] if {
	group in {"Development", "Marketing", "Accounting" }
}

# Development Rights
has_permission(documenttype, "Development") := [true, true] if {
	documenttype in {"TechnicalSpecification", "MaintenanceReport"}
}

# Accounting Rights
has_permission(documenttype, "Accounting") := [true, true] if {
	documenttype == "Invoice"
}

has_permission(documenttype, "Accounting") := [true, false] if {
	documenttype == "MarketingPlan"
}

# Marketing Rights
has_permission(documenttype, "Marketing") := [true, true] if {
	documenttype == "MarketingPlan"
}

# Management Rights
has_permission(documenttype, "Management") := [true, true] if {
	documenttype == "ServiceContract"
}

has_permission(documenttype, "Management") := [true, false] if {
	documenttype in {"TechnicalSpecification", "Invoice", "MarketingPlan"}
}