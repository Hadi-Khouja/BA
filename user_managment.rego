package user_managment

actions = [
	"create",
	"modify",
	"delete",
]

users := {x: check_rights_on_users(x) | x = actions[_]}

groups := {y: check_rights_on_group(y) | y = actions[_]}

check_rights_on_users(action) = "allow" {
	input.user.roles[_] == "admin"
	not action == "delete"
}

check_rights_on_users(action) = "undefined" {
	input.user.roles[_] == "admin"
	action == "delete"
}

check_rights_on_group(action) = "undefined" {
	input.user.roles[_] == "admin"
	not action == "create"
}

check_rights_on_group(action) = "denied" {
	input.user.roles[_] == "admin"
	action == "create"
}

allow {
	1 == 1
}