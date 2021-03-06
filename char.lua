	chars = {}
fox = {color = {146, 111, 91},
	name = "FOX",
	punchcolor = {146, 111, 91} ,
	maxjumps = 2,
	jumpheight = 15,
	fallspeed = .95,
	strenght = 5,
	groundspeed = 7,
	airspeed = 7,
	weight = 120,
	traction = .25,
	size = {x = 48, y = 48},
	punchsize = {x = 22, y = 21},
	extras = {x = 9, y = -13},
	sprite = love.graphics.newImage("graphics/fox.png"),
	spritepunch = love.graphics.newImage("graphics/foxpunch.png"),
	spriteextras = love.graphics.newImage("graphics/foxextras.png"),
	mini = love.graphics.newImage("graphics/foxmini.png"),
	hurt = love.audio.newSource("sounds/hurtfox.wav","static"),
	die = love.audio.newSource("sounds/diefox.wav","static"),
	attack= love.audio.newSource("sounds/hitfox.wav","static"),
	--jump = love.audio.newSource("sounds/jfox.wav","static"),
	chose= love.audio.newSource("sounds/chfox.wav","static"),
	chant= love.audio.newSource("sounds/chantfox.wav","static")}
table.insert(chars,fox)

mario = {color = {201, 0, 22},
	punchcolor = {237, 187, 138} ,
	name = "MARIO",
	maxjumps = 2,
	jumpheight = 12,
	fallspeed = .45,
	strenght = 4,
	groundspeed = 7,
	airspeed = 5,
	weight = 125,
	traction = .25,
	size = {x = 48, y = 48},
	punchsize = {x = 32, y = 33},
	extras = {x = 0, y = -19},
	sprite = love.graphics.newImage("graphics/mario.png"),
	spritepunch = love.graphics.newImage("graphics/mariopunch.png"),
	spriteextras = love.graphics.newImage("graphics/marioextras.png"),
	mini = love.graphics.newImage("graphics/mariomini.png"),
	hurt = love.audio.newSource("sounds/hurtmario.wav","static"),
	die = love.audio.newSource("sounds/diemario.wav","static"),
	attack= love.audio.newSource("sounds/hitmario.wav","static"),
	--jump = love.audio.newSource("sounds/jmario.wav","static"),
	chose= love.audio.newSource("sounds/chmario.wav","static"),
	chant= love.audio.newSource("sounds/chantmario.wav","static")}
table.insert(chars,mario)


link = {color = {34, 139, 34},
	punchcolor = {145, 145, 145} ,
	name = "LINK",
	maxjumps = 2,
	jumpheight = 7,
	fallspeed = .45,
	strenght = 5,
	groundspeed = 6,
	airspeed = 5,
	weight = 125,
	traction = .25,
	size = {x = 48, y = 48},
	punchsize = {x = 80, y = 27},
	sprite = love.graphics.newImage("graphics/link.png"),
	spritepunch = love.graphics.newImage("graphics/linkpunch.png"),
	mini = love.graphics.newImage("graphics/linkmini.png"),
	hurt = love.audio.newSource("sounds/hurtlink.wav","static"),
	die = love.audio.newSource("sounds/dielink.wav","static"),
	attack= love.audio.newSource("sounds/hitlink.wav","static"),
	--jump = love.audio.newSource("sounds/jlink.wav","static"),
	chose= love.audio.newSource("sounds/chlink.wav","static"),
	chant= love.audio.newSource("sounds/chantlink.wav","static")}
table.insert(chars,link)

samus = {color = {255, 128, 0},
	punchcolor = {67, 86, 125} ,
	name = "SAMUS",
	maxjumps = 2,
	jumpheight = 8,
	fallspeed = .35,
	strenght = 6,
	groundspeed = 6,
	airspeed = 6,
	weight = 130,
	traction = .25,
	size = {x = 48, y = 48},
	punchsize = {x = 66, y = 27},
	sprite = love.graphics.newImage("graphics/samus.png"),
	spritepunch = love.graphics.newImage("graphics/samuspunch.png"),
	mini = love.graphics.newImage("graphics/samusmini.png"),
	hurt = love.audio.newSource("sounds/hurtsamus.wav","static"),
	die = love.audio.newSource("sounds/diesamus.wav","static"),
	attack= love.audio.newSource("sounds/hitsamus.wav","static"),
	--jump = love.audio.newSource("sounds/jsamus.wav","static"),
	chose= love.audio.newSource("sounds/chsamus.wav","static"),
	chant= love.audio.newSource("sounds/chantsamus.wav","static")}
table.insert(chars,samus)

