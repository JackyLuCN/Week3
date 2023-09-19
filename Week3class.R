students<-read.table('https://www.dipintothereef.com/uploads/3/7/3/5/37359245/students.txt',header=T, sep="\t", dec='.') # read data set from url
str(students)
rm(list=ls()) # clean memory
library (datasets) # load package
data(iris) # import dataset
head (iris) # visualize 'head' dataset
Order<-order(iris$Sepal.Width,decreasing =T)
Order
iris[Order,]
iris$colors<-ifelse(iris$Species=='setosa','purple',ifelse(iris$Species=='versicolor','blue','red'))
iris
