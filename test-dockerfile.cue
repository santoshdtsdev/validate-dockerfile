[[{
	Cmd: "from"
	Flags: []
	JSON:   false
	Stage:  0
	SubCmd: ""
	Value: ["golang:1.19-alpine", "AS", "build"]
}, {
	Cmd: "workdir"
	Flags: []
	JSON:   false
	Stage:  0
	SubCmd: ""
	Value: [
		"/home",
	]
}, {
	Cmd: "copy"
	Flags: []
	JSON:   false
	Stage:  0
	SubCmd: ""
	Value: [
		"./pkg",
		".",
	]
}, {
	Cmd: "run"
	Flags: []
	JSON:   false
	Stage:  0
	SubCmd: ""
	Value: [
		"go mod download",
	]
}, {
	Cmd: "arg"
	Flags: []
	JSON:   false
	Stage:  0
	SubCmd: ""
	Value: [
		"COMMIT_SHA",
	]
}, {
	Cmd: "env"
	Flags: []
	JSON:   false
	Stage:  0
	SubCmd: ""
	Value: ["COMMIT_SHA", "$COMMIT_SHA"]
}, {
	Cmd: "run"
	Flags: []
	JSON:   false
	Stage:  0
	SubCmd: ""
	Value: ["go build -o bookstore -ldflags \"-X main.commitSHA=$(COMMIT_SHA)\""]
}, {
	Cmd: "run"
	Flags: []
	JSON:   false
	Stage:  0
	SubCmd: ""
	Value: [
		"echo ${COMMIT_SHA}",
	]
}, {
	Cmd: "expose"
	Flags: []
	JSON:   false
	Stage:  0
	SubCmd: ""
	Value: [
		"8080",
	]
}, {
	Cmd:    "comment"
	Flags:  null
	JSON:   false
	Stage:  1
	SubCmd: ""
	Value: [
		"# Deploy",
	]
}, {
	Cmd: "from"
	Flags: []
	JSON:   false
	Stage:  1
	SubCmd: ""
	Value: [
		"alpine:latest",
	]
}, {
	Cmd: "workdir"
	Flags: []
	JSON:   false
	Stage:  1
	SubCmd: ""
	Value: [
		"/root",
	]
}, {
	Cmd:    "comment"
	Flags:  null
	JSON:   false
	Stage:  1
	SubCmd: ""
	Value: [
		"COPY ./pkg/templates/. /root",
	]
}, {
	Cmd: "arg"
	Flags: []
	JSON:   false
	Stage:  1
	SubCmd: ""
	Value: [
		"COMMIT_SHA",
	]
}, {
	Cmd: "env"
	Flags: []
	JSON:   false
	Stage:  1
	SubCmd: ""
	Value: ["COMMIT_SHA", "$COMMIT_SHA"]
}, {
	Cmd: "copy"
	Flags: [
		"--from=build",
	]
	JSON:   false
	Stage:  1
	SubCmd: ""
	Value: ["/home/bookstore", "/root"]
}, {
	Cmd: "copy"
	Flags: [
		"--from=build",
	]
	JSON:   false
	Stage:  1
	SubCmd: ""
	Value: [
		"/home/main.go",
		"/root",
	]
}, {
	Cmd: "copy"
	Flags: [
		"--from=build",
	]
	JSON:   false
	Stage:  1
	SubCmd: ""
	Value: ["/home/image", "/root/image"]
}, {
	Cmd: "copy"
	Flags: [
		"--from=build",
	]
	JSON:   false
	Stage:  1
	SubCmd: ""
	Value: ["/home/templates/.", "/root/templates"]
}, {
	Cmd: "entrypoint"
	Flags: []
	JSON:   true
	Stage:  1
	SubCmd: ""
	Value: [
		"./bookstore",
	]
}]]
