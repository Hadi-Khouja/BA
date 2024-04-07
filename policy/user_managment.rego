package user_managment
import rego.v1

membersOfGroup contains members if {
	members := data.members[_].group_id == input.group.id
}

allow contains members if {
	members := data.members[_]
}