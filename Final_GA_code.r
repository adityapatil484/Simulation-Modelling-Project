city_names<- c("Sydney","Melbourne","Perth","Adelaide","Brisbane","Darwin","Canberra","Gold Coast" ,"Hobart","Cairns")
dist_mat <- matrix(0, nrow = 10,ncol = 10)
dimnames(dist_mat)<-list(city_names, city_names)

# sydney - and all cities 
dist_mat[1,2]<- dist_mat[2,1]<-  712.97 # sydney - melnb
dist_mat[1,3]<-dist_mat[3,1]<-3290.40 # sydney - perth   
dist_mat[1,4]<-dist_mat[4,1]<-1161.71 # sydney - adelide
dist_mat[1,5]<-dist_mat[5,1]<-732.82 # sydney - brisbane
dist_mat[1,6]<-dist_mat[6,1]<-3148.95 # sydney - darwin
dist_mat[1,7]<-dist_mat[7,1]<-246.09 # sydney - canberra
dist_mat[1,8]<-dist_mat[8,1]<-686.36 # sydney - gold coast
dist_mat[1,9]<-dist_mat[9,1]<-1057.04 # sydney - hobart 
dist_mat[1,10]<-dist_mat[10,1]<-1961.29 # sydney - cairns

# melb and all cities 
dist_mat[2,3] <- dist_mat[3,2] <-2721.74 #melb - perth
dist_mat[2,4] <-dist_mat[4,2] <- 653.81 #melb - adelaide
dist_mat[2,5] <-dist_mat[5,2] <- 1374.43 #melb -brisbane
dist_mat[2,6] <-dist_mat[6,2] <-3148.21 #melb - darwin
dist_mat[2,7] <-dist_mat[7,2] <-466.89 #melb - canberra
dist_mat[2,8]<-dist_mat[8,2] <-1345.93 #melb - gold coast
dist_mat[2,9] <- dist_mat[9,2] <-597.77 #melb - hobart
dist_mat[2,10] <- dist_mat[10,2] <-2324.49 #melb - cairns

# perth and all cities 
dist_mat[3,4]<-dist_mat[4,3]<- 2131.23 # perth - adeliade
dist_mat[3,5]<- dist_mat[5,3]<-3606.17 # perth -brisbanr
dist_mat[3,6]<- dist_mat[6,3]<-2653.25 # perth - darwin 
dist_mat[3,7]<- dist_mat[7,3]<-3088.79 # perth - canberra
dist_mat[3,8]<- dist_mat[8,3]<-3627.40 # perth - gold coast 
dist_mat[3,9]<- dist_mat[9,3]<-3010.29 # perth -hobart
dist_mat[3,10]<- dist_mat[10,3]<-3441.04 # perth - cairns

# adelaide and all cities 
dist_mat[4,5]<- dist_mat[5,4]<-1600.41 #adelaide - brisbane 
dist_mat[4,6]<-dist_mat[6,4]<- 2617.46 #adelaide -darwin 
dist_mat[4,7]<- dist_mat[7,4]<-958.44 #adelaide -canberra
dist_mat[4,8]<- dist_mat[8,4]<-1600.95 #adelaide -gold coast
dist_mat[4,9]<- dist_mat[9,4]<-1161.53 #adelaide -hobart
dist_mat[4,10]<-dist_mat[10,4]<- 2124.82 #adelaide -cairns

# brisbane and all cities 
dist_mat[5,6]<- dist_mat[6,5]<-2847.49 #brisbane - darwin 
dist_mat[5,7]<-dist_mat[7,5]<- 943.58 #brisbane - canberra
dist_mat[5,8]<- dist_mat[8,5]<-71.31 #brisbane - gold coast 
dist_mat[5,9]<- dist_mat[9,5]<-1789.15 #brisbane - hobart
dist_mat[5,10]<- dist_mat[10,5]<-1389.44 #brisbane - cairns 

# darwin and all cities 
dist_mat[6,7]<-dist_mat[7,6]<- 3133.49 #darwin - canberra
dist_mat[6,8]<- dist_mat[8,6]<-2912.47 #darwin  - gold coast 
dist_mat[6,9]<- dist_mat[9,6]<-3735.97 #darwin  - hobart 
dist_mat[6,10]<- dist_mat[10,6]<-1679.89 #darwin - cairns 

# canberra and all cities 
dist_mat[7,8]<- dist_mat[8,7]<-905.61 #canberra - gold coast 
dist_mat[7,9]<-dist_mat[9,7]<-859.42 #canberra - hobart 
dist_mat[7,10]<- dist_mat[10,7]<-2068.32 #canberra -cairns 

# gold coast and all cities 
dist_mat[8,9]<- dist_mat[9,8]<-1743.32 # gold coast - hobart
dist_mat[8,10]<- dist_mat[10,8]<-1460.75 # gold coast - cairns c

#hobart and all cities 
dist_mat[9,10] <-dist_mat[10,9]<- 2890.27 # hobart - cairns 

dist_mat
"---------------------------------------------------------------------------------------------------"
#running the GA function
library(GA)

tourLength <- function(tour, distMatrix) {
  tour <- c(tour, tour[1])
  route <- embed(tour, 2)[, 2:1]
  sum(distMatrix[route])
}


