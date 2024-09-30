#generate list of dlls that need to be overriden

#parse steam info for executable & steamid

#dummy variable to store dummy steamid
#currently of smtv
gameID=1875830
steamlibrarydir=~/.steam/steam/steamapps/common/
gamefolder=$(cat ~/.steam/steam/steamapps/appmanifest_1875830.acf | grep "installdir" | cut -d$'\t' --fields=4 | tr -d '"')

cd "$steamlibrarydir"
cd "$gamefolder"

folderswithexes=($(find . -name "*.exe"))


# Print the results
for file in "${folderswithexes[@]}"; do
    echo "$file"
while IFS= read -r exe_file; do
    # Get the directory of the .exe file
    exe_dir=$(dirname "$exe_file")

    # Search for .dll files in that directory
    dll_files=("$exe_dir"/*.dll)

    # Check if any .dll files were found and print them
    if [ -e "${dll_files[0]}" ]; then
        echo "DLL files in directory of $exe_file:"
        for dll in "${dll_files[@]}"; do
            echo "$dll"
        done
    fi
done < <(find "$base_directory" -type f -name "*.exe")



done
