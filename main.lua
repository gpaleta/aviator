aviao = {
    src = "imagens/14bis.png",
    largura = 64,
    altura = 64,
    x = 0,
    y = 0
}
function moviao()
    if love.keyboard.isDown("w")then
        aviao.y = aviao.y -1 
    end
    if love.keyboard.isDown("s")then
        aviao.y = aviao.y +1 
    end
    if love.keyboard.isDown("a")then
        aviao.x = aviao.x -1 
    end
    if love.keyboard.isDown("d")then
        aviao.x = aviao.x +1 
    end

end
function love.load()
    love.window.setMode(320,480,{resizable = false})
    love.window.setTitle("aviator")
    background = love.graphics.newImage("imagens/background.png")
    img = love.graphics.
end
function love.update(dt)
    if love.keyboard.isDown("w","s","a","d")then
        moviao()
    end

end
function love.draw()
    love.graphics.draw(background,0,0)
    love.graphics.draw(aviao.ima)
end