yoshi = {color = {16, 211, 4},
	punchcolor = {245, 47, 83} ,
	name = "YOSHI",
	maxjumps = 2,
	jumpheight = 10,
	fallspeed = .45,
	strenght = 5,
	groundspeed = 6,
	airspeed = 7,
	weight = 120,
	traction = .25,
	size = {x = 48, y = 48},
	punchsize = {x = 63, y = 13},
	extras = {x = -15, y = -9},
	sprite = love.graphics.newImage("graphics/yoshi.png"),
	spritepunch = love.graphics.newImage("graphics/yoshipunch.png"),
	spriteextras = love.graphics.newImage("graphics/yoshiextras.png"),
	mini = love.graphics.newImage("graphics/yoshimini.png"),
	hurt = love.audio.newSource("sounds/hurtyoshi.wav","static"),
	die = love.audio.newSource("sounds/dieyoshi.wav","static"),
	attack= love.audio.newSource("sounds/hityoshi.wav","static"),
	--jump = love.audio.newSource("sounds/jyoshi.wav","static"),
	chose= love.audio.newSource("sounds/chyoshi.wav","static"),
	chant= love.audio.newSource("sounds/chantyoshi.wav","static")}
table.insert(chars,yoshi)

kirby = {color = {239, 187, 204},
	punchcolor = {239, 187, 204} ,
	name = "KIRBY",
	maxjumps = 5,
	jumpheight = 5,
	fallspeed = .35,
	strenght = 3,
	groundspeed = 4,
	airspeed = 3,
	weight = 78,
	traction = .25,
	size = {x = 32, y = 32},
	punchsize = {x = 18, y = 17},
	sprite = love.graphics.newImage("graphics/kirby.png"),
	spritepunch = love.graphics.newImage("graphics/kirbypunch.png"),
	mini = love.graphics.newImage("graphics/kirbymini.png"),
	hurt = love.audio.newSource("sounds/hurtkirby.wav","static"),
	die = love.audio.newSource("sounds/diekirby.wav","static"),
	attack = love.audio.newSource("sounds/hitkirby.wav","static"),
	--jump = love.audio.newSource("sounds/jkirby.wav","static"),
	chose= love.audio.newSource("sounds/chkirby.wav","static"),
	chant= love.audio.newSource("sounds/chantkirby.wav","static")}
table.insert(chars,kirby)


pikachu = {color = {200, 200, 22},
	punchcolor = {200, 200, 22} ,
	name = "PIKACHU",
	maxjumps = 2,
	jumpheight = 12,
	fallspeed = .35,
	strenght = 3,
	groundspeed = 8,
	airspeed = 7,
	weight = 105,
	traction = .125,
	size = {x = 32, y = 32},
	punchsize = {x = 32, y = 29},
	extras = {x = -14, y = -15},
	sprite = love.graphics.newImage("graphics/pika.png"),
	spritepunch = love.graphics.newImage("graphics/pikapunch.png"),
	spriteextras = love.graphics.newImage("graphics/pikaextras.png"),
	mini = love.graphics.newImage("graphics/pikamini.png"),
	hurt = love.audio.newSource("sounds/hurtpika.wav","static"),
	die = love.audio.newSource("sounds/diepika.wav","static"),
	attack= love.audio.newSource("sounds/hitpika.wav","static"),
	--jump = love.audio.newSource("sounds/jpika.wav","static"),
	chose= love.audio.newSource("sounds/chpika.wav","static"),
	chant= love.audio.newSource("sounds/chantpika.wav","static")}
table.insert(chars,pikachu)


dk = {color = {100, 50, 0},
	name = "DONKEY KONG",
	punchcolor = {237, 187, 138} ,
	maxjumps = 2,
	jumpheight = 10,
	fallspeed = .55,
	strenght = 10,
	groundspeed = 5,
	airspeed = 4,
	weight = 150,
	traction = .25,
	size = {x = 64, y = 64},
	punchsize = {x = 32, y = 31},
	sprite = love.graphics.newImage("graphics/dk.png"),
	spritepunch = love.graphics.newImage("graphics/dkpunch.png"),
	mini = love.graphics.newImage("graphics/dkmini.png"),
	hurt = love.audio.newSource("sounds/hurtdk.wav","static"),
	die = love.audio.newSource("sounds/diedk.wav","static"),
	attack= love.audio.newSource("sounds/hitdk.wav","static"),
	--jump = love.audio.newSource("sounds/jdk.wav","static"),
	chose= love.audio.newSource("sounds/chdk.wav","static"),
	chant= love.audio.newSource("sounds/chantdk.wav","static")}
table.insert(chars,dk)



