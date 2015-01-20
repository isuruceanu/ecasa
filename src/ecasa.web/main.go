package main

import(
	"github.com/go-martini/martini"
	"github.com/martini-contrib/render"
)

func main() {
	m := martini.Classic()
	m.Use(render.Renderer(render.Options{
		Layout: "layout",
	}))
	
		
	devices := Devices{
		Device{Id:1, Name:"Device1"},
		Device{Id:2, Name:"Device 2"},
		Device{Id:4, Name:"Device 4"},
	}
	
	m.Get("/", func(r render.Render) {
		r.HTML(200, "dashboard", nil)
	})
	
	m.Get("/devices", func(r render.Render){
		r.HTML(200, "devices", devices)
	})
	
	m.Run()
}