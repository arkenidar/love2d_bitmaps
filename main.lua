-- love2d.org app for customizable bitmap-images loading and drawing

local image
function love.load()
  -- window
  love.window.setTitle("bitmap for fonts")
  love.window.setMode(1000, 600)
  -- images
  image = love.graphics.newImage("sorgent.bmp")
end

local function draw_rectangles(ix, y, width, height, amount)
  love.graphics.setColor(1, 0, 0, 0.5) -- red with alpha
  local x = ix                         -- initial x coordinate
  for id = 1, amount do                -- repeat
    -- draw rectangle line borders ( not color filled )
    love.graphics.rectangle("line", x, y, width, height)
    x = x + width -- move to the right
  end
end

function love.draw()
  -- background image ( bitmap font )
  love.graphics.reset()
  love.graphics.clear(1, 1, 1)
  love.graphics.draw(image, 0, 0, 0, 0.5, 0.5)

  -- rectangles for characters of such bitmap font
  local common_width = 30
  local common_height = 55

  -- abcdefghijklmnopqrstuvwxyz
  draw_rectangles(22, 30, common_width, common_height, 26)

  -- ABCDEFGHIJKLMNOPQRSTUVWXYZ
  draw_rectangles(22, 115, common_width, common_height, 26)

  -- 0123456789
  draw_rectangles(25, 200, common_width, common_height, 10)

  -- ()[]{}<>/|\.,;:!?_+-*=~
  draw_rectangles(25, 280, common_width, common_height, 23)

  -- "'`£$€^°#%&@àÀèÈéÉìÌòÒùÙ§çÇ
  draw_rectangles(25, 363, common_width, common_height, 27)
end

function love.keypressed(k)
  -- escape key quits
  if k == 'escape' then
    love.event.quit()
  end
end
