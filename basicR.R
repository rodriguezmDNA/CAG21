### R as a calculator

1 + 2
4-2
2 * 2
8/4

2**4


### But also handles other types of data

# character = collection of characters
print('hello world!')

# numeric, to make math operations
print( 4 * 2)

# vector (or collection)
print( c(1,2,3) )

# data frame (table), a collection of vectors
data.frame(  'name'=c('a','b','c'),
            'col_1'=c(1,2,3),
            'col_2'=c(4,5,6))

### Variables: can store values/data types

# as opposed to a constant, that has a fixed value:
pi
letters
month.name

x
x = 5
x
x = 'a'
x

# Reading data in R

# Directly from a delimited file online https://raw.githubusercontent.com/vincentarelbundock/Rdatasets/master/csv/datasets/AirPassengers.csv
ts = read.csv('https://raw.githubusercontent.com/vincentarelbundock/Rdatasets/master/csv/datasets/AirPassengers.csv',row.names = 1)
head(ts)

# Or from a local file (in your computer)
absentAtWork = read.csv('Absenteeism_at_work_AAA/Absenteeism_at_work.csv',sep=';')

length(ts)
dim(ts)
ncol(ts)
nrow(ts)

head(ts)
tail(ts)


anscombe1 = read.table('anscombe/data1.tsv')
anscombe2 = read.table('anscombe/data2.tsv')

dim(anscombe1)
head(anscombe1)

summary(anscombe1)
summary(anscombe2)

### Installing and loading libraries
# A library is a package or collection of code that performs specific functions on top of base R
#install.packages('ggplot2')
library(ggplot2)


head(anscombe1)

ggplot() + 
  geom_point(data=anscombe1, aes(x=x,y=y))



ansc <- read.delim('anscombe/anscQuartet.tsv',sep='\t')

### Canvas
ggplot() + 
  # Type of plot
  geom_point(data=ansc, aes(x=x,y=y,shape=data,color=data)) + 
  scale_color_brewer(palette = 'Set1') +
  xlab('x axis label') +
  ylab('y axis label') +
  ggtitle('a descriptive title') + 
  facet_wrap(data~.,nrow = 2) + 
  theme_light()
