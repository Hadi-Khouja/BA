package user_managment
import rego.v1

membersOfGroup(group_id) contains member if {
	some member in data.members
	member.group_id == group_id
}

groups contains group if {
	some i in data.groups
	group := {"group_id" : i.group_id, "name": i.name, "members": membersOfGroup(i.group_id)}
}