function start (song)
	setActorX(defaultStrum0X,4,'setDefault')
    setActorX(defaultStrum1X,5,'setDefault')
    setActorX(defaultStrum2X,6,'setDefault')
    setActorX(defaultStrum3X,7,'setDefault')
    setActorX(defaultStrum4X,0,'setDefault')
    setActorX(defaultStrum5X,1,'setDefault')
    setActorX(defaultStrum6X,2,'setDefault')
    setActorX(defaultStrum7X,3,'setDefault')
    tweenFadeOut('camHUD',0,0.1)
    tweenFadeOut('boyfriend',0,0.1)
    tweenFadeOut('camNotes',0,0.1)
end
function update(elapsed)
    local currentBeat = (songPos / 1000)*(bpm/60) 
end

function stepHit (step)
    if step == 320 then
        tweenFadeIn('camHUD',1,10)
        tweenFadeIn('camNotes',1,10)
        tweenFadeIn('boyfriend',1,10)
    end
end