package controllers

import (
	"github.com/astaxie/beego"
)

type ErrorController struct {
	beego.Controller
}

func (er *ErrorController) Error404() {
	er.TplName = "error/404.html"
}
