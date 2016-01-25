package managers

import (
	"fmt"
	"runtime"

	"github.com/d2r2/go-dht"
)

type TemperatureManager struct {
}

func (tm *TemperatureManager) Read() {
	sensorType := dht.DHT22

	var temperature, humidity float32
	var retried int
	var err error
	if runtime.GOARCH == "arm" {
		temperature, humidity, retried, err =
			dht.ReadDHTxxWithRetry(sensorType, 4, false, 10)
	} else {
		temperature = 10.1
		humidity = 45.2
		retried = 0
		err = nil
	}

	if err != nil {
		return
	}

	fmt.Printf("Sensor = %v: Temperature = %v*C, Humidity = %v%%, retried = %d times\n",
		sensorType, temperature, humidity, retried)
}
