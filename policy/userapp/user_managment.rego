package user_managment

membersOfGroup if {
	members := data.members[_]
	members.group_id == input.group.id
}

allow if {
	input.group.id == "1"
}