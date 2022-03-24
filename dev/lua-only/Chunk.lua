function chunk(xLength, yLength, numSqr, center)
    squareList = {}
    offset =  {x=center[1]-(0.5*xLength) , y=center[2] -(0.5*yLength)}
     for j = 0,numSqr,1
       do
       for i = 0,numSqr,1
           do
           tl={x=(xLength/numSqr)*i+offset["x"], y=(yLength/numSqr)*(j+1)+offset["y"]}
           bl={x=(xLength/numSqr)*i+offset["x"], y=(yLength/numSqr)*j+offset["y"]}
           tr={x=(xLength/numSqr)*(i+1)+offset["x"], y=(yLength/numSqr)*(j+1)+offset["y"]}
           br={x=(xLength/numSqr)*(i+1)+offset["x"], y=(yLength/numSqr)*j+offset["y"]}
           square= {tl = tl, bl = bl, tr=tr, br=br}
           table.insert(squareList, square)
       end
   end
   return squareList
end

