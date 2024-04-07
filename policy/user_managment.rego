package user_managment
import rego.v1

members := [member | some member in data.members; member.group_id == "1"]

membersOfGroup contains member if {
	some member in data.members
	id := member[_].group_id
	id == input.group.id
}

allow contains member if {
	some member in data.members
	member.group_id == "1"
}