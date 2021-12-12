anscombe1 <- anscombe[c('x1','y1')]
anscombe2 <- anscombe[c('x2','y2')]
anscombe3 <- anscombe[c('x3','y3')]
anscombe4 <- anscombe[c('x4','y4')]
###
colnames(anscombe1) <- c('x','y')
colnames(anscombe2) <- c('x','y')
colnames(anscombe3) <- c('x','y')
colnames(anscombe4) <- c('x','y')

write.table(anscombe1,file = 'anscombe/data1.tsv',sep='\t')
write.table(anscombe2,file = 'anscombe/data2.tsv',sep='\t')
write.table(anscombe3,file = 'anscombe/data3.tsv',sep='\t')
write.table(anscombe4,file = 'anscombe/data4.tsv',sep='\t')


###


library(tidyverse)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, 
                           color = class,size=hwy),alpha=0.5) +
  ylab('miles per gallon (highway)') + 
  xlab('liters (engine displacement)') +
  ggtitle('Relationship between engine and mileage') + 
  #facet_grid(. ~ cyl) +
  theme_classic()

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = cyl, y = hwy),alpha=0.5) +
  #xlab('liters (engine displacement)') +
  xlab('cylinders') +
  ylab('miles per gallon (highway)') + 
  ggtitle('Relationship between engine and mileage') + 
  facet_grid(. ~ class) +
  theme_light()


ggplot(data = mpg,mapping = aes(x = displ, y = hwy, color = drv),alpha=0.5) + 
  geom_point() +
  geom_smooth() +
  ylab('miles per gallon (highway)') + 
  xlab('liters (engine displacement)') +
  ggtitle('Relationship between engine and mileage') + 

  theme_classic()



control <- rnorm(100,40,1)
treatmentA <- rnorm(100,40,1)*1.025
treatmentB <- rnorm(100,40,1)*1.2
data <- data.frame(control,treatmentA,treatmentB)
head(data)
boxplot(data)

library(reshape)
data_long <- melt(data)
head(data_long)

ggplot(data = data_long) + 
  geom_boxplot(aes(y = value,x=variable,color=variable)) +
  geom_jitter(aes(y = value,x=variable),size=0.5,alpha=0.5) +
  ylab('Intensity') + 
  xlab('Experiment') +
  ggtitle('Change in intensity due to treatment') + 
  theme_classic() +
  theme(axis.text.x=element_text(angle=45, hjust=1),legend.position = "none")


airquality

ggplot(data=airquality) +
  geom_point(aes(x=Temp,y=Wind)) +
  geom_smooth(aes(x=Temp,y=Wind),method='lm') +
  xlab('Temp (F)') +
  ylab('Wind (mph)') +
  ggtitle('Temperature vs Wind speed')





airquality$Date <- as.Date(paste("1973",airquality$Month,airquality$Day,sep="/"))
airquality_melt <- melt(airquality,id.vars = c('Month','Day','Date'))


aqr <- airquality_melt %>% filter(variable %in% c('Ozone','Temp'))

ggplot(aqr, aes(x = Date, y = value, group=Month,color=variable)) +
  geom_point(color='black',size=0.5) +
  geom_line() +
  facet_grid(variable ~ . ,scales = 'free_x') +
  theme_classic()
  NULL


ggplot(data = airquality) + 
  geom_line(aes(y = Ozone,x=Date)) +
  geom_point(aes(y = Ozone,x=Date)) +
  ylab('Intensity') + 
  xlab('Time') +
  ggtitle('Change of value over time') + 
  theme_bw()


ggplot(data=aqr) +
  geom_boxplot(aes(x=variable,y=value)) +
  theme_bw()

ggplot(data=aqr) +
  geom_histogram(aes(value,fill=variable),alpha=0.25) +
  facet_grid(Month ~ . ,scales = 'free_x') +
  theme_bw()


ggplot(data=aqr, mapping = aes(x=value,fill=variable)) +
  geom_density(aes(y=..count..),color='black',alpha=0) +
  geom_histogram(aes(y=..count..),alpha=0.15) +
  theme_bw()

############################################################

ts = read.csv('https://raw.githubusercontent.com/vincentarelbundock/Rdatasets/master/csv/datasets/AirPassengers.csv',row.names = 1)
head(ts)

ggplot(data = ts) + 
  geom_line(aes(y = value,x=time)) +
  geom_point(aes(y = value,x=time)) +
  ylab('Intensity') + 
  xlab('Time') +
  ggtitle('Change of value over time') + 
  theme_bw()


######

ggplot(data = diamonds) + 
  geom_bar(
    mapping = aes(x = cut, fill = cut), 
    show.legend = FALSE,
    width = 1
  ) + 
  theme(aspect.ratio = 1) +
  labs(x = NULL, y = NULL)


cut_diamonds_summ <- table(diamonds$cut)
barplot(cut_diamonds_summ)
pie(cut_diamonds_summ)
cut_diamonds_summDF = data.frame(cut_diamonds_summ)
colnames(cut_diamonds_summDF) <- c('Cut','Count')

cut_diamonds_summDF$Type = 'Cut'

library(RColorBrewer)


ggplot(data=cut_diamonds_summDF,mapping = aes(x=Cut,y=Count)) +
  scale_fill_brewer(palette = 'Pastel2') + 
  geom_bar(stat = "identity", position = "dodge") +
  geom_text(aes(label=Count,y=Count-900), size=3,color='white') +
  ggtitle('Total number of diamonds by cut') + 
  theme_classic() +
  theme(aspect.ratio=9/27) + 
  coord_flip()


ggplot(data=cut_diamonds_summDF,mapping = aes(x=Type,y=Count,fill=Cut)) +
  scale_fill_brewer(palette = 'Pastel2') + 
  geom_bar(stat = "identity", position = "stack") +
  theme_light() +
  theme(aspect.ratio=9/27) + 
  coord_flip()

  
pie(cut_diamonds_summ,col = brewer.pal(7,'Pastel2'))



