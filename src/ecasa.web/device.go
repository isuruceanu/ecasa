package main

import (
	"fmt"
	"github.com/go-martini/martini"
	"github.com/martini-contrib/render"
	"strconv"
)

type device struct {
	Name   string `json:name`
	Id     int    `json:id`
	IpAddr string `json:ipaddr`
}

var devices = make([]device, 0)
var id = 0

func getNextId() int {
	id += 1
	return id
}

func getDeviceById(id int) (device, int) {
	for i, d := range devices {
		if d.Id == id {
			return d, i
		}
	}
	return device{}, -1
}

func DeviceController(r martini.Router) {
	r.Get("/", index)
	r.Post("/", add)
	r.Get("/:id", edit)
	r.Delete("/:id", removeDevice)
}

func add(r render.Render) {

}

func edit(r render.Render) {

}

func removeDevice(params martini.Params) {
	id, err := strconv.Atoi(params["id"])

	if err != nil {
		fmt.Sprintf("can not convert to int %s", params["id"])
	}

	_, idx := getDeviceById(id)
	if idx < 0 {
		//throw exception here
	}

	devices = append(devices[:idx], devices[idx+1:]...)
}

func index(r render.Render) {
	r.HTML(200, "devices", devices)
}
