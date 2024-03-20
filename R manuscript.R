#Install函数安装包
install.packages('ggplot2')
install.packages('devtools')
library(devtools)#library函数 加载devtools包
#安装来自github的包
install_github('lijian13/rinds')
#赋值
x <- 1 #alt+-

#向量的概念
vector <- 1:10
vector
#[]为按照Index取数字
vector[1:4]

vector <- c(1:3,6:10)
vector
vector[2:7]

#除去2，5，8
vector[-c(2,5,8)]

x <- 1:5
y <- 6:10

result <- x + y
result

x <- 1
result <- x + y
result

#数值型向量
x <- 1
is.integer(x)
#R语言不分整型integer和浮点型float，全都是数值型numeric

#当使用冒号，自动变成整型
y <- 1:3
class(y)

#seq函数，生成有规律的向量
seq(from=10,to=1,by=-0.5)
#len为把区间均分
seq(1,5,len=10)
#along.with 模仿此向量根据给定的向量生成一个新的向量
seq(1,5,along.with=1:3)

#rep函数
#1 3重复五次
rep(c(1,3),times=5)
#1 3各五次
rep(c(1,3),each=5)
#确定长度
rep(c(1,3),len=9)

#得到长度
x <- rep(c(3,5,6),times=7)
length(x)

#逻辑型向量
TRUE T 本质是1
FALSE F 本质是0

logit <- rep(c(T,F),len=7)
logit
sum(logit)#可求和

logit2 <- c(100 > 99, 100 > 101)
logit2
class(logit2)

#逻辑运算符
> 
<
== #等于
!= #不等于
>= #大于等于
<= #小于等于
& #and
c(100 > 90 & 100 > 101)
| # or
  c(100 > 90 | 100 > 101) 

#利用[]提取符合特定逻辑表达式的向量
x <- seq(1,100,len=30)
x
index <- x>75
index
x[index]

#利用which函数，返回符合逻辑表达式的Index
which(x > 75)
x[which(x>75)]

#进阶
index1 <- x > 75 & x < 90
index1
x[index1]

x[which(x > 75 & x < 90)]

#字符串
string <- c('abc','jk',1,2)
string
is.character(string[3])

#两个常量
letters
LETTERS
letters[1:5]
LETTERS[23:28]
#NA NOT AVAILABLE 缺失值

#因子型变量
my_fac <- factor(x = rep(c(1,2),times=5),levels = c(1,2),labels = c('Male','Female'))
my_fac
class(my_fac)

my_fac2 <- factor(LETTERS[1:5],labels = letters[1:5])
my_fac2

my_fac3 <- factor(1:5, labels = letters[1:5])
my_fac3

#gl函数 genrate factor levels
my_fac4 <- gl(n=2,k=5,labels=c("Control","Treantment"))
my_fac4

my_fac5 <- gl(n=2,k=1,labels=c("Control","Treantment"))
my_fac5

my_fac6 <- gl(n=2,k=1,length=8, labels=c("Control","Treantment"))
my_fac6

temp_str <- c('A','B','AB','O')
my_fac7 <- as.factor(temp_str)
my_fac7

as.character(my_fac7)

as.factor(my_fac7)

nlevels(my_fac7)
levels(my_fac7)

#reference

my_fac8 <- relevel(my_fac7,ref='B')
my_fac8

x <- c('placebo','10mg','20mg','30mg')
my_order_fac <- factor(x,ordered = T)
my_order_fac

install.packages("DescTools")
library(DescTools)

my_order_fac2 <- reorder.factor(my_order_fac, new.order = x)

#列表
list1 <- list(1,2,3,'R','nihao',T,F)

my_list2 <- list(1:10, letters[1:5])
#找到小写字母a
my_list2[[2]][1]

my_list3 <- list(1:5,letters[1:5],list(11:15,LETTERS[1:5]))
#找到大写字母A
my_list3[[3]][[2]][1]


