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
	
	go h.run()
	
	m.Get("/", func(r render.Render) {
		
		r.HTML(200, "dashboard", "21")
	})
	
	m.Get("/ws", wsHandler)
	
	m.Group("/devices", DeviceController)

	m.Run()
}