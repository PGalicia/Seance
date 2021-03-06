--first we must require the entity library 
require("entities.code.Entity")
require("entities.code.bullet")
--[[
now we will define our entity as a table
our entity definition will be a table telling us everything we need to know about this entity
such as it's image
--]]

testent = {}


function testent.load()
	testent.phys = true --whether the entity can fall or not
	testent.img = love.graphics.newImage("entities/img/frankenstein_idle6.png")--the image that entity will display
	--testent.width = 32 --used for horizontal collision (coming soon)
	--testent.height = 32 --used for vertical collision
	--Lets put the entity in the game on the entity's load function
	franken = entity.spawn(testent, 256, 256,128,128)
  	table.insert(entity.getEntities(), franken)
end

function testent.update(dt)
	entity.update(franken, dt)
	--[[
  if entity.checkForMouseDown(franken) == true then
		franken = nil
		print("It's gone!")
	end
  ]]
end

function testent.draw()
	entity.draw(franken)
end
