function writeCoord(tx, rx)
   file = io.open("coordinates.csv", "a+")
   io.input(file) 
   return tostring(tx) .. " " .. tostring(rx)
end
