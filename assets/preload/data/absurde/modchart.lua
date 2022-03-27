normal = false

weee = false
fuckyou = false
nowee = false
nomorefuckyou = false
weeemore = false



function update (elapsed)
local currentBeat = (songPos / 1000)*(bpm/60)
for i=0,17 do
    setActorAngle(getActorAngle(i) + 20, i)
end
    if weee then
        camHudAngle = -45 * math.sin(currentBeat * 0.25)
        cameraAngle = 45 * math.sin(currentBeat * 0.25)
    end
    if weeemore then
        camHudAngle = -400 * math.sin(currentBeat * 0.25) - 180
        cameraAngle = 400 * math.sin(currentBeat * 0.25) + 180
    end
    if noweee then
        camHudAngle = 0
        cameraAngle = 0
    end
    if fuckyou then
        for i=9,17 do
            setActorX(_G['defaultStrum'..i..'X'] - 300 * math.sin((currentBeat + i*0.5)) - 275, i)
            setActorY(_G['defaultStrum'..i..'Y'] - 100 * math.sin((currentBeat + i*2)), i)
        end
        for i=0,8 do
            setActorX(_G['defaultStrum'..i..'X']  + 300 * math.sin((currentBeat + i*0.025)) + 275, i)
        end
    end
    if nomorefuckyou then
        for i=9,17 do
            setActorX(_G['defaultStrum'..i..'X'], i)
        end
        for i=0,8 do
            setActorX(_G['defaultStrum'..i..'X'], i)
        end
    end
end


function stepHit (step)
	if step == 288 then
		weee = true
        setActorX(defaultStrum9X,17,'setDefault')
        setActorX(defaultStrum10X,16,'setDefault')
        setActorX(defaultStrum11X,15,'setDefault')
        setActorX(defaultStrum12X,14,'setDefault')
        setActorX(defaultStrum13X,13,'setDefault')
        setActorX(defaultStrum14X,12,'setDefault')
        setActorX(defaultStrum15X,11,'setDefault')
        setActorX(defaultStrum16X,10,'setDefault')
        setActorX(defaultStrum17X,9,'setDefault')
    end
    if step == 1056 then
        fuckyou = true
        strumLine1Visible = false
        for i=9,17 do
			tweenFadeOut(i,0.75,0.6)
		end
    end
    if step == 1985 then
        nomorefuckyou = true
        nowee = true
        wee = false
        fuckyou = false
        for i=0,8 do
			tweenFadeOut(i,1,0.6)
		end
    end
    if step == 2007 then
        camHudAngle = 180
    end
    if step == 2015 then
        weeemore = true
        nowee = false
    end
    if step == 2278 then
        fuckyou = true
        nomorefuckyou = false
        for i=0,8 do
			tweenFadeOut(i,0.25,0.6)
		end
    end
end