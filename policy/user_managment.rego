package user_managment
import rego.v1

membersOfGroup contains members if {
	members := data.members[_]
	members.group_id == input.group.id
}