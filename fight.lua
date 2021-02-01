function bestcollition(vv)
	vv.aaaaaa = 0
	for i,v in ipairs(stage) do
		if CC(vv.px,vv.py,vv.size.x,vv.size.y+1,v.x,v.y,v.w,v.h) then
			if vv.py + vv.size.y - 1 - vv.vi.y < v.y then
				vv.vi.y = 0
				vv.py = v.y - vv.size.y
				vv.ground = true
				vv.last = nil
				vv.jumps = vv.maxjumps
				vv.aaaaaa = 1
			elseif vv.py > v.y + v.h - 1 + vv.vi.y and not v.pass then
				vv.vi.y = 0
				vv.py = v.y + v.h + 1
			elseif vv.px + vv.size.x - 1 - vv.vi.x< v.x and not v.pass then
				vv.vi.x = 0
				vv.px = v.x - vv.size.x
			elseif vv.px > v.x + v.w -1 + vv.vi.x and not v.pass then
				vv.vi.x = 0
				vv.px = v.x + v.w
			end
		end
		if vv.aaaaaa == 0 then
			vv.ground = false
		end
	end
end

function revive(v)
	v.px = 400
	v.py = 200
	v.vi.y = 0
	v.vi.x = 0
	v.dmg = 0
	v.jumps = v.maxjumps
	v.inv = second
	v.dead = nil
end

function move(v,dt)
	v.px = v.px + v.vi.x
	v.py = v.py + v.vi.y
	if v.vi.x > 0 then
		v.vi.x = v.vi.x - v.traction
	elseif v.vi.x < 0 then
		v.vi.x = v.vi.x + v.traction
	end
	if not v.ground and not v.inv then
		v.vi.y = v.vi.y + v.fallspeed
	end
	if v.px < -100 or v.px > 950 or v.py > 650 then
		if v.last then
			v.last.points = v.last.points + 1
			v.last.kos = v.last.kos + 1
			v.falls = v.falls + 1
		else
			v.sd = v.sd + 1
		end
		if mode == "time" then
			v.points = v.points - 1
		elseif mode == "stocks" and v.stock >= 1 then
			v.stock = v.stock - 1
		end
		if mode == "stocks" and v.stock == 0 then
			if second - (math.floor(second/60)*60) < 10 then
				v.timeof = math.floor(second/60)..":0"..math.floor(second - (math.floor(second/60)*60))
			else
				v.timeof = math.floor(second/60)..":"..math.floor(second - (math.floor(second/60)*60))
			end
		end
		v.die:play()
		v.dead = second
	end
end

function mousefight()
end

function drawfight()
	love.graphics.setColor(255,255,255,255)
	love.graphics.draw(gra,0,0)
	--for i,v in ipairs(stage) do
		--love.graphics.rectangle("fill",v.x,v.y,v.w,v.h)
	--end
	for i,v in ipairs(ps) do
		love.graphics.setColor(255,255,255,255)
		love.graphics.rectangle("fill",(i-1)*160+40,500-1,150,80)
		love.graphics.setColor(v.color,255)
		love.graphics.print(v.name,(i-1)*160+41,500)
		--love.graphics.rectangle("fill",v.px,v.py,v.size.x,v.size.y)
		if v.dmg < 127 then
			love.graphics.setColor(255,255-v.dmg*2,255-v.dmg*2,255)
		else
			love.graphics.setColor(255,0,0,255)
		end
		love.graphics.print(v.dmg.."%",(i-1)*160+41,535)
		love.graphics.setColor(255,255,255,255)
		drawobjective(v,i)
		if v.inv then
			love.graphics.setColor(255,255,255,75+((second - v.inv) * 33.33))
		end
		if v.face == 1 then
			love.graphics.draw(v.sprite,v.px,v.py)
			if v.extras then
				love.graphics.draw(v.spriteextras,v.px+v.extras.x,v.py+v.extras.y)
			end
		else
			love.graphics.draw(v.sprite,v.px,v.py,0,-1,1,v.size.x)
			if v.extras then
				love.graphics.draw(v.spriteextras,v.px-v.extras.x,v.py+v.extras.y,0,-1,1,v.size.x)
			end
		end
		if v.atk then
			if v.facey then
				if v.facey == 1 and v.ground and v.face == 1 then
					love.graphics.draw(v.spritepunch,v.px + v.size.x,v.py+v.size.y-v.punchsize.y)
				elseif v.facey == 1 and v.ground and v.face == -1 then
					love.graphics.draw(v.spritepunch,v.px-v.punchsize.x,v.py+v.size.y-v.punchsize.y,0,-1,1,v.punchsize.x)
				elseif v.facey == 1 and not v.ground then
					love.graphics.draw(v.spritepunch,v.px + ((v.size.x-v.punchsize.y)/2),v.py + v.size.y,math.rad(90),1,1,0,v.punchsize.y)
				elseif v.facey == -1 then
					love.graphics.draw(v.spritepunch,v.px + ((v.size.x-v.punchsize.y)/2),v.py - v.punchsize.x,math.rad(270),1,1,v.punchsize.x,0)
				end
			elseif v.face == 1 then
					love.graphics.draw(v.spritepunch,v.px + v.size.x,v.py + ((v.size.y-v.punchsize.y)/2))
			elseif v.face == -1 then
					love.graphics.draw(v.spritepunch,v.px-v.punchsize.x,v.py + ((v.size.y-v.punchsize.y)/2),0,-1,1,v.punchsize.x)
			end
		end
	end
