questo progetto è stato fatto con un sensore dht11,result.json è solamente un esempio dei dati che troverete esportando la chat in formato json 


usarlo è semplice,è sufficiente:

1)clonare la repository

2)cambiare i valori come il proprio ssid,la password,il token del vostro bot(che se non avete già creato basta crearlo con [BotFather](https://t.me/botfather)) ed il vostro chatid(che si puo' trovare col [RawDataBot](https://t.me/RawDataBot)) che si trovano sul file per arduino

3)caricare quel file sul vostro esp8266 usando ad esempio l'ide di arduino(sarà necessario scaricare anche la libreria per l'esp,ecco una [guida]( https://randomnerdtutorials.com/how-to-install-esp8266-board-arduino-ide/))

4)collegare ad una qualunque presa di alimentazione l'esp 

5)quando si avranno abbastanza dati si potrà andare nella chat del bot ed esportare la chat salvandola nella stessa cartella del parser col nome result.json
