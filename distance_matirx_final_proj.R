#cities <- read.csv("/Users/amolprakash/Desktop/College/simulationModelling/cities.csv")
#cities = data.frame(cities)
#city_names <- cities$City
city_names<- c("Sydney","Melbourne","Perth","Adelaide","Brisbane","Darwin","Canberra","Gold Coast" ,"Hobart","Cairns")
#using inbuilt 
dist_mat1<- dist(cities,method = "euclidean",diag = T, upper = T)
dist_mat1
#building it manually 
dist_mat_2 <- matrix(0, nrow = 10,ncol = 10)
dimnames(dist_mat_2)<-list(city_names, city_names) 

dist_mat_2

#sydney - and all cities 
dist_mat_2[1,2]<- dist_mat_2[2,1]<-  712.97 # sydney - melnb
dist_mat_2[1,3]<-dist_mat_2[3,1]<-3290.40 # sydney - perth   
dist_mat_2[1,4]<-dist_mat_2[4,1]<-1161.71# sydney - adelide
dist_mat_2[1,5]<-dist_mat_2[5,1]<-732.82# sydney - brisbane
dist_mat_2[1,6]<-dist_mat_2[6,1]<-3148.95# sydney - darwin
dist_mat_2[1,7]<-dist_mat_2[7,1]<-246.09# sydney - canberra
dist_mat_2[1,8]<-dist_mat_2[8,1]<-686.36# sydney - gold coast
dist_mat_2[1,9]<-dist_mat_2[9,1]<-1057.04 # sydney - hobart 
dist_mat_2[1,10]<-dist_mat_2[10,1]<-1961.29# sydney - cairns

# melb and all cities 
dist_mat_2[2,3] <- dist_mat_2[3,2] <-2721.74#melb - perth
dist_mat_2[2,4] <-dist_mat_2[4,2] <- 653.81#melb - adelaide
dist_mat_2[2,5] <-dist_mat_2[5,2] <- 1374.43#melb -brisbane
dist_mat_2[2,6] <-dist_mat_2[6,2] <-3148.21#melb - darwin
dist_mat_2[2,7] <-dist_mat_2[7,2] <-466.89#melb - canberra
dist_mat_2[2,8]<-dist_mat_2[8,2] <-1345.93 #melb - gold coast
dist_mat_2[2,9] <- dist_mat_2[9,2] <-597.77#melb - hobart
dist_mat_2[2,10] <- dist_mat_2[10,2] <-2324.49#melb - cairns

# perth and all cities 
dist_mat_2[3,4]<-dist_mat_2[4,3]<- 2131.23# perth - adeliade
dist_mat_2[3,5]<- dist_mat_2[5,3]<-3606.17# perth -brisbanr
dist_mat_2[3,6]<- dist_mat_2[6,3]<-2653.25# perth - darwin 
dist_mat_2[3,7]<- dist_mat_2[7,3]<-3088.79# perth - canberra
dist_mat_2[3,8]<- dist_mat_2[8,3]<-3627.40# perth - gold coast 
dist_mat_2[3,9]<- dist_mat_2[9,3]<-3010.29# perth -hobart
dist_mat_2[3,10]<- dist_mat_2[10,3]<-3441.04# perth - cairns

# adiealde and all cities 
dist_mat_2[4,5]<- dist_mat_2[5,4]<-1600.41#adelaide - brisbane 
dist_mat_2[4,6]<-dist_mat_2[6,4]<- 2617.46#adelaide -darwin 
dist_mat_2[4,7]<- dist_mat_2[7,4]<-958.44#adelaide -canberra
dist_mat_2[4,8]<- dist_mat_2[8,4]<-1600.95#adelaide -gold coast
dist_mat_2[4,9]<- dist_mat_2[9,4]<-1161.53#adelaide -hobart
dist_mat_2[4,10]<-dist_mat_2[10,4]<- 2124.82#adelaide -cairns

# brisbane and all cities 
dist_mat_2[5,6]<- dist_mat_2[6,5]<-2847.49#brisbane - darwin 
dist_mat_2[5,7]<-dist_mat_2[7,5]<- 943.58#brisbane - canberra
dist_mat_2[5,8]<- dist_mat_2[8,5]<-71.31#brisbane - gold coast 
dist_mat_2[5,9]<- dist_mat_2[9,5]<-1789.15#brisbane - hobart
dist_mat_2[5,10]<- dist_mat_2[10,5]<-1389.44#brisbane - cairns 

# darwin and all cities 
dist_mat_2[6,7]<-dist_mat_2[7,6]<- 3133.49 #darwin - canberra
dist_mat_2[6,8]<- dist_mat_2[8,6]<-2912.47#darwin  - gold coast 
dist_mat_2[6,9]<- dist_mat_2[9,6]<-3735.97#darwin  - hobart 
dist_mat_2[6,10]<- dist_mat_2[10,6]<-1679.89#darwin - cairns 

# canberra and all cities 
dist_mat_2[7,8]<- dist_mat_2[8,7]<-905.61#canberra - gold coast 
dist_mat_2[7,9]<-dist_mat_2[9,7]<-859.42 #canberra - hobart 
dist_mat_2[7,10]<- dist_mat_2[10,7]<-2068.32#canberra -cairns 

# gold coast and all cities 
dist_mat_2[8,9]<- dist_mat_2[9,8]<-1743.32# gold coast - hobart
dist_mat_2[8,10]<- dist_mat_2[10,8]<-1460.75# gold coast - cairns c

#hobart and all cities 
dist_mat_2[9,10] <-dist_mat_2[10,9]<- 2890.27 # hobart - cairns 

dist_mat_2

write.csv(dist_mat_2, file = 'dist_matrix.csv',row.names = T, col.names = T)
