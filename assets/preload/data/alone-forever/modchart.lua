function setDefault(id)
	_G['defaultStrum'..id..'X'] = defaultX(id)
	_G['defaultStrum'..id..'Y'] = defaultY(id)
	setActorAngle(0,id)
	x0 = getActorX(0)
	x1 = getActorX(1)
	x2 = getActorX(2)
	x3 = getActorX(3)
	x4 = getActorX(4)
	x5 = getActorX(5)
	x6 = getActorX(6)
	x7 = getActorX(7)
	
	y0 = getActorY(0)
	y1 = getActorY(1)
	y2 = getActorY(2)
	y3 = getActorY(3)
	y4 = getActorY(4)
	y5 = getActorY(5)
	y6 = getActorY(6)
	y7 = getActorY(7)
end

function swap1()
	tweenPos(0, 50, 444, 2)
	tweenAngle(0, 45, 2)
	tweenPos(4, 690, 444, 2)
	tweenAngle(4, 45, 2)
	tweenPos(7, 1026, 444, 2)
	tweenAngle(7, -45, 2)
	tweenPos(3, 386, 444, 2)
	tweenAngle(3, -45, 2)
end


function swap2()
	tweenPos(1, 386, 555, 2)
	tweenPos(6, 914, 555, 2)
	tweenAngle(0, 0, 2)
	tweenPos(0, 274, 555, 2)
	tweenPos(4, 50, 555, 2)
	tweenPos(7, 1026, 555, 2)
	tweenAngle(4, 0, 2)
	tweenPos(3, 802, 555, 2)
	tweenAngle(3, 0, 2)
	tweenPos(2, 690, 555, 2)
	tweenAngle(7, 0, 2)
	tweenPos(5, 162, 555, 2)
end

function swap3()
	tweenPos(5, 386, 555, 2)
	tweenPos(2, 914, 555, 2)
	tweenPos(4, 274, 555, 2)
	tweenPos(0, 50, 555, 2)
	tweenPos(7, 802, 555, 2)
	tweenPos(3, 1026, 555, 2)
	tweenPos(6, 690, 555, 2)
	tweenPos(1, 162, 555, 2)
end

function swap4()
	tweenPos(1, 386, -555, 2)
	tweenPos(6, 690, 555, 2)
	tweenPos(0, 274, -555, 2)
	tweenPos(4, 50, 555, 2)
	tweenPos(7, 1026, 555, 2)
	tweenPos(3, 802, -555, 2)
	tweenPos(2, 690, -555, 2)
	tweenPos(5, 386, 555, 2)
end

function swap1flip()
	tweenPos(0, 50, 161, 2)
	tweenAngle(0, -45, 2)
	tweenPos(4, 690, 161, 2)
	tweenAngle(4, -45, 2)
	tweenPos(7, 1026, 161, 2)
	tweenAngle(7, 45, 2)
	tweenPos(3, 386, 161, 2)
	tweenAngle(3, 45, 2)
end


function swap2flip()
	tweenPos(1, 386, 50, 2)
	tweenPos(6, 914, 50, 2)
	tweenAngle(0, 0, 2)
	tweenPos(0, 274, 50, 2)
	tweenPos(4, 50, 50, 2)
	tweenPos(7, 1026, 50, 2)
	tweenAngle(4, 0, 2)
	tweenPos(3, 802, 50, 2)
	tweenAngle(3, 0, 2)
	tweenPos(2, 690, 50, 2)
	tweenAngle(7, 0, 2)
	tweenPos(5, 162, 50, 2)
end

function swap3flip()
	tweenPos(5, 386, 50, 2)
	tweenPos(2, 914, 50, 2)
	tweenPos(4, 274, 50, 2)
	tweenPos(0, 50, 50, 2)
	tweenPos(7, 802, 50, 2)
	tweenPos(3, 1026, 50, 2)
	tweenPos(6, 690, 50, 2)
	tweenPos(1, 162, 50, 2)
end

function swap4flip()
	tweenPos(1, 386, 999, 2)
	tweenPos(6, 690, 50, 2)
	tweenPos(0, 274, 999, 2)
	tweenPos(4, 50, 50, 2)
	tweenPos(7, 1026, 50, 2)
	tweenPos(3, 802, 999, 2)
	tweenPos(2, 690, 999, 2)
	tweenPos(5, 386, 50, 2)
end

function update(elapsed)
    local currentBeat = (songPos / 1000)*(bpm/60)
	for i = 0, getNumberOfNotes() do
		local note = _G['note_' ..i]
		-- mess with property's
		-- note.x = 1, note.y = 30, etc.
	end
	
end
