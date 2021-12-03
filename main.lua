
function point_in_rectangle_check(point, rectangle)
return point[1]>=rectangle[1] and
    point[1]<=(rectangle[1]+rectangle[3]) and
    
    point[2]>=rectangle[2] and
    point[2]<=(rectangle[2]+rectangle[4])
end  

local currently_grabbed=nil
function rectangle_grab(rectangle)
if currently_grabbed~=nil and
  currently_grabbed~=rectangle then
    return false
end
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
local grabbed=rectangle.ppx~=nil
if grabbed then
  currently_grabbed=rectangle
end
return grabbed
end -- end function

function rectangle_draw(rectangle)
local color=rectangle.color
love.graphics.setColor(color[1],color[2],color[3])
-- fill rectangle
love.graphics.rectangle("fill",rectangle[1],rectangle[2],rectangle[3],rectangle[4])
end

local rectangle1={50,50,100,100,color={1,0,0}}
local rectangle2={150,150,100,100,color={1,1,0}}
local rectangles={rectangle1,rectangle2}
function love.draw()
-- grabbing (front-to-back)
local grabbed
local some_grabbed=false
for i=#rectangles,1,-1 do
  grabbed=rectangle_grab(rectangles[i])
  if grabbed then
    some_grabbed=true
    break
  end
end
if not some_grabbed then
  currently_grabbed=nil
end
-- drawing (back-to-front)
for i=1,#rectangles do
  rectangle_draw(rectangles[i])
end

end
