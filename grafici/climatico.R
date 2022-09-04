pdf("climatico.pdf")
df <- as.data.frame(c('2022-08-22', '2022-08-23', '2022-08-24', '2022-08-25', '2022-08-26','2022-08-27','2022-08-28','2022-08-29','2022-08-30','2022-08-31','2022-09-01','2022-09-02','2022-09-03','2022-09-04','2022-09-05'))
colnames(df) <- c("giorni")
df$celsius <- c(26.78,23.66,22.76,22.19,19.76,26.61,21.8,23.3,23.3,20.7,19,27,25,23,22)
df$prec_mm <- c(0,0,0,0,2,3,3,4,3,2,0,1,1,0,0)
df$giorni<-as.Date.character(df$giorni)
library(ggplot2)
ggplot(data = df,aes(x = giorni, y = prec_mm, group = 1)) +
	 geom_bar(stat = "identity", color="blue", fill="blue", width =0.8) +
	 geom_line(mapping = aes(y = (celsius-10)/6), color="red", size=1) + # Scale data to match desired scale
	 scale_y_continuous("Precipitazioni [mm]",
         sec.axis = sec_axis(~ (.*6)+10, name = "Temperatura [°C]"))
	 dev.off()
