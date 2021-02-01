function getchars()
	for i,v in ipairs(chars) do
		sk = {x = (((((i/4)-math.floor((i-1)/4))*4)-1)*174)+61, y = (math.floor((i-1)/4)*161)+47, color = v.color, selector = v, name = v.name, chose = v.chose}
		table.insert(sks,sk)
	end
end

function getchips()
	chips = {}
	chip1 = {
		x = 10,
		y = 200,
		click = false,
		chosen = false,
		color = {255,0,0},
		key={
			r = "right",
			l = "left",
			u = "up",
			d = "down",
			j = "n",
			p = "m"}}
	chip2 = {
		x = 774,
		y = 200,
		click = false,
		chosen = false,
		color = {0,0,255},
		key={
			r = "d",
			l = "a",
			u = "w",
			d = "s",
			j = "t",
			p = "y"}}
	chip3 = {
		x = 10,
		y = 300,
		click = false,
		chosen = false,
		color = {255,255,0},
		key={
			r = "kp3",
			l = "kp1",
			u = "kp5",
			d = "kp2",
			j = "kp*",
			p = "kp-"}}
	chip4 = {
		x = 774,
		y = 300,
		click = false,
		chosen = false,
		color = {0,255,0},
		key={
			r = "d",
			l = "a",
			u = "w",
			d = "s",
			j = "t",
			p = "y"}}
	table.insert(chips,chip1)
	table.insert(chips,chip2)
	table.insert(chips,chip3)
	table.insert(chips,chip4)
end

function mousecss(x,y,button)
	for i,v in ipairs(chips) do
		if button == "l" and CC(x,y,1,1,v.x,v.y,32,32) then
			if v.click then
				v.click = false
				for ii,vv in ipairs(sks) do
					if CC(v.x,v.y,32,32,vv.x,vv.y,156,143) then
						v.chosen = vv.selector
						vv.chose:play()
					end
				end
			else
				v.click = true
				v.chosen = nil
			end
		end
	end
	if button == "l" and CC(x,y,1,1,227,3,209,37) then
		if mode == "time" then
			mode = "stocks"
		elseif mode == "stocks" then
			mode = "time"
		end
	end
	if button == "l" and CC(x,y,1,1,454,5,21,32) then
		if mode == "time" and minutes > 1 then
			minutes = minutes - 1
		elseif mode == "stocks" and stocks > 1 then
			stocks = stocks - 1
		end
	elseif button == "l" and CC(x,y,1,1,571,5,21,35) then
		if mode == "time" then
			minutes = minutes + 1
		elseif mode == "stocks" then
			stocks = stocks + 1
		end
	end
end

function keycss(key)
	if chip1.chosen and chip2.chosen and key == "return" then
		u = updatesss
		d = drawsss
		k = keysss
		m = mousesss
		ready = false
	end
end

function updatecss()
	if choose:isLooping() then
		choose:play()
		choose:setLooping(false)
	end
	choosem:play()
	x = love.mouse.getX()
	y = love.mouse.getY()
	for i,v in ipairs(chips) do
		if v.click then
			v.x = x - 8
			v.y = y - 8
			v.something = 0
			for ii,vv in ipairs(sks) do
				if CC(x,y,32,32,vv.x,vv.y,156,143) then
					v.maybe = vv.selector
					v.something = 1
				end
			end
			if v.something == 0 then
				v.maybe = nil
			end
		end
	end
end

function drawcss()
	love.graphics.setColor(255,255,255)
	love.graphics.draw(css,0,0)
	love.graphics.setFont(bigfont)
	love.graphics.setColor(255,255,255,255)
	if mode == "time" then
		love.graphics.printf("TIME",276,3,160,"center")
		love.graphics.printf(minutes..":00",475,5,96,"center")
	elseif mode == "stocks" then
		love.graphics.printf("STOCKS",276,3,160,"center")
		love.graphics.printf(stocks,475,5,96,"center")
	end
	love.graphics.setFont(font)
	for i,v in ipairs(sks) do
		love.graphics.printf(v.name,v.x,v.y+126,156,"center")
	end
	for i,v in ipairs(chips) do
		love.graphics.setColor(v.color,255)
		love.graphics.rectangle("fill",v.x,v.y,32,32)
		love.graphics.setColor(255,255,255,255)
		if  v.chosen then
			love.graphics.draw(v.chosen.mini,196*(i-1)+40,400)
			love.graphics.printf(v.chosen.name,196*(i-1)+19,540,175,"center")
		elseif v.maybe then
			love.graphics.setColor(255,255,255,100)
			love.graphics.draw(v.maybe.mini,196*(i-1)+40,400)
			love.graphics.printf(v.maybe.name,196*(i-1)+19,540,175,"center")
		end
	end
	love.graphics.setColor(255,255,255,255)
	if chip1.chosen and chip2.chosen then
		love.graphics.draw(readybanner,0,177)
	end
end
