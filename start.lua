function keystart(key)
	if key == "return" then
		u = updatecss
		d = drawcss
		k = keycss
		m = mousecss
		second = 0
		intro:stop()
	end
end

function updatestart(dt)
	if intro:isLooping() then
		intro:play()
		intro:setLooping(false)
	end
	if ping then
		second = second + dt
	elseif not ping then
		second = second - dt
	end
	if second > .5 then
		ping = false
	elseif second < 0 then
		ping = true
	end
end

function mousestart()
end

function drawstart()
	love.graphics.draw(start,0,0)
	love.graphics.setFont(bigfont)
	if second > .25 then
		love.graphics.printf("APACHURRA EL ENTER",0,440,800,"center")
	end
end
