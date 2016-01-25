package main

import (
	"fmt"
	"time"

	"ecasa/ecasa.web/managers"
	_ "ecasa/ecasa.web/routers"
	"github.com/astaxie/beego"

	"github.com/astaxie/beego/orm"
	_ "github.com/mattn/go-sqlite3"

	_ "ecasa/ecasa.web/models"
)

func init() {
	orm.RegisterDriver("sqlite", orm.DRSqlite)
	orm.RegisterDataBase("default", "sqlite3", "ecasa.db")
	name := "default"
	force := false
	verbose := true
	err := orm.RunSyncdb(name, force, verbose)
	if err != nil {
		fmt.Println(err)
	}
}

func main() {
	go readTemp()
	beego.Run()
}

func readTemp() {
	tempManager := managers.TemperatureManager{}
	for {

		tempManager.Read()
		time.Sleep(15 * time.Second)
	}
}