end

function attack(v)
	if v.facey then
		if v.facey == 1 and v.ground and v.face == 1 then
			v.hit.box = {x = v.px + v.size.x,y = v.py+v.size.y-v.punchsize.y}
		elseif v.facey == 1 and v.ground and v.face == -1 then
			v.hit.box = {x = v.px-v.punchsize.x,y = v.py+v.size.y-v.punchsize.y}
		elseif v.facey == 1 and not v.ground then
			v.hit.box = {x = v.px + ((v.size.x-v.punchsize.y)/2), y = v.py + v.size.y}
		elseif v.facey == -1 then
			v.hit.box = {x = v.px + ((v.size.x-v.punchsize.y)/2), y = v.py - v.punchsize.x}
		end
	elseif v.face == 1 then
		v.hit.box = {x = v.px + v.size.x,y = v.py + ((v.size.y-v.punchsize.y)/2)}
	elseif v.face == -1 then
		v.hit.box = {x = v.px-v.punchsize.x,y = v.py + ((v.size.y-v.punchsize.y)/2)}
	end
	v.hit.own = v
end

function hit(v)
	for ii,vv in ipairs(ps) do
		if CC(vv.px,vv.py,vv.size.x,vv.size.y,v.hit.box.x,v.hit.box.y,v.punchsize.x,v.punchsize.y) and v.hit.has == false and not vv.inv and v ~= vv then
			vv.dmg = vv.dmg + v.strenght
			v.hit.has = true
			if v.facey then
				if v.ground then
					vv.vi.y = math.ceil((vv.dmg/10 + (vv.dmg * v.strenght)/20)*(100/(vv.weight+100))) * -1
				else
					vv.vi.y = math.ceil((vv.dmg/10 + (vv.dmg * v.strenght)/20)*(100/(vv.weight+100))) * v.facey
				end
			else
				vv.vi.x = math.ceil((vv.dmg/10 + (vv.dmg * v.strenght)/20)*(100/(vv.weight+100))) * v.face
				vv.vi.y = vv.dmg * -.0625
			end
			vv.last = v
			vv.hurt:play()
		end
	end
end

function keysfight(key)
	for i,v in ipairs(ps) do
		if key == v.key.j then
			if v.jumps > 0 then
				v.vi.y = v.jumpheight * -1
				v.jumps = v.jumps - 1
				--v.jump:play()
			end
			if v.inv then
				v.inv = nil
			end
		end
	end
	if key == "escape" then
		u = updateresults
		d = drawresults
		k = keyresults
		m = mouseresults
		second = 0
		bg:stop()
		getplacestime()
	end
end

function updatefight(dt)
	timer(dt)
	bg:play()
	updateobjective()
	for i,v in ipairs(ps) do
		if not v.dead then
			if love.keyboard.isDown(v.key.l) and v.vi.x > v.groundspeed*-1 then
				if ground then
					v.vi.x = v.vi.x - .5
					v.face = -1
				else
					v.vi.x = v.vi.x - .5
					v.face = -1
				end
				if v.inv then
					v.inv = nil
				end
			elseif love.keyboard.isDown(v.key.r) and v.vi.x < v.groundspeed then
				if ground then
					v.vi.x = v.vi.x + .5
					v.face = 1
				else
					v.vi.x = v.vi.x + .5
					v.face = 1
				end
				if v.inv then
					v.inv = nil
				end
			end
			if love.keyboard.isDown(v.key.p) then
				if love.keyboard.isDown(v.key.u) then
					v.facey = -1
				elseif love.keyboard.isDown(v.key.d) then
					v.facey = 1
				else
					v.facey = nil
				end
				attack(v)
				v.attack:play()
				hit(v)
				v.atk = true
				if v.inv then
					v.inv = nil
				end
			else
				v.atk = false
				v.hit.has = false
			end
			if v.inv then
				if v.inv + 2 < second then
					v.inv = nil
				end
			end
			bestcollition(v)
			move(v,dt)
		else
			if v.dead + 1 < second then
				if mode == "stocks" and v.stock >= 1 then
					revive(v)
				elseif mode == "time" then
					revive(v)
				end
			end
		end
	end
end

function updatestocks()
	aliv = 0
	for ii,vv in ipairs(ps) do
		if vv.stock >= 1 then
			aliv = aliv + 1
		end
	end
 	if aliv == 1 then
		u = updateresults
		d = drawresults
		k = keyresults
		m = mouseresults
		second = 0
		getplacesstock()
		bg:stop()
	end
end

function updatetimes()
	if second > minutes*60 then
		u = updateresults
		d = drawresults
		k = keyresults
		m = mouseresults
		second = 0
		getplacestime()
		bg:stop()
	end
end

function drawstocks(v,i)
	love.graphics.setFont(font)
	love.graphics.print(v.stock.." vidas",(i-1)*160+41,555)
end

function drawtimes(v,i)
	love.graphics.setFont(bigfont)
	if math.floor(60-(second-(math.floor(second/60)*60))) < 10 then
		love.graphics.printf(math.floor(minutes-second/60)..":0"..math.floor(60-(second-(math.floor(second/60)*60))),0,0,800,"center")
	else
		love.graphics.printf(math.floor(minutes-second/60)..":"..math.floor(60-(second-(math.floor(second/60)*60))),0,0,800,"center")
	end
	love.graphics.setFont(font)
	love.graphics.print(v.points.." puntos",(i-1)*160+41,555)
end
