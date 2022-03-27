function update (elapsed)
local currentBeat = (songPos / 1000)*(bpm/60)
    if curStep > 600 and curStep < 705 then
        setHudZoom(5)
    end
end
        
        
function stepHit (step)
	if step == 584 then
        showOnlyStrums = true
        for i=0,7 do
			tweenFadeOut(i,0,0.6)
		end
    end
        if step == 605 then
            showOnlyStrums = false
            for i=0,7 do
                tweenFadeIn(i,1,0.6)
            end
        end
end

function playerTwoTurn()
    tweenZoom(camera,1.3,0.1)
end

function playerOneTurn()
    tweenZoom(camera,0.70,0.1)
end