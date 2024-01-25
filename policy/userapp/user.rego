package user

default allow := false

allow := true {
    input.user.roles[_] == "Admin"
}