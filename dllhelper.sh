#generate list of dlls that need to be overriden

#parse steam info for executable & steamid

#dummy variable to store dummy steamid
#currently of smtv
gameID=1875830
steamlibrarydir=~/.steam/steam/steamapps/common/
gamefolder=$(cat ~/.steam/steam/steamapps/appmanifest_1875830.acf | grep "installdir" | cut -d$'\t' --fields=4 | tr -d '"')

cd "$steamlibrarydir"
cd "$gamefolder"

ls
