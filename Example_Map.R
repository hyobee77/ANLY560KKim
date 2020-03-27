# Clear workspace: It is always good idea to clear workspace so that you start fresh.  
# If you do not, you may have something that you used previously (even if you re-launch the software) that will cause wrong calculation or an error message.
rm(list=ls()) # removes all objects 

# leaflet is a good for plotting map.  
# Install library
if (!require(leaflet)) install.packages("leaflet") # Install this package only one time.  Once installed, you only need to load it.
# loading the same package into new R scripts:
library(leaflet)      


# First Leaflet Map: Create a leaflet map of points of your favorite places to eat. 

# create your own longitude and latitude points of your favorite restaurants first.  
# You can use code like the example below that makes a dataframe called "eating".  
# To obtain actual longitude and latitude, use Google maps, and right click on any location, 
# then choose "What's This" to obtain the coordinates.

Long<-c(-87.639781, -87.640674,-87.624104,-87.622880)
 
Lat<-c(41.872847, 41.871646,41.873370,41.884823)

restaurant<-c("BWW","Portillo", "Yolk", "Wildberry")

marker_color<-c("navy","red","orange","green")

foodquality<-c(98,90,91,50)

eating<-cbind(Long,Lat,restaurant,foodquality)


my_m <- leaflet(eating) %>%
  #addTiles() %>%  # Add default map tiles
  #addProviderTiles(providers$Stamen.Toner) %>%  # Add default OpenStreetMap map tiles
  #addProviderTiles("CartoDB.Positron") %>%
  addProviderTiles(providers$Esri.NatGeoWorldMap)%>%
  setView(lng = -87.64, lat = 41.87, zoom = 10) %>%
  #addMarkers(lng=Long, lat=Lat, popup=restaurant)
  # add some circles to a map
  addCircles(lng=Long, lat=Lat, popup=restaurant, radius = foodquality, color = marker_color)

my_m  # Print the map


# Reference: Leaflet for R
# Retrieved from https://rstudio.github.io/leaflet/?Name=Leaflet%20for%20R


