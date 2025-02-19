library(readr)
sp= read_csv("StudentsPerformance.csv")
View(sp)

data1=data.frame(sp)
View(data1)

#Finding unique vales in each column
for (i in seq(1,ncol(data1)-3,1)){
  print(unique(data1[i]))
}

summary(data1)

#Data Visualization
#of Reading score in terms of Gender
library(ggplot2)
ggplot(data=data1,aes(x=reading.score,fill=gender))+
  geom_histogram(aes(y=(..count..)/sum(..count..)),col="red",binwidth =1)+
  scale_y_continuous(labels=scales::percent)+ylab("percentage")+
  ggtitle(" Histogram of Reading score")+theme(text=element_text(size=15))+
  xlab("Reading_score")

# Frequency of Writing score in terms of Gender
ggplot(data=data1,aes(x=writing.score,fill=gender))+
  geom_histogram(col="red",binwidth =1)+
  ggtitle("       Histogram of Writing score")+
  theme(text=element_text(size=15))+xlab("Wrting score")+
  ylab("freqeuncy")

#Frequency of Maths Score in terms of Genders
ggplot(data=data1,aes(x=math.score,fill=gender))+
  geom_histogram(col="red",binwidth =1)+ ylab("Freqeuncy")+
  ggtitle("           Histogram of Maths score")+
  theme(text=element_text(size=15))+xlab("Maths_score")

# Counting Genders Quantity(%) in terms of Test Prep Course
y1=ggplot(data=data1,aes(x=gender,fill=test.preparation.course))+
  geom_bar(aes(y=(..count..)/sum(..count..)))+ylab("Percentage")+
  scale_y_continuous(labels=scales::percent)+
  theme(axis.text = element_text(size=15),axis.title = element_text(size=15))
print(y1)

# Counting Race/ethics(%) in terms of Test Prep Course
y2=ggplot(data=data1,aes(x=race.ethnicity,fill=test.preparation.course))+
  geom_bar(aes(y=(..count..)/sum(..count..)))+ylab("percentage")+
  scale_y_continuous(labels=scales::percent)+
  theme(axis.title = element_text(size=15),axis.text = element_text(size=10))
print(y2)

# Counting Prep level of edu (%) in terms of Test Prep Course
y3=ggplot(data=data1,aes(x=parental.level.of.education,fill=test.preparation.course))+
  geom_bar(aes(y=(..count..)/sum(..count..)))+
  scale_y_continuous(labels = scales::percent)+
  theme(axis.title = element_text(size = 15),axis.text = element_text(size = 7))+
  ylab("Percentage")
print(y3)

library(ggpubr)
ggarrange(y1,y2,y3,ncol=1,nrow=3)
# Relationship between Reading Score and Maths Score in terms of Writing Score
ggplot(data=data1,aes(x=reading.score,y=math.score,col=writing.score))+
  geom_point()+
  geom_smooth(method = 'lm',se=FALSE)

# Relationship between Reading Score and Maths Score in terms of Gender
ggplot(data=data1,aes(x=reading.score,y=math.score,col=gender))+geom_point()+
  geom_smooth(method='lm',se=FALSE)

# Relationship between Reading Score and Maths Score in terms of Test prep
ggplot(data=data1,aes(x=reading.score,y=math.score,col=test.preparation.course))+
  geom_point()+
  geom_smooth(method='lm',se=FALSE)

# Relationship between Reading Score and Maths Score in terms of Race/Ethics
ggplot(data=data1,aes(x=reading.score,y=math.score,col=race.ethnicity))+
  geom_point()

# Correlation between Maths Score and Reading Score
cor.test(data1$math.score,data1$reading.score)

#Summary of Maths score for Race/ethics in terms of Gender
ggplot(data=data1,aes(x=race.ethnicity,y=math.score,fill=gender))+
  geom_boxplot()+facet_grid(~gender)+
  theme(text = element_text(size = 10),axis.text = element_text(size = 7) )

#Summary of Reading score for Race/ethics in terms of Gender
#reading score;
ggplot(data=data1,aes(x=race.ethnicity,y=reading.score,fill=gender))+
  geom_boxplot()

# Summary of writing score for Race/ethics in terms of Gender
#writing score;
ggplot(data=data1,aes(x=race.ethnicity,y=writing.score,fill=gender))+
  geom_boxplot()+facet_grid(~gender)

# Normal Distribution of Maths Score
standard_dev=sd(data1$math.score)
mean_dia=mean(data1$math.score)
#normal distribution
y=dnorm(data1$math.score,mean_dia,standard_dev)
plot(data1$math.score,y,xlab = "math score",ylab = "outcomes",main="Normal distribution",xlim = c(-5,110))

# Normal Distribution of Reading Score
standard_dev=sd(data1$reading.score)
mean_dia=mean(data1$reading.score)
#normal distribution
y=dnorm(data1$reading.score,mean_dia,standard_dev)
plot(data1$reading.score,y,xlab = "reading score",ylab = "outcomes",main="Normal distribution",xlim = c(5,110))

