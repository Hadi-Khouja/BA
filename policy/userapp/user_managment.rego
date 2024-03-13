package user_managment

actions = [
	"create",
	"edit",
	"delete",
]

users := {x: check_rights_on_users(x) | x = actions[_]}

check_rights_on_users(action) = "allow" {
	input.user.roles[_] == "admin"
	not action == "delete"
}

check_rights_on_users(action) = "denied" {
	input.user.roles[_] == "admin"
	action == "delete"
}

check_rights_on_users(action) = "allow" {
	input.user.roles[_] == "editor"
}