#矩阵
my_matrix <- matrix(data = 1:6, nrow = 2, byrow = T)
my_matrix
#byrow决定是顺着行填充还是顺着列填充，默认为F，即沿列填充
my_matrix2 <- matrix(data = 1:10, nrow = 5)
my_matrix2
my_matrix3 <- matrix(data = 2, nrow = 3, ncol = 5)
my_matrix3
my_matrix4 <- matrix(data = letters[1:5], nrow = 4, ncol = 7)
my_matrix4
#带行列的名称,dimnames,list 种先行名后列名
my_matrix5 <- matrix(data = 1:9, nrow = 3, ncol = 3, dimnames = list(c('A','B','C'),c('V1','V2','V3')))
my_matrix5

#转置 t()
t(my_matrix5)

my_matrix6 <- matrix(c(1:5,10,letters[1:5]),nrow = 2)
my_matrix6
#数组 array 矩阵是二维的数组，但数组可以是多维的
my_array <- array(data = 1:16, dim = c(2,4,2))#两行四列两层
#查看数组维度
dim(my_array)
#改变数组维度
dim(my_array) <- c(4,2,2)

my_array2 <- array(data = 1:24, dim = c(2,3,4), dimnames = list(c(LETTERS[1:2]),c('col1','col2','col3'), c('first','secend','third','forth')))

#提取矩阵和数组的向量
my_array2[2,3,3]
my_array2[1,2,]
my_array2[,2,4]

#数据框
my_df <- data.frame(name = c("Tim",'Tom','Mary'),age = c(25,28,33),height = c(175,178,168))
my_df
#命名的合法问题
#数字开头或纯数字不行，含加减乘除乘方不行
dim(my_df)

View(my_df)

nrow(my_df)#返回有几行
ncol(my_df)#返回有几列

View(iris)

my_df <- data.frame(one = c(1.5,2.8,3.4,4.2,5.7), two = LETTERS[1:5], three = c(T,F,T,F,F))
#str函数查看概况
str(my_df)
#第一种方法，把第二列删去
my_df[,-2]
#第二种方法，把第二列设置为NULL
my_df$age <- NULL
my_df
#"$"可用于新建变量
my_df$four <- c('TOM','BOB','ANDY')
my_df
edit(my_df)#更改后并不会改变my_df,需要再赋给my_df
my_df2 <- edit(my_df)

fix(my_df)#直接更改了my_df


#快速查看数据框

1.#head函数和tail 函数
head(iris,n = 5)
tail(iris)

2.#str函数
str(iris)

3.#psych
install.packages('psych')
library('psych')
describe(iris)

