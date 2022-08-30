df <- as.data.frame(c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"))
colnames(df) <- c("month")
df$month <- factor(df$month, levels = month.abb)
df$celsius <- c(-26.0, -24.5, -18.9, -9.8, -1.0, 7.0, 12.7, 12.3, 6.4, -1.2, -12.7, -21.9)
df$prec_mm <- c(18.7, 16.6, 18.1, 23.6, 30.0, 44.2, 59.8, 69.4, 69.9, 48.4, 35.5, 18.4)
library(ggplot2)
ggplot(data = df, mapping = aes(x = month, y = prec_mm, group = 1)) +
	 geom_bar(stat = "identity", color="blue", fill="blue", width = 0.5) +
	 geom_line(mapping = aes(y = celsius+30), color="red", size=1.5) + # Scale data to match desired scale
	 scale_y_continuous("Precipitation [mm]",
         sec.axis = sec_axis(~ . -30, name = "Temperature [°C]"))
