
library("ggplot2")
library("ggmap")
#2)	Copy the USArrests dataset into a local variable (similar to HW 2)
b <- (USArrests) #USAressts dataset is loaded in a local variable
mergedf <- merge(a, b, by.x = "stateName", by.y = 0) #a merged dataset is created 


#2)	Add the area of each state, and the center of each state, to the merged dataframe, using the ‘state.center’, ‘state.center’ and ‘state.name’ vectors

stateArea <- state.area      #storing state.area ,state.center and statee.name 
statecenter <- state.center
stateName <- state.name
newframe <- data.frame(stateArea,statecenter,stateName) #creating a new data frame using these vectors

mergedf<-merge(mergedf,newframe) #combining the new dataframe with the margedf

df <- data.frame(state.name, stringsAsFactors = FALSE)
df$state <-tolower(state.name) #converting state.name to lowercase as ggmap does not take uppercase
us <- map_data("state") #getting the data on the region to be mapped
mergedf$stateName <- tolower(stateName) #converting statename to lowercase

#3)	Create a color coded map, based on the area of the state 
map.area <- ggplot(mergedf, aes(map_id=stateName))  #using ggplot to map by giving map_id as statename
map.area <- map.area + geom_map(map = us, aes(fill= stateArea))#using geom_map to perform mapping and filling it based on statearea criteria
map.area <- map.area + expand_limits(x=us$long, y= us$lat) #expand_limits used to set limits 
map.area <- map.area + coord_map() + ggtitle("state area") #coord_map projects a portion of the earth, which is approximately spherical, onto a flat 2D plane using any projection defined by the mapproj package.
map.area
#4)	Repeat step B, but color code the map based on the murder rate of each state.

map.murder <- ggplot(mergedf, aes(map_id=stateName))
map.murder<- map.murder + geom_map(map = us, aes(fill=Murder)) #filling the map based on the murderr crieria
map.murder<-map.murder + expand_limits(x=us$long, y= us$lat)
map.murder<- map.murder + coord_map() +ggtitle("state Murder")
map.murder
#Show the population as a circle per state (the larger the population, the larger the circle), using the location defined by the center of each state
map.murder<- map.murder + geom_point(aes(x=x,y=y,size=population)) #used geom_point fuction to plot the points by giving size as population to adjust it 
map.murder
#6)	Repeat step C, but only show the states in the north east
latlon <- geocode(source = "dsk","nyc,new york,ny") #latitue and longitude of nyc is obtained
latlon
map.murder1<-map.murder+ xlim(-84,-54)+ ylim(30,50) #using xlim and ylim we have zoomed in 
map.murder1
