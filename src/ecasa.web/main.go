package main

import(
	"github.com/go-martini/martini"
	"github.com/martini-contrib/render"
)

type Book struct{
	Title string
	Author string
	Id int32
}

type Books []Book

func main() {
	m := martini.Classic()
	m.Use(render.Renderer(render.Options{
		Layout: "layout",
	}))
	
		
	books := Books{
		Book{Title: "Title One", Author: "Morgan", Id:1},
		Book{Title: "Title Two", Author: "Adam Smith", Id:2},
		Book{Title: "Title Three", Author: "Adam Smith", Id:3},
	}
	
	m.Get("/", func(r render.Render) {
		r.HTML(200, "dashboard", nil)
	})
	
	m.Get("/books", func(r render.Render) {
		r.HTML(200, "books", books)
	})
	
	m.Run()
}