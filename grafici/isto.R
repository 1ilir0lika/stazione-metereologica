pdf("istogramma.pdf")
library(ggplot2)
df <- data.frame(giorno=c('A', 'B', 'C', 'D', 'E'),
	         valore=c(12, 17, 30, 22, 19),
	         err=c(4, 5, 7, 4, 2))
ggplot(df) +
	    geom_bar(aes(x=giorno, y=valore), stat='identity', fill='steelblue') +
	        geom_errorbar(aes(x=giorno, ymin=valore-err, ymax=valore+err), width=0.4)
	dev.off()
