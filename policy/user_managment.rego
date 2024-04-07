package user_managment
import rego.v1

members := [member | 
	some member
    member := data.members[_]
    member.group_id == input.group.id
]

membersOfGroup contains member if {
	some member in data.members
	member[_].group_id == input.group.id
}

allow contains member if {
	some member in data.members
}