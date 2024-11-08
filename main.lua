LARGURA_TELA = 502
ALTURA_TELA = 755
MAX_METEOROS = 10
FIM_JOGO = false
aviao_14bis = {
    src = "img/aviaoM.png",
    largura = 55,
    altura = 61,
    x = LARGURA_TELA/2 - 64/2,
    y = ALTURA_TELA - 60
}

meteoros = {}
function destroido()
    aviao_14bis.src = "img/explosao_nave.png"
    aviao_14bis.imagem = love.graphics.newImage(aviao_14bis.src)
    aviao_14bis.altura = 30
    aviao_14bis.largura = 30
end


function colisao(x1,y1,l1,a1,x2,y2,l2,a2)
    return x2 < x1 + l1 and
           x1 < x2 + l2 and
           y2 < y1 + a1 and
           y1 < y2 + a2
            
end
function i()
end
function removeMeteoros()
    for i = #meteoros, 1, -1 do
        if meteoros[i].y > ALTURA_TELA then
            table.remove(meteoros, i)
            MAX_METEOROS = MAX_METEOROS + 1
        end
    end
end

function criaMeteoro()
    meteoro = {
        x = math.random(LARGURA_TELA),
        y = -70,
        altura = 44,
        largura = 50,
        peso = math.random(5),
        deslocamento_horizontal = math.random(-2, 2)
    }
    table.insert(meteoros, meteoro)
end

function moveMeteoros()
    for k, meteoro in pairs(meteoros) do
        meteoro.y = meteoro.y + meteoro.peso
        meteoro.x = meteoro.x + meteoro.deslocamento_horizontal
    end
end

function move14bis()
    if love.keyboard.isDown('w') then
        aviao_14bis.y = aviao_14bis.y - 4
    end
    if love.keyboard.isDown('s') then
        aviao_14bis.y = aviao_14bis.y + 4
    end
    if love.keyboard.isDown('a') then
        aviao_14bis.x = aviao_14bis.x - 4
    end
    if love.keyboard.isDown('d') then
        aviao_14bis.x = aviao_14bis.x + 4
    end
end    
function checkCol()
    for h,meteoro in pairs(meteoros) do
    if colisao(meteoro.x,meteoro.y,meteoro.largura,meteoro.altura,aviao_14bis.x,aviao_14bis.y,aviao_14bis.largura,aviao_14bis.altura)   then
        destroido()
        FIM_JOGO = true
    end
end
end
function love.load()
    love.window.setMode(LARGURA_TELA, ALTURA_TELA, {resizable = false})
    love.window.setTitle("aviator")

    math.randomseed(os.time())

    background = love.graphics.newImage("img/fundo.png")
    aviao_14bis.imagem = love.graphics.newImage(aviao_14bis.src)
    meteoro_img = love.graphics.newImage("img/meteoro.png")
end

function love.update(dt)
    if not FIM_JOGO then
        if love.keyboard.isDown('w', 'a', 's', 'd') then
            move14bis()
        end
        removeMeteoros()
        if #meteoros < MAX_METEOROS then
            criaMeteoro()
        end
        moveMeteoros()
        checkCol()
    end
end

function love.draw()
    love.graphics.draw(background, 0, 0)
    love.graphics.draw(aviao_14bis.imagem, aviao_14bis.x, aviao_14bis.y)
    
    for k, meteoro in pairs(meteoros) do
        love.graphics.draw(meteoro_img, meteoro.x, meteoro.y) 
    end
end