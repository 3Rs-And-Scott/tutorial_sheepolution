Rectangle = Shape:extend()

function Rectangle:new(x, y, width, height)
  Rectangle.super.new(self, x, y)
  self.width = width
  self.height = height
end

function Rectangle:draw(collision)
  love.graphics.rectangle(self:mode(collision), self.x, self.y, self.width, self.height)
end

function Rectangle:mode(collision)
  if collision then
    return "fill"
  else
    return "line"
  end
end
