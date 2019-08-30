library(tilegramsR)
library(leaflet)

spdf <- sf_WSJ
leaflet(spdf) %>% addPolygons()

data <- sf_WP
leaflet(data, option=leafletOptions(crs=leafletCRS("L.CRS.Simple"))) %>% addPolygons()

data <- sf_Pitch_US_Population_2016_v1
leaflet(data, options=leafletOptions(crs=leafletCRS("L.CRS.Simple"))) %>% addPolygons()

data <- sf_NPR1to1
leaflet(data, options=leafletOptions(crs=leafletCRS("L.CRS.Simple"))) %>% addPolygons()

data <- sf_NPR.DemersCartogram
leaflet(data, options=leafletOptions(crs=leafletCRS("L.CRS.Simple"))) %>% addPolygons()

data <- sf_FiveThirtyEightElectoralCollege
leaflet(data, options=leafletOptions(crs=leafletCRS("L.CRS.Simple"))) %>% addPolygons()

data <- sf_DKOS_Electoral_College_Map_v1
leaflet(data, options=leafletOptions(crs=leafletCRS("L.CRS.Simple"))) %>% addPolygons()

data <- sf_DKOS_Distorted_Electoral_College_Map_v1
leaflet(data, options=leafletOptions(crs=leafletCRS("L.CRS.Simple"))) %>% addPolygons()

data <- sf_DKOS_CD_Hexmap_v1.1
leaflet(data, options=leafletOptions(crs=leafletCRS("L.CRS.Simple"))) %>% addPolygons()

data <- sf_Datamap.io.tilegram
leaflet(data, options = leafletOptions(crs=leafletCRS("L.CRS.Simple"))) %>% addPolygons()
