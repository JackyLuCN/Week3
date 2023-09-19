students<-read.table('https://www.dipintothereef.com/uploads/3/7/3/5/37359245/students.txt',header=T, sep="\t", dec='.') # read data set from url
str(students)
rm(list=ls()) # clean memory
library (datasets) # load package
data(iris) # import dataset
head (iris) # visualize 'head' dataset


Order<-order(iris$Sepal.Width,decreasing =T)
Order
iris[Order,]
#iris[order(iris$Sepal.Width,decreasing = T),] 
#Tidier coding from teacher
iris$colors<-ifelse(iris$Species=='setosa','purple',ifelse(iris$Species=='versicolor','blue','red'))
#defining colors by species, use the second ifelse to make three different definitions

iris$colors<-NULL #deleting the 'colors' column

#dplyr
install.packages('dplyr')
library(dplyr)
summarised = summarise(iris, Mean.Width = mean(Sepal.Width))
head(summarised)

selected1 = dplyr::select(iris, Sepal.Length, Sepal.Width, Petal.Length)
head(selected1)
#Actually it's no need to code 'dplyr::' only if you don't have any other function called 'select'

selected2 = dplyr::select(iris, Sepal.Length:Petal.Length)
head(selected2, 4) # 4 means only 4 rows are selected

selected3 = dplyr::select(iris,c(2:5))
head(selected3) #Choose from the 2nd to 5th column

selected4 = dplyr::select(iris, -Sepal.Length, -Sepal.Width)
selected4 # Select without these two column

filtered1 = filter(iris, Species == 'setosa')
head(filtered1, 3)

filtered2 = filter(iris, Species == 'versicolor', Sepal.Width > 3)
tail(filtered2)

mutated1 = mutate(iris, Greater.Half = Sepal.Width > 0.5 * Sepal.Length)
tail(mutated1)

table(mutated1$Greater.Half)

arranged1 = arrange(iris, Sepal.Width)
head(arranged1)

arranged2 = arrange(iris, desc(Sepal.Width))
head(arranged2)

gp = group_by(iris, Species)
gp
gp.mean = summarise(gp, Mean.Sepal = mean(Sepal.Width))
gp.mean

iris %>% filter(Species == 'setosa', Sepal.Width > 3.8)
# %>% allows to wrap multiple functions together.
iris %>% group_by(Species) %>% summarise(Mean.Length = mean(Sepal.Length))

#tidyr
install.packages('tidyr')
library(tidyr)

# A tidy data is:
#Every column is a variable
#Every row is an observation
#Every cell is a single values.

TW_corals = read.table('C:/Users/j0893/OneDrive/桌面/Rcourse/Week3/tw_corals.txt', header=T, sep='\t', dec='.')
TW_corals

TW_corals_long = TW_corals %>% pivot_longer(Southern_TW:Northern_Is, names_to = 'Region', values_to = 'Richness')
TW_corals_long
# Transform a wide data into a long data

TW_corals_wide = pivot_wider(TW_corals_long, names_from = Region, values_from = Richness)
TW_corals_wide

income=read.table("C:/Users/j0893/OneDrive/桌面/Rcourse/Week3/metoo.txt", header=T, sep='\t', dec='.', na.strings='n/a')
income

income_long = income %>% pivot_longer(cols = -state,
                                      names_to = c('gender', 'work'),
                                      names_sep = '_',
                                      values_to = 'income')
# Except for column of state, all the others columns are transformed
income_long

#Splitting=上面的步驟拆開
income_long %>% pivot_wider(names_from = c(gender,work),
                            values_from = income,
                            names_sep = '.')

income_long_var = income %>% pivot_longer(cols = -1,
                                          names_to = 'var1',
                                          values_to = 'income')
income_long_var

income_sep = income_long_var %>% separate(col = var1,
                                          sep = '_',
                                          into = c('gender', 'work'))
income_sep

income_long_var %>% separate_rows(var1, sep='_')
