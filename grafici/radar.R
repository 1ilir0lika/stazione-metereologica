pdf('radar.pdf')
library(fmsb)
df <- data.frame(
                 N=c(100, 0, 0),
                 NE=c(100, 0, 0),
                 E=c(100, 0, 0),
                 SE=c(100, 0, 0),
                 S=c(100, 0, 0),
                 SO=c(100, 0, 52),
		 O=c(100, 0, 80),
                 NO=c(100, 0, 30)
)
radarchart(df,
	       axistype=1, 
	       apcol='pink',
	       pfcol=rgb(0.9,0.2,0.5,0.3),
	       plwd=3, 
	       cglcol='grey',
               cglty=1,
               axislabcol='grey',
	       cglwd=0.6,
	       vlcex=1.1
			           )
dev.off()
