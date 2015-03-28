#include <manchester.h>

#define TX_PIN 8
#define RX_PIN 2

Manchester *manchester;

uint8_t data[4] = {0x00, 0x11, 0x00, 0x00}; //Write DWH temperature

void setup() 
{
  Serial.begin(9600);
  Serial.println("Start test programm");
       
  manchester = new Manchester(TX_PIN, RX_PIN); 
/*
  data[0] = 0x10; // W
  data[1] = 0x39; // 57 cmd
  data[2] = 0x2A; //42 gr C
  data[3] = 0x00;
  
  manchester->Send(data, (uint8_t)4, true);
  delay(1000);
  
  
  data[0] = 0x80;
  data[1] = 0x11;
  data[2] = 0x00;
  data[3] = 0x00;
  */
}

void loop() 
{
  
    if (manchester->GetStatus() == Manchester::Idle)
    {
      Serial.println("Send command");
      manchester->Send(data, (uint8_t)4, true);
    }

//      manchester->StartRead((uint8_t)16);
//    manchester->ShowStatus();
//    manchester->GetReadData();

 /*   
    if (manchester->GetStatus() == Manchester::ReadingTimeout || manchester->GetStatus() == Manchester::ReadingReady)
    {
      manchester->GetReadData();
      Serial.println("--reset to idle -----");
      manchester->SetIdle();
    }
  */
    delay(1000);
}


void ShowStatus()
{
   switch(manchester->GetStatus())
   {
      case Manchester::Idle:
       Serial.println("Idle");
       break;
      case Manchester::CommandSent:
      	Serial.println("CommandSent") ;
      	break;
      case Manchester::Sending:
        Serial.println("Sending");
        break;
      case Manchester::Reading:
      	Serial.println("Reading");
      	break;
      case Manchester::ReadingTimeout:
      	Serial.println("Reading timeout");
      	break;
      case Manchester::ReadingReady:
      	Serial.println("Reading ready");
      	break;
   }
}


ISR(PCINT0_vect){
    manchester->OnPinChangeInterrupt();
}


ISR(TIMER2_COMPA_vect)
{
  manchester->OnTimerMatchInterrupt(); 
}
