package user_managment
import rego.v1

membersOfGroup contains member if {
	some member in data.members
	id := member.group_id
	id == input.group.id
}

allow contains member if {
	some member in data.members
}