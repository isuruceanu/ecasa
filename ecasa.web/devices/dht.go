package devices

import (
	"errors"
	"fmt"
	"sync"
	"time"

	"github.com/kidoman/embd"
	_ "github.com/kidoman/embd/host/rpi"
)

type DHT struct {
	Pin         embd.DigitalPin
	initialized bool
	mu          sync.RWMutex
}

func (d *DHT) setup() error {
	d.mu.RLock()

	if d.initialized {
		d.mu.RUnlock()
		return nil
	}

	d.mu.RUnlock()
	d.mu.Lock()
	defer d.mu.Unlock()

	d.initialized = true
	return nil
}

func (d *DHT) Read() (temp, hum float64, err error) {
	if err = d.setup(); err != nil {
		return 0, 0, err
	}

	d.Pin.SetDirection(embd.Out)
	d.Pin.Write(embd.High)
	time.Sleep(10 * time.Microsecond)
	d.Pin.Write(embd.Low)
	time.Sleep(18 * time.Microsecond)
	d.Pin.Write(embd.High)
	time.Sleep(40 * time.Millisecond)
	//prepare to read data
	d.Pin.SetDirection(embd.In)

	//wait 40 miliseconds
	time.Sleep(40 * time.Millisecond)
	r, err := d.Pin.Read()

	if err != nil {
		return 0, 0, err
	}
	//sensor should pull line down to Ack
	if r != 0 {
		return 0, 0, errors.New("No DHT present")
	}
	// after 80 miliseconds sensor should pull line up
	time.Sleep(80 * time.Millisecond)

	r, err = d.Pin.Read()

	if err != nil {
		return 0, 0, err
	}

	if r != 1 {
		return 0, 0, errors.New("DHT Ack too long")
	}

	buf := make([]byte, 5)

	for i := 0; i < 40; i++ {
		t, err = d.Pin.TimePulse(embd.High)
		fmt.Println(err)
		fmt.Println(t)
	}
}

func main() {
	if err := embd.InitGPIO(); err != nil {
		panic(err)
	}
	defer embd.CloseGPIO()

	btn, err := embd.NewDigitalPin(4)
	if err != nil {
		panic(err)
	}
	defer btn.Close()

	dht := DHT{Pin: btn}

	t, h, err := dht.Read()

	fmt.Printf("t=%d, h=%d\n", t, h)
	fmt.Println(err)

}
