package user_managment
import rego.v1

membersOfGroup contains member if {
	some member in data.members
	member[_].group_id == input.group.id
}

allow contains member if {
	some member in data.members
}