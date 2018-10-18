
library("ggplot")
#2)	Copy the USArrests dataset into a local variable (similar to HW 2)
b <- (USArrests) #USAressts dataset is loaded in a local variable
mergedf <- merge(a, b, by.x = "stateName", by.y = 0) #a merged dataset is created 


stateArea <- state.area
statecenter <- state.center
stateName <- state.name
newframe <- data.frame(stateArea,statecenter,stateName)

mergedf<-merge(mergedf,newframe)

df <- data.frame(state.name, stringsAsFactors = FALSE)
df$state <-tolower(state.name)

us <- map_data("state")
mergedf$stateName <- tolower(stateName)


map.area <- ggplot(mergedf, aes(map_id=stateName))
map.area <- map.area + geom_map(map = us, aes(fill= stateArea))
map.area <- map.area + expand_limits(x=us$long, y= us$lat)
map.area <- map.area + coord_map() + ggtitle("state area")
map.area

map.murder <- ggplot(mergedf, aes(map_id=stateName))
map.murder<- map.murder + geom_map(map = us, aes(fill=Murder))
map.murder<-map.murder + expand_limits(x=us$long, y= us$lat)
map.murder<- map.murder + coord_map() +ggtitle("state Murder")
map.murder

map.murder1<- map.murder + geom_point(aes(x=x,y=y,size=population))
map.murder1

latlon <- geocode(source = "dsk","nyc,new york,ny")
latlon
map.murder2<-map.murder+ xlim(-84,-54)+ ylim(30,50)
map.murder2
