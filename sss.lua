function getstages()
	for i,v in ipairs(stages) do
		sk = {x = (((((i/3)-math.floor((i-1)/3))*3)-1)*102)+30, y = (math.floor((i-1)/3)*122)+158, selector = v.plats, music = v.bg, name = v.name, gr = v.graphic}
		table.insert(skss,sk)
	end
end

function mousesss(x,y,button)
	for i,v in ipairs(skss) do
		if button == "l" and CC(x,y,1,1,v.x,v.y,92,101) then
			love.graphics.setFont(font)
			doplayers()
			stage = v.selector
			bg = v.music
			bg:setVolume(.8)
			gra = v.gr
			choosem:stop()
			u = updatefight
			d = drawfight
			k = keysfight
			ready = false
			if mode == "time" then
				updateobjective = updatetimes
				drawobjective = drawtimes
			elseif mode == "stocks" then
				updateobjective = updatestocks
				drawobjective = drawstocks
			end
		end
	end
	if button == "l" and CC(x,y,1,1,7,10,162,38) then
		u = updatecss
		d = drawcss
		k = keycss
		m = mousecss
	end
end

function updatesss()
	choosem:play()
	x = love.mouse.getX()
	y = love.mouse.getY()
	ismaybe = 0
	for i,v in ipairs(skss) do
		if CC(x,y,1,1,v.x,v.y,92,101) then
			maybe = v
			ismaybe = 1
		end
		if ismaybe == 0 then
			maybe = nil
		end
	end
end

function drawsss()
	love.graphics.draw(sss,0,0)
	love.graphics.setFont(bigfont)
	if maybe then
		love.graphics.draw(maybe.gr,357,150,0,.5,.5)
		love.graphics.printf(maybe.name,339,465,437,"center")
	end
end

function keysss(key)
	if key == "escape" then
		u = updatecss
		d = drawcss
		k = keycss
		m = mousecss
	end
end
