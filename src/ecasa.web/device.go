package main

import(
	"github.com/go-martini/martini"
	"github.com/martini-contrib/render"
)

type Device struct{
	Name 		string		`json:name`
	Id			int			`json:id`
}

type Devices []Device



func DeviceController(r martini.Router){
	r.Get("/", Index)
}

func Index(r render.Render){

	devices := Devices{
		Device{Id:1, Name:"Device1"},
		Device{Id:2, Name:"Device 2"},
		Device{Id:4, Name:"Device 4"},
	}

	r.HTML(200, "devices", devices)
}