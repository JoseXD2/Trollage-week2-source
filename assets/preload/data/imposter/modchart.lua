function setDefault(id)
	_G['defaultStrum'..id..'X'] = getActorX(id)
	_G['defaultStrum'..id..'Y'] = getActorY(id)
	_G['defaultStrum'..id..'Z'] = getActorAngle(id)	
	setActorAngle(0,id)
end

function update(elapsed)
    local currentBeat = (songPos / 1000)*(bpm/60)
end

