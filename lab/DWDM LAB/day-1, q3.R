#given data
x<-c(200, 300, 400, 600, 800, 1000)
#min-max normalization by setting min=0 and max=1
min_max_norm<-(x-min(x))/(max(x)-min(x))
min_max_norm
#z-score normalization
z_score_norm<-(x-mean(x))/sd(x)
z_score_norm