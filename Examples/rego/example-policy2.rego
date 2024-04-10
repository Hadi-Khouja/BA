package example.policy2

default allow := false

allow contains user.name if {
	user := input.users[_]
	user.role == "admin"
}