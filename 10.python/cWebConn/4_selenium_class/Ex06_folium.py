# pip install folium

import folium

map = folium.Map(location=[37.41578544756253, 127.0986670945656], zoom_start=16)

folium.Marker(location=[37.41578544756253, 127.0986670945656], popup="코이캉",
              icon=folium.Icon(color="red", icon="info-sign")).add_to(map)
folium.CircleMarker(location=[53.47872212015272, -2.2421696871839223], popup="Manchester is Red", radius=100,
                    color="red", fill_color="#AA33FF").add_to(map)
map.save("map/map1.html")
