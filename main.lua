
function point_in_rectangle_check(point, rectangle)
return point[1]>=rectangle[1] and
    point[1]<=(rectangle[1]+rectangle[3]) and
    
    point[2]>=rectangle[2] and
    point[2]<=(rectangle[2]+rectangle[4])
end  

function rectangle_draw(rectangle)
-- Mouse
local mx=love.mouse.getX()
local my=love.mouse.getY()
local md=love.mouse.isDown(1)
if point_in_rectangle_check({mx,my},rectangle) or rectangle.ppx~=nil then
-- Difference/Delta for X (Previous Position)
local dx=0
if md then
  if rectangle.ppx==nil then
    rectangle.ppx=mx
  else
    dx=mx-rectangle.ppx
    rectangle.ppx=mx
  end
else
  rectangle.ppx=nil
end
rectangle[1]=dx+rectangle[1]
-- Difference/Delta for Y (Previous Position)
local dy=0
if md then
  if rectangle.ppy==nil then
    rectangle.ppy=my
  else
    dy=my-rectangle.ppy
    rectangle.ppy=my
  end
else
  rectangle.ppy=nil
end
rectangle[2]=dy+rectangle[2]
end -- end if
-- fill rectangle
love.graphics.rectangle("fill",rectangle[1],rectangle[2],rectangle[3],rectangle[4])
end

local rectangle1={50,50,100,100}
local rectangle2={150,150,100,100}
function love.draw()
rectangle_draw(rectangle1)
rectangle_draw(rectangle2)
end