tspFitness <- function(tour, ...) 1/tourLength(tour, ...)


# run a GA algorithm

start_time= Sys.time()
GA <- ga(type = "permutation", fitness = tspFitness, distMatrix = dist_mat, lower = 1, 
             upper = attr(dist_mat,"dim"), popSize = 10, maxiter = 500, run = 100, pmutation = 0.2, 
             monitor = NULL, keepBest = TRUE)
end_time = Sys.time()
runtime = end_time-start_time

runtime

summary(GA)
tourLength(GA@solution,dist_mat) #finding total distance
"------------------------------------------------------------------------------------------------------"
all_dist = c()
start_time= Sys.time()
for (i in 1:100) {
  all_dist = c(all_dist,tourLength(GA@bestSol[[i]],dist_mat))
}

GA@bestSol[all_dist==min(all_dist)]

min(all_dist)
"---------------------------------------------------------------------------------------------------------"
#to calculate runtime for 100 simuations of GA
start_time = Sys.time()
for (i in 1:100) {

  GA <- ga(type = "permutation", fitness = tspFitness, distMatrix = dist_mat, lower = 1,
           upper = attr(dist_mat, "dim"), popSize = 10, maxiter = 500, run = 100, pmutation = 0.2,
           monitor = NULL, keepBest = TRUE)
}
end_time = Sys.time()
runtime = end_time-start_time
runtime

"----------------------------------------------------------------------------------------------------------"
#to calculate mean runtime
start_time1 = c()
end_time1 = c()
for (i in 1:100) {
  start_time1 = c(start_time1,Sys.time())
  GA <- ga(type = "permutation", fitness = tspFitness, distMatrix = dist_mat, lower = 1,
           upper = attr(dist_mat, "dim"), popSize = 10, maxiter = 500, run = 100, pmutation = 0.2,
           monitor = NULL, keepBest = TRUE)
  end_time1 = c(end_time1,Sys.time())
}
runtime1 = end_time1 - start_time1
mean(runtime1)


"----------------------------------------------------------------------------------------------------------"
#plotting runtime for 100 simulations
plot(runtime1,type="l")


"---------------------------------------------------------------------------------------------------------"
n.iterations = GA@iter # number of iterations in GA 
distances = numeric(n.iterations) # initializing zeros matrix to collect distances

# looping through the best solution of every iteration and storing the distance for that solution
for (i in 1:n.iterations){
  distances[i] = distance(c(as.vector(GA@bestSol[[i]]), GA@bestSol[[i]][1,1]))
}



# collecting the distances in a dataframe for plotting
results <- data.frame(Iteration = seq(1:n.iterations), Distance = distances)

library(ggplot2)

# Plot for Iteration vs Distance of Best Solution
ggplot(data = results, aes(x = Iteration, y = Distance))+
  geom_line(color = "#00AFBB", size = 1) + theme_minimal() +
  ggtitle("Distance for the Best Solution After Every Iteration")
"-------------------------------------------------------------------------------------------------"
mds <- cmdscale(dist_mat_2)
x <- mds[, 1]
y <- -mds[, 2]
n <- length(x)
B <- 100
fitnessMat <- matrix(0, B, 2)
A <- matrix(0, n, n)
for (b in seq(1, B)) {
  # run a GA algorithm
  GA.rep <- ga(type = "permutation", fitness = tspFitness, distMatrix = dist_mat,
               lower = 1, upper = attr(dist_mat,"dim"), popSize = 10, maxiter = 500, run = 100,
               pmutation = 0.2, monitor = NULL)
  
  tour <- GA.rep@solution[1, ]
  tour <- c(tour, tour[1])
  fitnessMat[b, 1] <- max(GA.rep@fitness)
  fitnessMat[b, 2] <- mean(GA.rep@fitness)
  A <- A + getAdj(tour)
}


plot.tour <- function(x, y, A) {
  n <- nrow(A)
  for (ii in seq(2, n)) {
    for (jj in seq(1, ii)) {
      w <- A[ii, jj]
      if (w > 0)
        lines(x[c(ii, jj)], y[c(ii, jj)], lwd = w, col = "lightgray")
    }
  }
}


plot(GA, main = "GA progression")
points(rep(50, B), fitnessMat[, 1], pch = 16, col = "lightgrey")
points(rep(55, B), fitnessMat[, 2], pch = 17, col = "lightblue")
title(sub = "Best and Avg at 50th iteration over 100 simulations")
"-------------------------------------------------------------------------------------------------------------------"



mds <- cmdscale(dist_mat)
x <- mds[, 1]
y <- -mds[, 2]
plot(x, y, type = "n", asp = 1, xlab = "", ylab = "")
abline(h = pretty(range(x), 10), v = pretty(range(y), 10),
       col = "light gray")
tour <- GA@solution[1, ]
tour <- c(tour, tour[1])
n <- length(tour)
arrows(x[tour[-n]], y[tour[-n]], x[tour[-1]], y[tour[-1]],
       length = 0.15, angle = 25, col = "green", lwd = 2)
text(x, y, labels = row.names(dist_mat),cex=0.8)