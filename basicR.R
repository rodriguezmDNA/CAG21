### R as a calculator

1 + 2
4-2
2 * 2
8/4
2**4


### But also handles other types of data

# numeric, to make math operations
4 * 2

# character = collection of characters
"hello world!"
hello


# vector (or collection)
c(1,2,3) 

# data frame (table), a collection of vectors
data.frame(  "name"=c("a","b","c"),
             "col_1"=c(1,2,3),
             "col_2"=c(4,5,6))

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

data = read.table('https://raw.githubusercontent.com/rodriguezmDNA/CAG21/main/data/data1.tsv')

dim(data)
nrow(data)
ncol(data)
head(data)
summary(data)


### Installing and loading libraries
# A library is a package or collection of code that performs specific functions on top of base R
#install.packages('ggplot2')
library(ggplot2)


head(data)

ggplot() 

ggplot() + 
  geom_point(data=data, aes(x=x,y=y))


ggplot() + 
  geom_point(data=data, aes(x=x,y=y)) +
  xlab('X axis') + ylab('Y axis')

ggplot() + 
  geom_point(data=data, aes(x=x,y=y)) +
  xlab('X axis') + ylab('Y axis') +
  ggtitle('Relationship between X and Y')

ansc <- read.delim('data/anscQuartet.tsv',sep='\t')
