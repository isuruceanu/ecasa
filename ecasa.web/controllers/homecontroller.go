package controllers

type HomeController struct {
	MainController
}

func (home *HomeController) Get() {
	home.ActiveContent("home")
}
