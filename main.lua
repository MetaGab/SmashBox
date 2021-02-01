require "char"
require "fight"
require "css"
require "stages"
require "sss"
require "start"
require "results"

function love.load()
	ps = {}
	sks = {}
	skss = {}
	second = 0
	ping = true
	getchars()
	getchips()
	getstages()
	results = love.graphics.newImage("graphics/results.png")
	readybanner = love.graphics.newImage("graphics/ready.png")
	start = love.graphics.newImage("graphics/start.png")
	css = love.graphics.newImage("graphics/css.png")
	sss = love.graphics.newImage("graphics/sss.png")
	font = love.graphics.newImageFont("graphics/font.png",
	" abcdefghijklmnopqrstuvwxyz" ..
    "ABCDEFGHIJKLMNOPQRSTUVWXYZ0" ..
    "123456789.,!?-+/():;%&`'*#=[]\"")
	bigfont = love.graphics.newImageFont("graphics/fontbig.png",
	" abcdefghijklmnopqrstuvwxyz" ..
    "ABCDEFGHIJKLMNOPQRSTUVWXYZ0" ..
    "123456789.,!?-+/():;%&`'*#=[]\"")
	love.graphics.setFont(font)
	u = updatestart
	d = drawstart
	k = keystart
	m = mousestart
	mode = "time"
	minutes = 2
	stocks = 3
	choose = love.audio.newSource("sounds/choose.wav","static")
	choose:setLooping(true)
	choosem = love.audio.newSource("music/choosebg.mp3","stream")
	intro = love.audio.newSource("sounds/intro.wav","static")
	resbg = love.audio.newSource("music/results.mp3","stream")
	intro:setLooping(true)
	choosem:setLooping(true)
end

function doplayers()
	for i,v in ipairs(chips) do
		if v.chosen then
			player = {vi = {x=0, y=0},
			px = 100*i,
			py = 200,
			points = 0,
			ground = false,
			face = 1,
			facey = nil,
			jumps = v.chosen.maxjumps,
			atk = false,
			dmg = 0,
			stock = stocks,
			falls = 0,
			kos = 0,
			sd = 0,
			hit = {box, dmg, own, has},
			key={
				r = v.key.r,
				l = v.key.l,
				u = v.key.u,
				d = v.key.d,
				j = v.key.j,
				p = v.key.p}}
			for k,v in pairs(v.chosen) do player[k] = v end
			table.insert(ps,player)
		end
	end
end

function timer(dt)
	second = second + dt
end

function love.update(dt)
	u(dt)
end

function love.keypressed(key)
	k(key)
end

function love.mousepressed(x,y,button)
	m(x,y,button)
end

function love.draw()
	d()
end

function CC(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end
