################################
################################

##INSTRUCTIONS: 

#Create a web page using R Markdown that features a map created with Leaflet.
#Host your webpage on either GitHub Pages, RPubs, or NeoCities.
#Your webpage must contain the date that you created the document, 
#and it must contain a map created with Leaflet.

#UC's mapped (9): Berkeley, Davis, LA, Santa Cruz, Irvine, Santa Barbara, 
#San Diego, Riverside, Merced

#Does the web page feature a date and is this date less than two months 
#before the date that you're grading this assignment?
#Does the web page feature an interactive map that appears 
#to have been created with Leaflet?

################################
################################

library(leaflet)

set.seed(2020-08-17)

#lat & long coordinates of UC's in data frame
uc_data <- data.frame(name = c("UC Berkeley", "UC Davis", "UCLA", "UC Santa Cruz", "UC Irvine", "UC Santa Barbara", "UC San Diego", "UC Riverside", "UC Merced"),
                        pop = c(31352, 30872, 31577, 17792, 29736, 23070, 30285, 20581, 7881),
                        Lat = c(37.872111, 38.540681, 34.069024, 36.988059, 33.640477, 34.413910, 32.880105, 33.973759, 37.366057), 
                        Lng = c(-122.258518, -121.749119, -118.445095, -122.058209, -117.844243, -119.849001, -117.233949, -117.328182, -120.422525))

#custom markers according to UC logo
uc_marker <- makeIcon(iconURL = "https://cdn.theatlantic.com/assets/media/mt/jamesfallows/ucoldthumb.png",
                     iconWidth = 31*215/230, iconHeight = 31,
                     iconAnchorX = 31*215/230/2, iconAnchorY = 16)

#custom popups according to UC homepage
uc_info <- c("https://www.berkeley.edu/",
             "https://www.ucdavis.edu/",
             "https://www.ucla.edu/",
             "https://www.ucsc.edu/",
             "https://uci.edu/",
             "https://www.ucsb.edu/",
             "https://ucsd.edu/",
             "https://www.ucr.edu/",
             "https://www.ucmerced.edu/")

#piping customization into leaflet map
uc_map <- uc_data %>% 
    leaflet() %>%
    addTiles() %>%
    addMarkers(icon = uc_marker, popup = uc_info) %>%
    addCircles(weight = 1, radius = sqrt(uc_data$pop) * 30)

uc_map