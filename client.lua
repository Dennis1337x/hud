local screen = Vector2(guiGetScreenSize())
local w, h = 550, 300
local x, y = (screen.x-w), (screen.y-h)

local awesome = dxCreateFont('assets/fontawesomebrands.ttf', 45)
local awesome2 = dxCreateFont('assets/fontawesome.ttf', 17)
local awesome4 = dxCreateFont('assets/fontawesome.ttf', 21)
local awesome3 = dxCreateFont('assets/fontawesome2.otf', 25)
local bold = dxCreateFont('assets/sfbold.ttf', 17)
local bold2 = dxCreateFont('assets/sfbold.ttf', 35)

setTimer(function()
if getElementData(localPlayer, "loggedin") == 1 then
	local can = getElementHealth(getLocalPlayer()) or 100
	local zirh = getPedArmor(getLocalPlayer()) or 100
	local yemek = getElementData(getLocalPlayer(), "hunger")
	local su = getElementData(getLocalPlayer(), "thirst")
	
    dxDrawRoundedRectangle("1",23,y+256,130,35,5,tocolor(0,0,0,255))
    dxDrawRoundedRectangle("1",158,y+256,130,35,5,tocolor(0,0,0,255))
	dxDrawRoundedRectangle("1",23,y+256,w*can/3000/0.1405,35,5,tocolor(15,231,157,255))
    if zirh > 0 then dxDrawRoundedRectangle("1",158,y+256,w*zirh/3000/0.1405,35,5,tocolor(0,0,0,255)) end
    
    dxDrawRoundedRectangle("1",23,y+196,50,50,0,tocolor(0,0,0,255))
    dxDrawRoundedRectangle("1",23,y+245,50,3,0,tocolor(175,175,175,255))
    dxDrawText("",36,y+205,50,2,tocolor(255,255,255,255),1,awesome2)

    dxDrawRoundedRectangle("1",78,y+210,w*yemek/3000/0.50,37,5,tocolor(179,91,2,255))
    dxDrawRoundedRectangle("1",122,y+210,w*su/3000/0.50,37,5,tocolor(2,90,178,255))
    dxDrawRoundedRectangle("1",164,y+210,37,37,5,tocolor(13,142,187,255))

    dxDrawText("",87,y+219,50,2,tocolor(249,252,253,255),0.6,awesome2)
    dxDrawText("",133,y+219,50,2,tocolor(249,252,253,255),0.6,awesome2)
    dxDrawText("",176,y+219,50,2,tocolor(249,252,253,255),0.6,awesome2)

    dxDrawText("",80,y+265,50,2,tocolor(249,252,253,255),0.6,awesome2)
    dxDrawText("",215,y+265,50,2,tocolor(249,252,253,255),0.6,awesome2)

    dxDrawText("",215,y+219,50,2,tocolor(217,13,12,255),0.6,awesome2)
    dxDrawText(exports.global:formatMoney(getElementData(localPlayer,"money")).." ₺",239,y+218,50,2,tocolor(195,195,195,255),0.6,bold)
end
end,0,0)

function getCompass ( )
    local _, _2, rot = getElementRotation(localPlayer)
    if rot <= 30 or rot >= (360 - 30) then
        return "K"
    elseif rot <= 120 and rot >= 60 then
        return "B"
    elseif rot <= 210 and rot >= 150 then
        return "G"
    elseif rot <= 300 and rot >= 240 then
        return "D"
    elseif rot >= 30 and rot <= 60 then
        return "KB"
    elseif rot >= 120 and rot <= 150 then
        return "GB"
    elseif rot >= 210 and rot <= 240 then
        return "GD"
    else
        return "KD"
    end
    return "nul"
end

local rounded = {};
function dxDrawRoundedRectangle(id,x, y, w, h, radius, color, post)
        if not rounded[id] then
            rounded[id] = {}
        end
        if not rounded[id][w] then
            rounded[id][w] = {}
        end
        if not rounded[id][w][h] then
            local path = string.format([[<svg width="%s" height="%s" viewBox="0 0 %s %s" fill="none" xmlns="http://www.w3.org/2000/svg"><rect opacity="1" width="%s" height="%s" rx="%s" fill="#FFFFFF"/></svg>]], w, h, w, h, w, h, radius)
            rounded[id][w][h] = svgCreate(w, h, path)
        end
        if rounded[id][w][h] then
            dxDrawImage(x, y, w, h, rounded[id][w][h], 0, 0, 0, color, (post or false))
        end
end 



local getZoneNameEx = getZoneName
function getZoneName(x, y, z, citiesonly)
    local zoneName = getZoneNameEx(x, y, z, citiesonly)
    if zoneName == "Unknown" then
        return ""
    elseif zoneName == "Santa Maria Beach" then
        return "Florya Sahil"
    elseif zoneName == "Verona Beach" then
        return "Florya Sahil"
    elseif zoneName == "Rodeo" then
        return "Yeşilköy"
    elseif zoneName == "Rıchman" then
        return "Akevler"
    elseif zoneName == "Rıchman" then
        return "Akevler"
    elseif zoneName == "Vinewood" then
        return "Etiler"
    elseif zoneName == "Market" then
        return "Etiler"
    elseif zoneName == "Sunrıse" then
        return "Etiler"
    elseif zoneName == "Market Statıon"then
        return "Etiler"
    elseif zoneName == "Mulholland" then
        return "Yeniköy"
    elseif zoneName == "Mulholland Intersectıon" then
        return "Yeniköy"
    elseif zoneName == "Downtown Los Santos" then
        return "Çatalca"
    elseif zoneName == "Commerce" then
        return "Çatalca"
    elseif zoneName == "Lıttle Mexıco" then
        return "Çatalca"
    elseif zoneName == "Conference Center" then
        return "Çatalca"
    elseif zoneName == "Pershıng Square" then
        return "Çatalca"
    elseif zoneName == "Glen Park" then
        return "Güngören"
    elseif zoneName == "Jefferson" then
        return "Güngören"
    elseif zoneName == "Idlewood" then
        return "Güngören"
    elseif zoneName == "Unıty Statıon" then
        return "Güngören"
    elseif zoneName == "El Corona" then
        return "Güngören"
    elseif zoneName == "Wıllow Fıeld" then
        return "Güngören"
    elseif zoneName == "East Los Santos" then
        return "Bağcılar"
    elseif zoneName == "Las Colınas" then
        return "Bağcılar"
    elseif zoneName == "Los Flores" then
        return "Bağcılar"
    elseif zoneName == "East Beach" then
        return "Bağcılar"
    elseif zoneName == "Ganton" then
        return "Bağcılar"
    elseif zoneName == "Northstar Rock" then
        return "BayramPaşa"
    elseif zoneName == "Palomıno Creek" then
        return "Kurtdoğmuş"
    elseif zoneName == "Hanky Panky Poınt" then
        return "Kurtdoğmuş"
    elseif zoneName == "Blueberry Acres" then
        return "Kartal Tepe"
    elseif zoneName == "Blueberry" then
        return "Kartal Tepe"
    elseif zoneName == "Playa Del Sevılle" then
        return "Liman"
    elseif zoneName == "Ocean Docks" then
        return "Liman"
    elseif zoneName == "Los Santos Internatıonal Aırport" then
        return "Atatürk Hava Limanı"
    elseif zoneName == "Verdant Bluffs" then
        return "Çamlıca Tepesi"
    else
        return "Bilinmeyen Bölge"
    end
end