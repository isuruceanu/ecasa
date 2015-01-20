package main

type Device struct{
	Name 		string		`json:name`
	Id			int			`json:id`
}

type Devices []Device