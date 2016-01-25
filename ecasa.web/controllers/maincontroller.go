package controllers

import (
	"github.com/astaxie/beego"
)

type MainController struct {
	beego.Controller
}

func (c *MainController) ActiveContent(view string) {
	c.Layout = "layout.html"
	c.LayoutSections = make(map[string]string)
	c.LayoutSections["Header"] = "header.html"
	c.LayoutSections["Footer"] = "footer.html"

	c.TplName = view + ".html"
}
