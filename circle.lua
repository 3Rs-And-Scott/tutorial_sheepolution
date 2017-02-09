Circle = Shape:extend()

function Circle:new(x, y, radius)
  Circle.super.new(self, x, y)
  self.radius = radius
end

function Circle:draw(collision)
  love.graphics.circle("line", self.x, self.y, self.radius)
end
