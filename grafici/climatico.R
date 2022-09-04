df <- as.data.frame(c('2022-08-22', '2022-08-23', '2022-08-24', '2022-08-25', '2022-08-26','2022-08-27','2022-08-28','2022-08-29','2022-08-30','2022-08-31','2022-09-01','2022-09-02','2022-09-03','2022-09-04','2022-09-05'))
colnames(df) <- c("giorni")
df$celsius <- c(1:15)
df$prec_mm <- c(1:15)
df$giorni<-as.Date.character(df$giorni)
library(ggplot2)
ggplot(data = df,aes(x = giorni, y = prec_mm, group = 1)) +
	 geom_bar(stat = "identity", color="blue", fill="blue", width = 0.5) +
	 geom_line(mapping = aes(y = celsius+30), color="red", size=1.5) + # Scale data to match desired scale
	 scale_y_continuous("Precipitazioni [mm]",
         sec.axis = sec_axis(~ . -30, name = "Temperatura [°C]"))
