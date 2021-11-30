x,y=50,50
ppx=nil -- Previous Position
function love.draw()
-- Mouse
local mx=love.mouse.getX()
local md=love.mouse.isDown(1)
-- Difference/Delta
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
x=dx+x
love.graphics.rectangle("fill",x,y,100,100)
end
