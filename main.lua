function love.load()
  Object = require "classic"
  require "shape"
  require "circle"
  require "rectangle"

  sheepImage = love.graphics.newImage("sheep.png")
  sheepLocation = {
    x = 100,
    y = 100,
    width = sheepImage:getWidth(),
    height = sheepImage:getHeight()
  }

  shapes = {}
  createRectangle()
  createCircle()
end

function love.update(dt)
  for key, shape in ipairs(shapes) do
    shape:update(dt)
  end
end

function love.draw()
  love.graphics.print("FPS: " .. love.timer.getFPS(), 10, 10)
  love.graphics.draw(sheepImage, sheepLocation.x, sheepLocation.y)
  for key, shape in ipairs(shapes) do
    local collision = checkCollision(shape)
    shape:draw(collision)
  end
end

function love.keypressed(key)
  if key == "c" then
    createCircle()
  elseif key == "r" then
    createRectangle()
  end
end

function checkCollision(shape)
  if not shape:is(Rectangle) then
    return false
  end

  local sheep_left = sheepLocation.x
  local sheep_top = sheepLocation.y
  local sheep_right = sheepLocation.x + sheepLocation.width
  local sheep_bottom = sheepLocation.y + sheepLocation.height

  local shape_left = shape.x
  local shape_top = shape.y
  local shape_right = shape.x + shape.width
  local shape_bottom = shape.y + shape.height

  if sheep_right > shape_left and
    sheep_left < shape_right and
    sheep_bottom > shape_top and
    sheep_top < shape_bottom then
    return true
  else
    return false
  end
end

function createCircle()
  circle = Circle(100, 300, 125)
  table.insert(shapes, circle)
end

function createRectangle()
  rectangle = Rectangle(100, 100, 200, 130)
  table.insert(shapes, rectangle)
end
