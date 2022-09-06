questo progetto è stato fatto con un sensore dht11,result.json è solamente un esempio dei dati che troverete esportando la chat in formato json 

----------------------------------
**come usarlo?**
usarlo è semplice,è sufficiente:

1)clonare la repository
`git clone https://github.com/1ilir0lika/stazione-metereologica`

2)cambiare i valori come il proprio ssid,la password,il token del vostro bot(che se non avete già creato basta crearlo con [BotFather](https://t.me/botfather)) ed il vostro chatid(che si puo' trovare con [RawDataBot](https://t.me/RawDataBot)) che si trovano sul file per arduino

3)caricare quel file sul vostro esp8266 usando ad esempio l'ide di arduino(sarà necessario scaricare anche la libreria per l'esp,ecco una [guida]( https://randomnerdtutorials.com/how-to-install-esp8266-board-arduino-ide/))

4)collegare ad una qualunque presa di alimentazione l'esp 

5)quando si avranno abbastanza dati si potrà andare nella chat del bot ed esportare la chat salvandola nella stessa cartella dello script che analizzera i dati(analyzer.pl o analyzer.php) col nome result.json

6)successivamente basterà eseguire uno dei due script che analizza i dati coi comandi
`php analyzer.php`
o
`perl analyzer.pl` 

----------------------------------

**scelte di design**
analyzer.pl sebbene sia di qualche microsecondo più veloce è meno leggibile,inoltre consiglio di usare direttamente quello in php perchè dovreste scaricare una dipendenza per il file in perl utilizzando cpan o un suo derivato,questo codice non era pensato per esser condiviso quindi non è bene documentato coi commenti
