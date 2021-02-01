stages = {}

field = {plats = {}, name = "BOXIFIELD", bg = love.audio.newSource("music/field.mp3","stream"), graphic = love.graphics.newImage("graphics/boxfield.png")}
p1 = {x = 78, y = 341, w = 644, h = 111, pass = false}
p2 = {x = 96, y = 240, w = 136, h = 18, pass = true}
p3 = {x = 576, y = 240, w = 136, h = 18, pass = true}
p4 = {x = 326, y = 166, w = 136, h = 18, pass = true}
table.insert(field.plats,p1)
table.insert(field.plats,p2)
table.insert(field.plats,p3)
table.insert(field.plats,p4)
table.insert(stages,field)


fb = {plats={},name = "FINAL\nBOXTINATION", bg = love.audio.newSource("music/final.mp3","stream"), graphic = love.graphics.newImage("graphics/fbox.png")}
p1 = {x = 81, y = 305, w = 646, h = 113, pass = false}
table.insert(fb.plats,p1)
table.insert(stages,fb)

