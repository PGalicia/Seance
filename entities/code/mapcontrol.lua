map = {}

function map.load()
    local tmap = require("entities/map/map")

    Tileset = love.graphics.newImage('entities/map/dungeon.png')
	TileW, TileH = 192, 192
	tilesetW, tilesetH = Tileset:getWidth(), Tileset:getHeight()
	Quads = {}
	Quads [1] = love.graphics.newQuad (0,0,TileW, TileH, tilesetW, tilesetH)
	Quads [2] = love.graphics.newQuad (192,0,TileW, TileH, tilesetW, tilesetH)
	Quads [3] = love.graphics.newQuad (384,0,TileW,TileH,tilesetW,tilesetH)
    Quads [4] = love.graphics.newQuad (0,192,TileW, TileH, tilesetW, tilesetH)
    Quads [5] = love.graphics.newQuad (192,192,TileW, TileH, tilesetW, tilesetH)
    Quads [6] = love.graphics.newQuad (384,192,TileW,TileH,tilesetW,tilesetH)
    Quads [7] = love.graphics.newQuad (0,384,TileW, TileH, tilesetW, tilesetH)
    Quads [8] = love.graphics.newQuad (192,384,TileW, TileH, tilesetW, tilesetH)
    Quads [9] = love.graphics.newQuad (384,384,TileW,TileH,tilesetW,tilesetH)

    local data = tmap.layers[1].data

    --[[TileTable2 = data = {
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 5, 5, 5, 5, 5, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 5, 5, 5, 5, 5, 5, 5, 1, 2, 2, 2, 3, 1, 2, 2, 2, 3, 1, 2, 2, 2, 2, 2, 2, 2, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 4, 5, 5, 5, 5, 5, 5, 5, 5, 6, 4, 5, 5, 5, 5, 5, 5, 5, 5, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 5, 5, 5, 5, 5, 5, 5, 4, 5, 5, 5, 5, 4, 5, 5, 5, 6, 4, 5, 5, 5, 5, 5, 5, 5, 5, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 8, 8, 8, 8, 8, 8, 8, 8, 9, 5, 5, 5, 5, 5, 5, 5, 4, 5, 5, 5, 5, 7, 8, 8, 8, 9, 7, 8, 8, 8, 8, 8, 8, 5, 5, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 4, 5, 5, 5, 5, 5, 5, 5, 5, 6, 1, 2, 2, 2, 3, 2, 2, 2, 2, 2, 2, 2, 2, 3, 5, 5, 4, 5, 5, 5, 5, 1, 2, 2, 2, 3, 1, 2, 2, 2, 2, 2, 2, 5, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 4, 5, 5, 5, 5, 5, 5, 5, 5, 6, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 5, 5, 4, 5, 5, 5, 5, 5, 5, 5, 5, 6, 4, 5, 5, 5, 5, 5, 5, 5, 5, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 4, 5, 5, 5, 5, 5, 5, 5, 5, 6, 4, 5, 5, 5, 6, 5, 5, 5, 5, 5, 5, 5, 5, 6, 5, 5, 4, 5, 5, 5, 5, 5, 5, 5, 5, 6, 4, 5, 5, 5, 5, 5, 5, 5, 5, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 4, 5, 5, 5, 5, 5, 5, 5, 5, 6, 4, 5, 5, 5, 6, 5, 5, 5, 5, 5, 5, 5, 5, 6, 5, 5, 4, 5, 5, 5, 5, 5, 5, 5, 5, 6, 4, 5, 5, 5, 5, 5, 5, 5, 5, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 7, 8, 8, 8, 9, 5, 5, 5, 5, 6, 7, 5, 8, 8, 9, 5, 5, 5, 5, 5, 5, 5, 5, 6, 5, 5, 7, 8, 8, 8, 8, 5, 5, 8, 8, 9, 7, 8, 8, 5, 5, 8, 8, 8, 8, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 2, 2, 2, 2, 3, 5, 5, 5, 5, 6, 1, 5, 2, 2, 3, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 2, 2, 2, 2, 5, 5, 2, 2, 2, 2, 2, 2, 5, 5, 2, 2, 2, 2, 5, 1, 2, 2, 2, 2, 2, 2, 0, 0},
        {0, 0, 0, 0, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 0, 0},
        {0, 0, 0, 0, 0, 8, 8, 8, 8, 9, 7, 8, 8, 8, 9, 7, 8, 8, 8, 9, 8, 8, 8, 8, 8, 8, 8, 8, 9, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 0, 0},
        {0, 0, 0, 0, 0, 1, 2, 2, 2, 2, 2, 2, 2, 2, 3, 1, 2, 3, 1, 2, 2, 3, 1, 2, 2, 2, 2, 2, 3, 5, 5, 1, 2, 2, 2, 2, 2, 3, 1, 2, 2, 2, 3, 1, 2, 2, 5, 5, 3, 5, 5, 4, 5, 5, 5, 5, 5, 5, 0, 0},
        {0, 0, 0, 0, 0, 4, 5, 5, 5, 5, 5, 5, 5, 5, 6, 4, 5, 5, 5, 5, 5, 6, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 4, 5, 5, 5, 6, 4, 5, 5, 5, 5, 6, 5, 5, 4, 5, 5, 5, 5, 5, 5, 0, 0},
        {0, 0, 0, 0, 0, 4, 5, 5, 5, 5, 5, 5, 5, 5, 6, 4, 5, 5, 5, 5, 5, 6, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 7, 8, 5, 8, 9, 4, 5, 5, 5, 5, 6, 5, 5, 4, 5, 5, 5, 5, 5, 5, 0, 0},
        0, 0, 0, 0, 0, 4, 5, 5, 5, 5, 5, 5, 5, 5, 6, 4, 5, 5, 7, 8, 8, 9, 4, 5, 5, 5, 5, 5, 6, 5, 5, 4, 5, 5, 5, 5, 5, 6, 1, 2, 5, 2, 3, 4, 5, 5, 5, 5, 6, 5, 5, 4, 5, 5, 5, 5, 5, 5, 0, 0,
        0, 0, 0, 0, 0, 4, 5, 5, 5, 5, 5, 5, 5, 5, 6, 4, 5, 5, 1, 2, 2, 3, 4, 5, 5, 5, 5, 5, 6, 5, 5, 4, 5, 5, 5, 5, 5, 6, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 5, 5, 4, 5, 5, 5, 5, 5, 5, 0, 0,
        0, 0, 0, 0, 0, 4, 5, 5, 5, 5, 5, 5, 5, 5, 6, 4, 5, 5, 5, 5, 5, 6, 7, 8, 8, 8, 9, 5, 6, 5, 5, 4, 5, 5, 5, 5, 5, 6, 4, 5, 5, 5, 6, 4, 5, 5, 5, 5, 6, 5, 5, 7, 5, 5, 8, 8, 8, 8, 0, 0,
        0, 0, 0, 0, 0, 4, 5, 5, 5, 5, 5, 5, 5, 5, 6, 4, 5, 5, 5, 5, 5, 6, 1, 2, 2, 2, 3, 5, 6, 5, 5, 4, 5, 5, 5, 5, 5, 6, 4, 5, 5, 5, 6, 4, 5, 5, 5, 5, 6, 5, 5, 1, 5, 5, 2, 2, 2, 2, 0, 0,
        0, 0, 0, 0, 0, 4, 5, 5, 5, 5, 5, 5, 5, 5, 6, 4, 5, 5, 5, 5, 5, 6, 4, 5, 5, 5, 5, 5, 6, 5, 5, 4, 5, 5, 5, 5, 5, 6, 4, 5, 5, 5, 6, 4, 5, 5, 5, 5, 6, 5, 5, 4, 5, 5, 5, 5, 5, 5, 0, 0,
        0, 0, 0, 0, 0, 4, 5, 5, 5, 5, 5, 5, 5, 5, 6, 4, 5, 5, 5, 5, 5, 6, 4, 5, 5, 5, 5, 5, 6, 5, 5, 7, 8, 8, 8, 8, 8, 9, 7, 8, 8, 8, 9, 7, 8, 8, 8, 8, 9, 5, 5, 4, 5, 5, 5, 5, 5, 5, 0, 0,
        0, 0, 0, 0, 0, 7, 8, 8, 8, 5, 5, 8, 8, 8, 9, 7, 8, 5, 5, 8, 8, 9, 7, 8, 8, 8, 8, 8, 9, 5, 5, 5, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 5, 5, 4, 5, 5, 5, 5, 5, 5, 0, 0,
        0, 0, 0, 0, 0, 1, 2, 2, 2, 5, 5, 2, 2, 2, 3, 1, 2, 5, 5, 2, 2, 2, 2, 2, 2, 2, 2, 2, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 4, 5, 5, 5, 5, 5, 5, 0, 0,
        0, 0, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 7, 8, 8, 8, 8, 8, 8, 0, 0,
        0, 0, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 8, 8, 8, 8, 5, 5, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 5, 5, 1, 2, 2, 2, 2, 2, 2, 0, 0,
        0, 0, 5, 5, 5, 8, 8, 8, 8, 5, 5, 8, 8, 8, 9, 7, 5, 5, 8, 8, 8, 8, 8, 8, 8, 8, 8, 5, 5, 5, 5, 1, 2, 2, 2, 5, 5, 2, 3, 1, 2, 2, 2, 2, 3, 1, 2, 2, 3, 5, 5, 5, 5, 5, 5, 5, 5, 5, 0, 0,
        0, 0, 5, 5, 6, 1, 2, 2, 2, 5, 5, 2, 2, 2, 3, 1, 5, 5, 2, 2, 2, 2, 2, 2, 2, 2, 3, 4, 5, 5, 6, 4, 5, 5, 5, 5, 5, 5, 6, 4, 5, 5, 5, 5, 5, 5, 5, 5, 6, 5, 5, 5, 5, 5, 5, 5, 5, 5, 0, 0,
        0, 0, 5, 5, 6, 4, 5, 5, 5, 5, 5, 5, 5, 5, 6, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 4, 5, 5, 6, 4, 5, 5, 5, 5, 5, 5, 6, 4, 5, 5, 5, 5, 5, 5, 5, 5, 6, 5, 5, 4, 5, 5, 5, 5, 5, 5, 0, 0,
        0, 0, 5, 5, 6, 4, 5, 5, 5, 5, 5, 5, 5, 5, 6, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 4, 5, 5, 6, 4, 5, 5, 5, 5, 5, 5, 6, 4, 5, 5, 5, 5, 5, 5, 5, 5, 6, 5, 5, 4, 5, 5, 5, 5, 5, 5, 0, 0,
        0, 0, 8, 8, 9, 4, 5, 5, 5, 5, 5, 5, 5, 5, 6, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 4, 5, 5, 6, 7, 5, 5, 8, 8, 8, 8, 6, 7, 8, 8, 8, 8, 9, 5, 5, 5, 6, 5, 5, 4, 5, 5, 7, 8, 8, 8, 0, 0,
        0, 0, 0, 0, 0, 4, 5, 5, 5, 5, 5, 5, 5, 5, 6, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 9, 7, 5, 5, 6, 1, 5, 5, 2, 2, 2, 2, 3, 1, 2, 2, 2, 2, 3, 5, 5, 5, 6, 5, 5, 4, 5, 5, 1, 2, 2, 2, 0, 0,
        0, 0, 0, 0, 0, 4, 5, 5, 5, 5, 5, 5, 5, 5, 6, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 4, 5, 5, 5, 5, 5, 5, 6, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 4, 5, 5, 5, 5, 5, 5, 0, 0,
        0, 0, 0, 0, 0, 4, 5, 5, 5, 5, 5, 5, 5, 5, 6, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 4, 5, 5, 5, 5, 5, 5, 6, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 4, 5, 5, 5, 5, 5, 5, 0, 0,
        0, 0, 0, 0, 0, 4, 5, 5, 5, 5, 5, 5, 5, 5, 6, 7, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 9, 7, 5, 5, 6, 7, 8, 8, 8, 8, 8, 8, 9, 7, 8, 8, 8, 8, 9, 7, 8, 8, 9, 5, 5, 7, 8, 8, 7, 8, 8, 8, 0, 0,
        0, 0, 0, 2, 2, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 5, 5, 5, 5, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 5, 5, 6, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 8, 8, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 9, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 4, 5, 5, 5, 5, 5, 5, 5, 5, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 4, 5, 5, 5, 5, 5, 5, 5, 5, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 4, 5, 5, 5, 5, 5, 5, 5, 5, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 4, 5, 5, 5, 5, 5, 5, 5, 5, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 4, 5, 5, 5, 5, 5, 5, 5, 5, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 7, 8, 8, 8, 5, 5, 8, 8, 8, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    }--]]

    TileTable2 = {}
    for i = 1, tmap.height do
        for j = 1, tmap.width do
            TileTable2[i] = {}
            local index = (i * tmap.height + (j - 1) - tmap.width) + 1
            TileTable2[i][j] = data[index]
        end
    end

	TileTable = {
        {3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3},
        {3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3},
        {3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3},
        {3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3},
        {3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3},
        {3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3},
        {3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3},
        {3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3},
        {3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3},
        {3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3},
        {3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,1,1,1,1},
        {3,3,3,3,3,3,1,3,3,3,3,3,3,3,3,3,3,3,3,3,3,4,4,4,4},
        {1,1,1,1,3,1,2,1,3,3,3,3,3,3,3,3,3,3,3,3,3,6,6,6,6},
        {2,2,2,2,1,2,2,2,1,3,3,3,3,3,3,3,3,3,3,3,1,6,6,6,6},
        {2,2,2,2,2,2,2,2,2,1,1,1,1,1,1,1,1,1,1,1,2,6,6,6,6},
        {4,4,4,4,4,4,4,4,4,2,2,2,2,2,2,2,2,2,2,2,4,6,6,6,6},
        {6,6,6,6,6,6,6,6,6,4,4,4,4,4,4,4,4,4,4,4,6,6,6,6,6},
        {6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6},
        {5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5},
	}
	
end

function map.update()

end

function map.draw()
    love.graphics.scale(0.25)
    love.graphics.setColor(255,255,255)

	for rowIndex=1, #TileTable2 do
        local row = TileTable2[rowIndex]
        for columnIndex=1, #row do
            local number = row[columnIndex]
            love.graphics.draw(Tileset, Quads[number], (columnIndex-1)*TileW, (rowIndex-1)*TileH)
        end
    end
    
end