names(iris) <- c('我','爱','医','学','方')
iris
#如果遇到中文变成乱码，
#一方面把Global options里改成UTF-8
#另一方面可运行以下函数
Sys.setlocale(category = 'LC_CTYPE', locale = 'zh_CN.UTF-8'
Sys.setlocale(locale = 'chinese')
#但当前版本似乎无需第二步

#条件与循环
x <- 1
if(x>0) print("i is positive") else
  print('i is negative')

x <- -1
if(x>0 & x<2) print('i = 1') else
  print('i don\'t know')

x <- 3
if(x>2)
{
  y = x + 2
  z = y * 2
}else
{ 
  y = x * 3
  z = y + 2
}
y;z

x <- 10
y <- c(12,8,9,14)
if(y<x) x else y
#变化——不再是warning而是直接报错

#循环
i <- 5
repeat{if(i > 25) break else
{print(i)
  i <- i+5}
}

i <- 5
while(i <= 30){
  print(i)
  i=i+5
  }

for (i in 1:10){
  print(i)
}

set.seed(2023)
x <- sample(10:100,10)
y <- sample(1:100,10)
for(i in 1:10){
  z[i]=x[i]>y[i]
}
z

set.seed(2023)
x <- sample(10:100,10)
y <- sample(1:100,10)
z <- NULL
for(i in 1:10){
  if(x[i]>y[i]){
    z=append(z,x[i])
  }
}
z

mat <- matrix(NA,ncol=4,nrow=4)
for (i in 1:4){
  for(j in 1:4){
    mat[i,j]=2
  }
}
mat
#自定义函数
my_fun1 <- function(x,y){
  x + y
}

my_fun2 <- function(x,y=2){
  x + y
}
#y的默认值设为2，但是仍可以键入任意y

#缺省参数
values <- c(sqrt(1:100))
my_fun3 <-function(x,...){
  print(x)
  summary(...)
} 
my_fun3("Here is the summary", values, digits=2)

addemup <- function(x,...){
  args <- list(...)
  for (a in args)x <- x + a
  x
}

#转化为标准正态分布
normalize <- function(x,m=mean(x,...), s=sd(x,...),...){
  (x-m)/s
}
normalize(1,2,3)
#csv文件 注意中文逗号
my_iris <- read.csv(file ='D:/R/iris.csv',header = TRUE ,
                    row.names = NULL, 
                    na.strings = "")
my_iris

my_iris <- read.csv(file = 'D:/R/iris.csv', header = TRUE,
                    row.names = NULL, col.names = c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width", "Species"),
                    na.strings = "", stringsAsFactors = FALSE)
my_iris

my_iris <- read.table(file = 'D:/R/iris.txt',header = T,na.strings = "")#txt文件
my_iris

#excel文件
install.packages("readxl")
library(readxl)
my_iris4 <- read_excel(path = 'D:/R/iris.xlsx')

install.packages("XLConnect",dependencies = T)
library(XLConnect)
#进行局部读取，startRow,endRow,starCol,endCol
my_iris5 <- readWorksheetFromFile(file = "D:/R/iris.xlsx",
                                  sheet = 1, 
                                  startRow = 2, 
                                  endRow = 5,
                                  startCol=3,
                                  endCol=7)
View(my_iris5)
library(installr)
updateR()

install.packages("rJava") 
install.packages("xlsxjars") 
install.packages("xlsx") 


#scan函数
x <- scan()

#cat函数
cat(1:25,file = "D:/R/temp.txt")

#读取SPSS SAS STATA

install.packages('foreign')
library(foreign)

my_spss <- read.spss(file = ,
                     to.data.frame = ,
                     use.missings = )

#读取txt文件
mytxt <- readLines('地址')

#读取fasta 碱基序列
myseq <- readLines('')

#stringi扩展包 处理文本用
install.packages('stringi')
library(stringi)
myseq <- stri_read_lines('')

#数据写出
my_iris

write.csv(my_iris, file = "D:/R/newfile.csv")

writeLines()

#排序函数sort()
x <- sample(1:100,20)
sort(x, decreasing = T)

y <- c('r','ruby','python','java')
sort(y,decreasing = T)

#rank 秩次
z <- c(1:10)
rank(z)

k <- c(1,2,3,5,5,7,8,8,8,9)
rank(k)

order(x)
x[order(x)]

iris=iris_na
iris[order(iris$Sepal.Length,decreasing = T),]#注意检查iris的属性
或#负号和decreasing效果相同
iris[order(-iris$Sepal.Length),]

#多变量排序
iris[order(iris$Sepal.Length,iris$Sepal.Width),]

#长宽型数据
freshman <- c(173,178,180,192)
sophomore <- c(175,169,183,185)
junior <- c(172,175,174,190)
senior <- c(181,183,175,168)
#宽型数据
data.frame(fr = freshman, so = sophomore, ju = junior, se = senior)
#长型数据
height <- stack(list(fr = freshman, so = sophomore, ju = junior, se = senior))
#长型数据分类汇总
tapply(height$values,height$ind,mean)

#reshape函数
reshape()

wide <- reshape(Indometh,v.names = 'conc', idvar = 'Subject',
                timevar = 'time', direction = 'wide')
long <- reshape(wide,idvar = "Subject", varying = list(2:12),
                v.names = "concentration", direction = 'long')


#reshape2
install.packages('reshape2')
library(reshape2)
#melt函数
new_iris <- melt(data = iris, id.vars = 'Species')#id.vars保留哪一列
#dcast函数
dcast(new_iris, formula = Species~variable, fun.aggregate = mean, value.var = 'value')

tips #小费数据集
View(tips)
#小费与性别的关系
dcast(data = tips, formula = sex~., fun.aggregate = mean, value.var = 'tip')
#小费与性别和是否吸烟的关系
dcast(data = tips, formula = sex~smoker,fun.aggregate = mean, value.var = 'tip')

#变量的因子化

age <- sample(20:80,20)

1,公式法
age1 <- 1 + (age > 30) + (age >= 40) + (age >=50)

age_fac <- factor(age1,labels = c('young', 'middle','m-old','old'))

age2 <- 1*(age<30) + 2*(age>=30 & age < 40) + 3*(age >=40 & age < 50) + 4*(age>50)


2,cut() 均分#重点
age3 <- cut(age, breaks = 4, labels = c('young', 'middle','m-old','old'),include.lowest = T, right = T)

3，ifelse()#重点

ifelse(age > 50,'old','young')
#可无限嵌套
ifelse(age>60,'old',ifelse(age<30,'young','middle'))

4, car扩展包
install.packages('car')
library(car)

recode(var = age, recodes = '20:29 = 1;30:39 = 2;40:49 = 3;50:hi = 4')

#apply家族

apply(array, margin, ...)

lapply()

sapply(list, function)

tapply()

mapply(function, ...)

mat <- matrix(1:24, nrow = 4, ncol = 6)
#关于marigin
#a vector giving the subscripts which the function will be applied over. 
#E.g., 
#for a matrix 1 indicates rows, 
#2 indicates columns, 
#c(1, 2) indicates rows and columns.
#Where X has named dimnames, it can be a character vector selecting dimension names.

apply(mat, 1, sum)#计算mat矩阵中每一行(1代表行）的和
apply(mat, 2, mean)#计算mat矩阵中每一列（2代表列）的平均值
 
apply(iris[,1:4],2,mean)

#遍历
lapply(X = c(1:5),FUN = log)
#举例，线性回归,
lapply(iris[,1:3],function(x)lm(x~iris$Petal.Width,data = iris[,1:3]))

#sapply返回的是向量
sapply(1:5,function(x)x+3)

#tapply
tapply(X = iris$Sepal.Length, INDEX = iris$Species, FUN = mean)
tapply(iris[,1:4], iris$Species,mean)

dcast(data = iris,formula = Species~., fun.aggregate = mean,
      value.var = 'Sepal.Length')

mapply(function, ...)

myfun <- function(x,y){
  if(x>4) return(y)
  else return(x-y)
}
#if不支持向量化操作
myfun(1:5,2:6)
#可通过mapply实现

mapply(myfun,1:5,2:6)

#数据汇总函数
例子
survival <- data.frame(id = 1:10,
                       cancer = sample(c('lung','liver','colon'),10,replace = T),
                       treatment = sample(c('Surg', 'Chemo'),10,replace = T),
                       sur_days = sample(100:1000,10))

ave(survival$sur_days,survival$cancer, FUN = sd)

by(data = survival$sur_days, INDICES = survival$cancer, FUN = mean)

by(data = survival$sur_days, INDICES = list(survival$cancer,survival$treatment), FUN = mean)

#mtcars数据集
#aggregate函数
aggregate(x = mtcars, by = list(VS = mtcars$vs == 1, high = mtcars$mpg>22),mean)

aggregate(iris, by = list(high_sp = iris$Sepal.Length>5,high_sw = iris$Sepal.Width),mean)

aggregate(.~Species, data = iris, mean)

#by函数 线性回归
by(mtcars, mtcars$cyl, function(x)lm(mpg~disp + hp, data = x))


#sweep函数
my_array <- array(1:24,dim = c(3,4,2))
#MARGIN取1对行操作，取2对列操作
#STATS 统计量 
sweep(x = my_array,MARGIN = 1,STATS = 1, FUN = '+')#给每个元素加了STATS
sweep(x = my_array,MARGIN = 3,2)
sweep(my_array,1,5)#默认是减去

install.packages('plyr')
install.packages('dplyr')
install.packages('data.table')

library(plyr)

#
aaply()

mymat <- matrix(1:24,ncol = 4,nrow = 6)

aaply(mymat,.margins = 2, .fun = mean)

adply(mymat,.margins = 2,.fun = mean)
#laply
my_list <- list(1:10, 2:8, rep(c(T,F),times = 5))

laply(my_list, .fun = mean)

my_df <- data.frame(name = c('A','B','C','D','E'),
                    height = c(174,178,187,176,135),
                    gender = c('M','F','M','F','F'))
                    
#ddply和tapply做汇总
tapply(my_df$height, my_df$gender,mean)

ddply(.data = my_df, .variables = "gender", .fun = summarise, mean_height = mean(height))
#.variables后写 ''或是.()均可
ddply(.data = my_df, .variables = .(gender), .fun = summarise, mean_height = mean(height))

ddply(.data = my_df, .variables = .(gender), summarise, mean_height = mean(height), sd_height = sd(height))

my_df <- data.frame(name = c('A','B','C','D','E'),
                    height = c(174,178,187,176,135),
                    gender = c('M','F','M','F','F'),
                    age =c('old','young','old','young','old'))

ddply(.data = my_df, .variables = .(gender,age), summarise, mean_height = mean(height), sd_height = sd(height))

library(reshape2)
View(tips)

ddply(tips, .variables = .(sex,smoker),function(x)sum(x$tip)/sum(x$total_bill))
#dlply函数
dlply()

my_model <- function(x)lm(Sepal.Length ~ Sepal.Width, data = x)

dlply(iris,~Species, my_model)


#plyr包的其他函数

#一次求多个指标
each(mean,sd,median)(iris$Sepal.Length)

#对列进行操作
colwise(mean)(iris)

numcolwise(mean)(iris)

#ddply与colwise联合,三种写法
ddply(iris, ~Species, colwise(mean,c('Sepal.Length','Sepal.Width')))

ddply(iris, ~Species, colwise(mean, .(Sepal.Length, Sepal.Width)))
#第三种，最直观好用
ddply(iris, ~Species, colwise(mean, ~Sepal.Length + Sepal.Width))



library(dplyr)
#filter函数，筛选行
filter()
sub1 <- filter(tips, tips$smoker == 'No', tips$day == 'Sun')

#slice函数
slice()#选择行
sub2 <- slice(tips, 1:5)
select()#选择列
sub3 <- select(tips, tip, sex, smoker)

sub4 <- select(tips, tip:time)
sub4 <- select(tips,2:5)

#arrange函数
arrange()

new_tips <- arrange(tips,total_bill, tip) #默认为升序排序
head(new_tips)
#降序排序
new_tips_desc <- arrange(tips, desc(total_bill),tip)
head(new_tips_desc)

rename()#对列重命名

new_tips <- rename(tips, bill = total_bill, tipp = tip)

distinct()#返回因子水平，类似于levels()

distinct(tips,day)

mutate()#生成新的变量

#生成变量的三种方法
#1.用$定义生成
tips$rate <- tips$tip/tips$total_bill
#2.用mutate()
mutate(tips, rate = tip/total_bill, new_rate = rate * 100)#可根据新生成的变量生成新变量
#3.用transform(),类似于$，不能根据新变量生成新变量
transform(tips, rate = tip/total_bill)

#从数据集随机抽取十个
sample_n(iris, size = 10)
#从数据集随机抽取一定比例
sample_frac(iris,0.1)
#group_by函数
group_by()

group = group_by(tips, smoker)

summarise(group, count = n(), mean_tips = mean(tip), sd_bill = sd(total_bill))

#管道符
#%>% 将几段代码连接起来，提高代码效率
result <- tips %>% group_by(smoker, sex) %>% summarise(count = n(), mean_tips = mean(tip), sd_bill = sd(total_bill))

join()#合并函数

df_a <- data.frame(x = c('a','b','c','a','c','b','c'), y = 1:7)
df_b <- data.frame(x = c('a','b','a'),z = 10:12)

inner_join(df_a, df_b, by = 'x')#A right_join() keeps all observations in y.出现在b才对

semi_join(df_a, df_b, by = 'x')#仅显示df_b种存在的df_a元素

anti_join(df_a, df_b, by = 'x')#仅显示df_b种不存在的df_a元素，只有当a中不在b的时候

left_join(df_a, df_b, by = 'x')#A left_join() keeps all observations in x.

right_join(df_a, df_b, by = 'x')#A right_join() keeps all observations in y.


library(data.table)

dt <- data.table(v1 =c(1,2), v2 = LETTERS[1:3], v3 = round(rnorm(12,2,2)),v4 = sample(1:20,12))
#返回三到六行
dt[3:6,]
#返回V2为B的
dt[v2=='B',]
#如果v2在A，B之中则返回
dt[v2 %in% c('A','B')]
#返回列，只认名字不认下标
dt[,1:2]#错误
dt[,list(v1,v2)]#正确
#v4列求和
dt[,sum(v4)]

dt[,list(sum_v4 = sum(v4),mean_v4 = mean(v4))]

dt[,list(sum_v3 = sum(v3),mean_v4 = mean(v4))]

dt[,list(v5 = v4 + 1, v6 = v3 - 1)]

dt[,{print(v2);plot(1:12,v3,col = 'red')}]#分号的效果相当于换行

dt[,list(sum_v3 = sum(v3),mean_v4 = mean(v4)), by = v2]
#先按v1分，再按v2分
dt[,list(sum_v3 = sum(v3), mean_v4 = mean(v4)), by = list(v2, v1)]
#只对前八行操作
dt[1:8,list(sum_v3 = sum(v3),mean_v4 = mean(v4)), by = v2]
#N，频数汇总参数
dt[,.N,by=list(v1,v2)]
#添加新参数
dt[,v5 := v4+1]
#一次添加两个新参数
dt[,c('v5','v6') := list(v3+1, v4-1)]

setkey()

attach()#将X放入环境
etc.
Species#直接输入无法找到
需使用
iris$Species
但如果
attach(iris)
则
Species#可找到
另有
detach()

setkey(dt,v2)#给某部分数据插旗，可直接找到

dt[c('A','C')]

dt[v2 %in% c('A','C')]
可简化为
dt[c('A','C')]
即不再需要先缩小范围到v2

#nomatch参数
dt[c('A','D')] #不存在D所以返回NA
dt[c('A','D'),nomatch = 0] #不存在的不返回

#by = .EACHI
dt[c('A','B'),sum(v4),by = .EACHI] #A，B分别求和

%>%串联操作

dt[,(v4_sum = sum(v4)), by = v2][v4_sum > 40]#可直接串联，无需管道符


#缺失值的识别和处理
x <- c(1,2.3,NA,4,NA)

mean(x,na.rm = T)
sum(x,na.rm = T)

is.na(x)#判断是否是缺失值
sum(is.na(x))#可知道缺失值的个数

x[!is.na(x)]#将缺失值去除

#新制作一个含NA的新iris
iris_na <- iris
for(i in 1:4){
  iris_na[sample(1:nrow(iris),5),i] = NA
}#前四列中随机生成五个NA值

iris_na
#找到NA值的数量
sapply(iris_na[,1:4],function(x)which(is.na(x)))

sapply(iris_na[,1:4],function(x)sum(is.na(x)))

#psych包
library(psych)

#describe函数，非常好用，返回一些基本统计值
describe(iris_na)

#计算缺失值的占比
sapply(iris_na[,1:4],function(x)(sum(is.na(x))/nrow(iris_na)))

#将NA漏掉，不过默认为na.omit
lm(Sepal.Length~Sepal.Width, data = iris_na,na.action = na.omit)#把NA漏掉

mean_value <- sapply(iris_na[,1:4],mean, na.rm = T)
#给NA处替换为平均值
for(i in 1:4){
  iris_na[is.na(iris_na[,i]),i] = mean_value[i]
}

cancer <- data.frame(id = 1:1000, sur_days = sample(100:1000, 1000, replace = T),
                     type = sample(c('colon','liver','lung'),1000, replace = T),
                     treatment = sample(c('chemo','surg','radio'),1000, replace = T))
cancer[sample(1:1000,90),2] <- NA

mean_value <- tapply(cancer$sur_days, list(cancer$type,cancer$treatment), mean,na.rm = T)

summary(cancer)
describe(cancer)

#分类型分治疗方式来填补缺失值
for(i in 1:3){
  for(j in 1:3){
    cancer$sur_days[is.na(cancer$sur_days) & cancer$type == rownames(mean_value)[i] 
                      & cancer$treatment == colnames(mean_value)[j]] = mean_value[i,j]
  }
}

describe(cancer)

#mlbench包
install.packages('mlbench')
library(mlbench)
data('BostonHousing')

original_data <- BostonHousing#保护原始数据

#插入一些缺失值
set.seed(2023)
BostonHousing[sample(1:nrow(BostonHousing),80),'rad'] <- NA
BostonHousing[sample(1:nrow(BostonHousing),80),'ptratio'] <- NA

install.packages('mice')
library(mice)

md.pattern(BostonHousing)#数据集中缺失值模式，最后一行 为 缺失总计

install.packages('Hmisc')
library(Hmisc)

#插补
impute()#均数插补

im_mean <- impute(BostonHousing$ptratio,mean)#平均值插补
BostonHousing$ptratio <- NULL
BostonHousing$im_mean <- im_mean

im_median <- impute(BostonHousing$ptratio,median)#中位数插补
BostonHousing$ptratio <- NULL
BostonHousing$im_median <- im_median

im_20 <- impute(BostonHousing$ptratio,20)#用20插补


#mice包 链式方程多元
mice_mod <- mice(BostonHousing[,!names(BostonHousing)%in%'medv'],method = 'rf')#rf random forest

mice_output <- complete(mice_mod)

actuals <- original_data$rad[is.na(BostonHousing$rad)]

predicts <- mice_output[is.na(BostonHousing$rad),'rad']

mean(actuals!=predicts)

#VIM包 可视化
install.packages('VIM')
library(VIM)

install.packages('mice')
library(mice)

data('airquality')#此数据集本身就有缺失值

md.pattern(airquality)#查看缺失值的分布

aggr_plot <- aggr(airquality,col = c('red','blue'), numbers = T, sortVars = T,
                  labels = names(airquality),cex.axis = 0.7, gap = 3)

marginplot(airquality[1:2])

data(sleep)
#VIM包，利用线性回归插补,因变量~自变量(无NA的可作为自变量)
#连续型变量和离散型变量回归方法不同，但可用auto解决
sleepIm <- regressionImp(Sleep + Gest + Span + Dream + NonD ~ BodyWgt + BrainWgt, data = sleep，family = 'auto')



#异常值的处理（离群值）

#1.根据数据背景来定义什么是异常值（无通用方法，要具体问题具体分析）

set.seed(2023)
mmhg <- sample(60:250, 1000, replace = T)#血压,60-250mmHg
range(mmhg)
max(mmhg)
min(mmhg)
quantile(mmhg)#四分位数#fivenum()

#识别异常值的函数
outlierKD <- function(dt,var){
  var_name <- eval(substitute(var),eval(dt))
  tot <- sum(!is.na(var_name))
  na1 <- sum(is.na(var_name))
  m1 <- mean(var_name, na.rm = T)
  par(mfrow = c(2,2),oma = c(0,0,0.1,0))
  boxplot(var_name, main = 'With outliers')
  hist(var_name,main = 'With outliers', xlab = NA, ylab = NA)
  outlier <- var_name[var_name > 230]#定义血压230以上为异常值，使用的时候重新定义
  mo <- mean(outlier)
  var_name <- ifelse(var_name %in% outlier, NA, var_name)
  boxplot(var_name, main = 'Without outliers')
  hist(var_name, main = "Without outliers", xlab = NA, ylab = NA)
  title('Outlier Check', outer = T)
  na2 <- sum(is.na(var_name))
  cat('Outliers identified:', na2-na1,"\n")
  cat("Propotion (%) of outliers:", round((na2 - na1)/tot*100, 1), "\n")
  cat('Mean of the outliers:', round(mo, 2), '\n')
  m2 <- mean(var_name, na.rm = T)
  cat('Mean without removing outliers:', round(m1,2), '\n')
  cat('Mean if we remove outliers:', round(m2,2), '\n')
  response <- readline(prompt = 'Do you want to remove outliers and to replace with NA? [yes/no]:')
  if(response == 'y' | response == 'yes'){
    dt[as.character(substitute(var))] <- invisible(var_name)
    assign(as.character(as.list(match.call())$dt), dt, envir = .GlobalEnv)
    cat('Outliers successfully removed', '\n')
    return(invisible(dt))
  }else{
    cat('Nothing changed','\n')
    return(invisible(var_name))
  }
}

试一试
df <- data.frame(bp = c(sample(80:250,1000, replace = T), NA, 390, 100))
outlierKD(df,bp)



#重复值

#1.向量
x <- c(1,2,3,4,5,1,2,3)
#方法一
unique(x)#去除重复值
#方法二
duplicated(x)#返回逻辑值，是否与前面的元素重复
x[!duplicated(x)]#去除重复值

#判断是否存在重复值
anyDuplicated(x)#第一个重复值出现的位置，可由此知道有没有重复值

#2.dataframe
library(readxl)
mydata <- read_excel('')
#选取合适的重复值判断依据
#比如名字相同性别是否有区别
#比如名字相同性别相同那么是否生日不太可能重复
#也可复合使用,根据多变量来排除重复值
mydata[!(duplicated(mydata$name) & duplicated(mydata$birthday)),]
#简单方法
mydata$test <- paste(mydata$name, mydata$birthday)
newdata <- mydata[!duplicated(mydata$test),]



#字符串的处理
#基因序列，患者基因等等均为字符串
x <- c('fudan','jiaoda')

nchar(x)#每个元素有多少字符

length(x)#一个向量有多少元素

toupper('yixuefang')#小写转大写
tolower('YIXUEFANG')#大写转小写

stringa <- LETTERS[1:5]
STRINGB <- 1:5
paste(stringa,STRINGB ,sep = "-")#也为分隔，但没有所有元素融合，仍未独立的多个元素

paste(stringa,STRINGB,collapse = '-')#collapes分隔，所有元素融合成一个

paste0(stringa,STRINGB,sep = "-")#paste0,A和1已经紧密结合，不会再被拆开

stringC <- paste(stringa,STRINGB,sep = '/')
stringC

strsplit(stringC,split = '/')

#从字符串中截取，substr
stringd <- c('Python','Java','ruby','php','yixuefang')
sub_str <- substr(stringd,start = 2,stop = 4)#每个元素都从第二位截取到第四位
sub_str


substr(stringd,start = 2,stop = 4) <- 'aaa'#替换第二位到第四位字母为aaa


seq_names <- c('EU_FRA02_C1_S2008','AF_COM12_B0_2004','AF_COM17_F0_S2008',
               'AS_CHN11_C3_2004','EU-FRA-C3-S2007','NAUSA02E02005',
               'AS_CHN12_N0_05','NA_USA03_C2_S2007','NA_USA04_A3_2004',
               'EU_UK01_A0_2009','eu_fra_a2_s98',"SA/BRA08/B0/1996")

fra_seq <- grep(pattern = 'FRA|fra',x = seq_names,value = T)#value=T时返回的是值，否则返回的是index

fra_seq











