function chunk(xLength, yLength, numSqr)
 squareList = {}
      for j = 0,numSqr,1
        do
        for i = 0,numSqr,1
            do
            tl={x=(xLength/numSqr)*i, y=(yLength/numSqr)*(j+1)}
            bl={x=(xLength/numSqr)*i, y=(yLength/numSqr)*j}
            tr={x=(xLength/numSqr)*(i+1), y=(yLength/numSqr)*(j+1)}
            br={x=(xLength/numSqr)*(i+1), y=(yLength/numSqr)*j}
            square= {tl=tl, bl=bl, tr=tr, br=br}
            table.insert(squareList, square)
        end
    end
    return squareList
end

