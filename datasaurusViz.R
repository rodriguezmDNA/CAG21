#install.packages('datasauRus')
library(datasauRus)
library(tidyverse)



set.seed(42)
circSub <- datasaurus_dozen_wide %>% select(circle_x,circle_y) %>% 
  sample_n(100,replace = F)
colnames(circSub) <- c("x","y")

unique(datasaurus_dozen$dataset)

dat <- datasaurus_dozen_wide %>% select(slant_down_x,slant_down_y)
colnames(dat) <- c("x","y")

ggplot(data=dat,aes(x=x,y = y)) +
  geom_point() + xlab("") + ylab("") +
  theme(text = element_text(size=20))

write.table(dat,file='challenges/challenge5.tsv',sep='\t')

dat = read.table('challenges/challenge6.tsv',sep='\t')
ggplot(data=dat,aes(x=x,y = y)) +
  geom_point() + xlab("") + ylab("") +
  theme(text = element_text(size=20))



gather(circSub) %>% group_by(key) %>% summarise(value=mean(value)) %>% ungroup() %>%
  ggplot(aes(x=key,y = value)) + 
  geom_bar(stat = "identity",width = 0.15) + xlab("") + ylab("") +
  theme(text = element_text(size=20)) +
  theme_classic()


circSub %>%
  ggplot(aes(x=x,y = y)) +
  geom_point() + xlab("x axis") + ylab("y axis") +
  ggtitle('datasaurus')


circSub %>%
  ggplot(aes(x=x,y = y)) +
  geom_point() + xlab("") + ylab("") +
  theme(text = element_text(size=20)) +
  theme_classic()

circSub %>%
  ggplot(aes(x=x,y = y)) +
  geom_point() + xlab("") + ylab("") +
  theme(text = element_text(size=20)) +
  theme_minimal()

circSub %>%
  ggplot(aes(x=x,y = y)) +
  geom_point() + xlab("x axis") + ylab("y axis") +
  ggtitle('datasaurus') +
  theme(text = element_text(size=20)) +
  theme_void()

