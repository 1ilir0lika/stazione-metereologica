pdf("istogramma.pdf")
library(ggplot2)
df <- data.frame(giorno=c('2022-08-22', '2022-08-23', '2022-08-24', '2022-08-25', '2022-08-26','2022-08-27','2022-08-28','2022-08-29','2022-08-30','2022-08-31','2022-09-01','2022-09-02','2022-09-03','2022-09-04','2022-09-05'),
	         valore=1:15,
	         err=rep(1,15))
ggplot(df) +
	    geom_bar(aes(x=as.Date.character(giorno), y=valore),stat='identity', fill='steelblue') +
	        geom_errorbar(aes(x=as.Date.character(giorno), ymin=valore-err, ymax=valore+err), width=0.4)
	dev.off()
