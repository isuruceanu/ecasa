package models

import (
	"time"

	"github.com/astaxie/beego/orm"
)

type TempLocation int

const (
	LeavingRoom TempLocation = iota
	Outdoor
)

type Temperature struct {
	Id          int       `orm:"auto"`
	When        time.Time `orm:"auto_now;type(datetime)"`
	Where       TempLocation
	Temperature float64
	Humidity    float64
}

func init() {
	orm.RegisterModel(new(Temperature))
}
