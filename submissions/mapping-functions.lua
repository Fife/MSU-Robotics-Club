function generatePath(bottom_left, length, width, offset)
	local travel_path = {}
	local start = {bottom_left["x"]+offset, bottom_left["y"]+offset}
	local x = start[1]
	local y = start[2]
	table.insert(travel_path, start)
	for i = 1,(length/(2*width)), 1 
		do 
			x = x + length
			table.insert(travel_path,{x, y})
			y = y + width
			table.insert(travel_path,{x, y})
			x = x - length
			table.insert(travel_path,{x, y})
			y = y + width
			table.insert(travel_path,{x, y})
	end
	return travel_path
end

function chunk(xLength, yLength, numSqr, center)
    local squareList = {}
    local square ={}
    offset =  {x=center[1]-(0.5*xLength) , y=center[2]-(0.5*yLength)}
     for j = 0,numSqr-1,1
       do
        columns = {}
       for i = 0,numSqr-1,1
           do
           tl={x=(xLength/numSqr)*i+offset["x"], y=(yLength/numSqr)*(j+1)+offset["y"]}
           bl={x=((xLength/numSqr)*i)+offset["x"], y=(yLength/numSqr)*j+offset["y"]}
           tr={x=(xLength/numSqr)*(i+1)+offset["x"], y=(yLength/numSqr)*(j+1)+offset["y"]}
           br={x=(xLength/numSqr)*(i+1)+offset["x"], y=(yLength/numSqr)*j+offset["y"]}
           table.insert(squareList, {tl=tl, bl=bl, tr=tr, br=br})
       end
   end
   return squareList
end