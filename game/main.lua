function love.load()
	GameFont = love.graphics.newFont("assets/fonts/BalonkuRegular.otf", 72)
	NormalFont = love.graphics.newFont("assets/fonts/BadUnicorn.ttf", 32)
	MenuCatPic = love.graphics.newImage("assets/Cats.png")
	IsGameStarted = false
	GameJoyStick = nil
	CursorX = 0
    CursorY = 0
end

function love.update()
	print("Hello!")

	if GameJoyStick ~= nil then
		CursorX = CursorX + GameJoyStick:getGamepadAxis("leftx")
        CursorY = CursorY + GameJoyStick:getGamepadAxis("lefty")
		print("CursorX: " .. CursorX)
		print("CursorY: " .. CursorY)
	end
end

function love.gamepadpressed(joystick, button)
	if GameJoyStick == nil then
		GameJoyStick = joystick
	end
	if button == "start" then
		IsGameStarted = true
	end
end

function love.draw()
	local width, height = love.graphics.getDimensions()
	love.graphics.draw(MenuCatPic, 0, 0)
	love.graphics.print('Eepy Cats', GameFont, width / 9, height / 6, 0)
	love.graphics.print('Press START Button', NormalFont, width / 9, height / 3, 0)

	if IsGameStarted then
		love.graphics.clear(0.1, 0.1, 0.1, 1)
		love.graphics.circle("line", width / 2, height / 2, 30)
	end
end
