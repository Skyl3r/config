#starts pharos print authorization
#this must be running when printing using the Popup server
#this is a hack... something is wrong with how pharos installed
function pharos -d "Starts Pharos printer auth"
    /Library/Application\ Support/Pharos/Popup.app/Contents/MacOS/Popup &
end

