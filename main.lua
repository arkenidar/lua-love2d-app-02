---x,y=50,50
local rectangle1={50,50,100,100}
ppx=nil -- Previous Position
ppy=nil
function love.draw()
-- Mouse
local mx=love.mouse.getX()
local my=love.mouse.getY()
local md=love.mouse.isDown(1)
-- Difference/Delta for X
local dx=0
if md then
  if ppx==nil then
    ppx=mx
  else
    dx=mx-ppx
    ppx=mx
  end
else
  ppx=nil
end
rectangle1[1]=dx+rectangle1[1]
-- Difference/Delta for Y
local dy=0
if md then
  if ppy==nil then
    ppy=my
  else
    dy=my-ppy
    ppy=my
  end
else
  ppy=nil
end
rectangle1[2]=dy+rectangle1[2]
-- fill rectagle
love.graphics.rectangle("fill",rectangle1[1],rectangle1[2],rectangle1[3],rectangle1[4])
end
