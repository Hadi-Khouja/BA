package user_managment
import rego.v1

membersOfGroup contains member if {
	some member in data.members
	member.group_id == input.group.id
}

allow contains members if {
	members := data.members[_]
}