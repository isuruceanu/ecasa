#include <OpenTherm.h>
#include <Dhcp.h>
#include <Dns.h>
#include <Ethernet.h>
#include <EthernetClient.h>
#include <util.h>
#include <SPI.h>
#include <EEPROM.h>
#include <SM.h>
#include <WebSocketClient.h>

#define APP_SETTINGS_START 32

//OpenTherm data.
#define RX 3
#define TX 4
OpenTherm ot(RX,TX);


struct AppSettings {
   float roomTemperature; //desired room temperature
   float flameModulation; //default flame modulation
   byte mac[6];            // default MAC address
   char *server;          // default WebSocket server to communicate with
   uint16_t port;
   char *webScoketPath;
} settings = {
  20.0, //default desired room temperature
  50.0, // default flame modulation
  {0x0, 0xA2, 0xDA, 0x0D, 0x90, 0xE2 }, //default MAC address
  "192.168.11.55", //default server IP
  3223, //default server port
  "/boiler"
};


//SM stateMachine();
EthernetClient client;
WebSocketClient webSocketClient;

void setup() {
  Serial.begin(9600);
  Serial.println("Starting termostat ...");
  
  if (Ethernet.begin(settings.mac) == 0){
    Serial.println("Error: Failed to configure Ethernet using DHCP");
    while(true) {} //hang on 
  }
  
  delay(100);
  
  Serial.print("Connecting to server:");
    Serial.print(settings.server); 
    Serial.print(":");
    Serial.println(settings.port);
  
  if (client.connect(settings.server, settings.port)){
    Serial.println("Connected");
  }
  else{
    Serial.println("Failed to connect.");
    while(true) {};
  }
  
  
  
}

void loop() {
  // put your main code here, to run repeatedly:

}




void writeSettings(){
   for(uint8_t i=0; i < sizeof(settings); i++) {
     EEPROM.write(APP_SETTINGS_START + i, *((char*)&settings + i));
   }
}

void readSettings() {
  for(uint8_t i=0; i < sizeof(settings); i++) {
    *((char*)&settings + i) = EEPROM.read(APP_SETTINGS_START + i);
  }
}

ISR(PCINT0_vect){
    ot.extIntHandler();
}

ISR(PCINT1_vect){
    ot.extIntHandler();
}

ISR(PCINT2_vect){
    ot.extIntHandler();
}

ISR(TIMER2_COMPA_vect){
    ot.timer2CompAHandler();
}

ISR(TIMER2_COMPB_vect){
    ot.timer2CompBHandler();
}
