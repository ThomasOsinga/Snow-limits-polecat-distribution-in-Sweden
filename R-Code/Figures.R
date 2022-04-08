#Plots
mynamestheme <- theme(
  plot.title = element_text(family = "Helvetica", face = "bold", size = (60)),
  axis.title = element_text(family = "Helvetica", size = (20)),
  axis.text = element_text(family = "Courier", size = (20))
)
Coniferousplot <- ggplot(Coniferoustotal, aes(x))+
  geom_line(aes(y=y1, color = "Individual runs"))+
  geom_line(aes(y=y2, color = "Individual runs"))+
  geom_line(aes(y=y3, color = "Individual runs"))+
  geom_line(aes(y=y4, color = "Individual runs"))+
  geom_line(aes(y=y5, color = "Individual runs"))+
  geom_line(aes(y=y6, color = "Individual runs"))+
  geom_line(aes(y=y7, color = "Individual runs"))+
  geom_line(aes(y=y8, color = "Individual runs"))+
  geom_line(aes(y=y9, color = "Individual runs"))+
  geom_line(aes(y=y10, color = "Individual runs"))+
  geom_line(aes(y=Mean, color = "Mean"),size=2)+
  xlab('Proportion Coniferous forest')+
  ylab('Predicted suitability')+
  theme_classic()+
  theme(legend.position="none")+
  ggtitle("B")+
  scale_color_manual(values= c('Grey','Blue', 'Red'))

Coniferousplot
print(Coniferousplot + mynamestheme)

Humanfootprintplot <- ggplot(Humanfootprinttotal, aes(x))+
  geom_line(aes(y=y1, color = "Individual runs"))+
  geom_line(aes(y=y2, color = "Individual runs"))+
  geom_line(aes(y=y3, color = "Individual runs"))+
  geom_line(aes(y=y4, color = "Individual runs"))+
  geom_line(aes(y=y5, color = "Individual runs"))+
  geom_line(aes(y=y6, color = "Individual runs"))+
  geom_line(aes(y=y7, color = "Individual runs"))+
  geom_line(aes(y=y8, color = "Individual runs"))+
  geom_line(aes(y=y9, color = "Individual runs"))+
  geom_line(aes(y=y10, color = "Individual runs"))+
  geom_line(aes(y=Mean, color = "Mean"),size=2)+
  xlab('Human footprint index')+
  ylab('Predicted suitability')+
  theme_classic()+
  ggtitle("C")+
  theme(legend.position="none")+
  scale_color_manual(values= c('Grey','Blue', 'Red'))

Humanfootprintplot
print(Humanfootprintplot + mynamestheme)

Openlandscapeplot <- ggplot(Openlandscapetotal, aes(x))+
  geom_line(aes(y=y1, color = "Individual runs"))+
  geom_line(aes(y=y2, color = "Individual runs"))+
  geom_line(aes(y=y3, color = "Individual runs"))+
  geom_line(aes(y=y4, color = "Individual runs"))+
  geom_line(aes(y=y5, color = "Individual runs"))+
  geom_line(aes(y=y6, color = "Individual runs"))+
  geom_line(aes(y=y7, color = "Individual runs"))+
  geom_line(aes(y=y8, color = "Individual runs"))+
  geom_line(aes(y=y9, color = "Individual runs"))+
  geom_line(aes(y=y10, color = "Individual runs"))+
  geom_line(aes(y=Mean, color = "Mean"),size=2)+
  xlab('Proportion openlandscape')+
  ylab('Predicted suitability')+
  theme_classic()+
  ggtitle("D")+
  theme(legend.position="none")+
  scale_color_manual(values= c('Grey','Blue', 'Red'))

Openlandscapeplot
print(Openlandscapeplot + mynamestheme)

Snowdaysplot <- ggplot(Snowdaystotal, aes(x))+
  geom_line(aes(y=y1, color = "Individual runs"))+
  geom_line(aes(y=y2, color = "Individual runs"))+
  geom_line(aes(y=y3, color = "Individual runs"))+
  geom_line(aes(y=y4, color = "Individual runs"))+
  geom_line(aes(y=y5, color = "Individual runs"))+
  geom_line(aes(y=y6, color = "Individual runs"))+
  geom_line(aes(y=y7, color = "Individual runs"))+
  geom_line(aes(y=y8, color = "Individual runs"))+
  geom_line(aes(y=y9, color = "Individual runs"))+
  geom_line(aes(y=y10, color = "Individual runs"))+
  geom_line(aes(y=Mean, color = "Mean"),size=2)+
  xlab('Number of snowdays')+
  ylab('Predicted suitability')+
  theme_classic()+
  ggtitle("A")+
  theme(legend.position="none")+
  scale_color_manual(values= c('Grey','Blue', 'Red'))

Snowdaysplot
print(Snowdaysplot + mynamestheme)

Waterplot <- ggplot(Watertotal, aes(x))+
  geom_line(aes(y=y1, color = "Individual runs"))+
  geom_line(aes(y=y2, color = "Individual runs"))+
  geom_line(aes(y=y3, color = "Individual runs"))+
  geom_line(aes(y=y4, color = "Individual runs"))+
  geom_line(aes(y=y5, color = "Individual runs"))+
  geom_line(aes(y=y6, color = "Individual runs"))+
  geom_line(aes(y=y7, color = "Individual runs"))+
  geom_line(aes(y=y8, color = "Individual runs"))+
  geom_line(aes(y=y9, color = "Individual runs"))+
  geom_line(aes(y=y10, color = "Individual runs"))+
  geom_line(aes(y=Mean, color = "Mean"),size=2)+
  xlab('Water availability')+
  ylab('Predicted suitability')+
  theme_classic()+
  ggtitle("G")+
  theme(legend.position="none")+
  scale_color_manual(values= c('Grey','Blue', 'Red'))

Waterplot
print(Waterplot + mynamestheme)

Soilmoistureplot <- ggplot(Soilmoisturetotal, aes(x))+
  geom_line(aes(y=y1, color = "Individual runs"))+
  geom_line(aes(y=y2, color = "Individual runs"))+
  geom_line(aes(y=y3, color = "Individual runs"))+
  geom_line(aes(y=y4, color = "Individual runs"))+
  geom_line(aes(y=y5, color = "Individual runs"))+
  geom_line(aes(y=y6, color = "Individual runs"))+
  geom_line(aes(y=y7, color = "Individual runs"))+
  geom_line(aes(y=y8, color = "Individual runs"))+
  geom_line(aes(y=y9, color = "Individual runs"))+
  geom_line(aes(y=y10, color = "Individual runs"))+
  geom_line(aes(y=Mean, color = "Mean"),size=2)+
  xlab('Proportion Soilmoisture')+
  ylab('Predicted suitability')+
  theme_classic()+
  theme(legend.position="none")+
  ggtitle("B")+
  scale_color_manual(values= c('Grey','Blue', 'Red'))

Soilmoistureplot
print(Soilmoistureplot + mynamestheme)
