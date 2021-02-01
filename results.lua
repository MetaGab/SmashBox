function getplacesstock()
	highs = {}
	for i,v in ipairs(ps) do
		high = {}
		name = v.name
		timeof = v.timeof
		sd = v.sd
		ko = v.kos
		fall = v.falls
		table.insert(high,name)
		table.insert(high,ko)
		table.insert(high,fall)
		table.insert(high,sd)
		table.insert(high,timeof)
		table.insert(highs,high)
	end
end

function getplacestime()
	highs = {}
	for i,v in ipairs(ps) do
		high = {}
		name = v.name
		point = v.points
		sd = v.sd
		ko = v.kos
		fall = v.falls
		table.insert(high,name)
		table.insert(high,ko)
		table.insert(high,fall)
		table.insert(high,sd)
		table.insert(high,point)
		table.insert(highs,high)
	end
end

function updateresults()
	resbg:play()
end

function drawresults()
	love.graphics.setFont(bigfont)
	love.graphics.draw(results,0,0)
	love.graphics.printf("KO's",50,180,100,"center")
	love.graphics.printf("Falls",50,270,100,"center")
	love.graphics.printf("SD's",50,360,100,"center")
	if mode == "time" then
	love.graphics.printf("Points",50,450,100,"center")
	else
	love.graphics.printf("Time of death",50,435,100,"center")
	end
	for i,v in ipairs(highs) do
		for ii,vv in ipairs(v) do
		love.graphics.printf(vv,75+(120*i),90*ii,100,"center")
		end
	end
end

function keyresults(key)
	if key == "return" then
		u = updatecss
		d = drawcss
		k = keycss
		m = mousecss
		ps = {}
		resbg:stop()
		love.graphics.setFont(font)
	end
end

function mouseresults()
end
