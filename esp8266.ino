#include "CTBot.h"
#include "DHT.h"  
DHT dht2(2,DHT11);
CTBot myBot;

String ssid  = "......"; 
String pass  = "......"; 
String token = ".....";
String chatid = ".....";

void setup() {
  dht2.begin();
  Serial.begin(115200);
  Serial.println("Avviando il bot");
  myBot.wifiConnect(ssid, pass);
  myBot.setTelegramToken(token);
  if (myBot.testConnection())
    Serial.println("\ntestConnection OK");
  else
    Serial.println("\ntestConnection NOK");
}

void loop() {
   char rt[20];
   sprintf(rt, "temperatura : %0.2fC", dht2.readTemperature());
   char rh[20];
   sprintf(rh, "umidità : %0.2f%%", dht2.readHumidity());
   myBot.sendMessage(chatid,rt);
   myBot.sendMessage(chatid,rh);
  delay(600000);
}
