package example.policy1

default allow := false

allow if {
	input.users[_].role == "admin"
}