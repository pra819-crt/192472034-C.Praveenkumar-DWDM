#age, frequency
age<-c(5, 15, 20, 50, 80, 110)
frequency<-c(200, 450, 300, 1500, 700, 44)
#finding median
median(age)
median(frequency)
#finding mean
mean(age)
mean(frequency)
#finding mode
mode_age <- names(table(age) [table(age)==max(table(age))])
mode_frequency <- names(table(frequency) [table(frequency)==max(table(frequency))])
print(mode_age)
print(mode_frequency)