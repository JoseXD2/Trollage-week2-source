function setDefault(id)
	_G['defaultStrum'..id..'X'] = getActorX(id)
	_G['defaultStrum'..id..'Y'] = getActorY(id)
	_G['defaultStrum'..id..'Z'] = getActorAngle(id)	
	setActorAngle(0,id)
end

function update(elapsed)
    local currentBeat = (songPos / 1000)*(bpm/60)
end

function stepHit (step)
    if step == 1 then
        changeDadCharacter("whittyCrazy")
        changeDadCharacter("whitty")
    end
    if step == 1312 then
        changeDadCharacter("whittyCrazy")
    end
end