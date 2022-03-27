function stepHit (step)
    if step == 828 then
        playActorAnimation("dad","fall",false,false)
    end
end

function fadeOut()
    tweenPos(0, 50, -555, 5)
	tweenPos(1, 162, -555, 5)
    tweenPos(2, 274, -555, 5)
	tweenPos(3, 386, -555, 5)
    for i=0,3 do
        tweenFadeOut(i, 0, 5)
    end
end




function swap1 ()
    tweenPos(4, 1026, 555, 0.5)
	tweenPos(5, 914, 555, 0.5)
    tweenPos(6, 802, 555, 0.5)
	tweenPos(7, 690, 555, 0.5)
end
function swap2 ()
    tweenPos(4, 50, 555, 0.5)
	tweenPos(5, 162, 555, 0.5)
    tweenPos(6, 274, 555, 0.5)
	tweenPos(7, 386, 555, 0.5)
end
function swap3 ()
    tweenPos(4, 274, 555, 0.5)
	tweenPos(5, 386, 555, 0.5)
    tweenPos(6, 690, 555, 0.5)
	tweenPos(7, 914, 555, 0.5)
end
function swap4 ()
    tweenPos(4, 274, 555, 0.5)
	tweenPos(5, 386, 555, 0.5)
    tweenPos(6, 914, 555, 0.5)
	tweenPos(7, 1026, 555, 0.5)
end
function swap5 ()
    tweenPos(4, 914, 555, 0.5)
	tweenPos(5, 914, 555, 0.5)
    tweenPos(6, 802, 555, 0.5)
	tweenPos(7, 802, 555, 0.5)
end
function swap6 ()
    tweenPos(4, 1026, 555, 0.5)
	tweenPos(5, 1026, 555, 0.5)
    tweenPos(6, 1026, 555, 0.5)
	tweenPos(7, 1026, 555, 0.5)
end
function swap7 ()
    tweenPos(4, 1026, 555, 0.5)
	tweenPos(5, 802, 555, 0.5)
    tweenPos(6, 386, 555, 0.5)
	tweenPos(7, 50, 555, 0.5)
end
function swap8 ()
    tweenPos(4, 1026, 555, 0.5)
	tweenPos(5, 1026, 555, 0.5)
    tweenPos(6, 50, 555, 0.5)
	tweenPos(7, 50, 555, 0.5)
end
function swap9 ()
    tweenPos(4, 386, 555, 0.5)
	tweenPos(5, 274, 555, 0.5)
    tweenPos(6, 162, 555, 0.5)
	tweenPos(7, 50, 555, 0.5)
end
function swap0 ()
    tweenPos(4, 50, 555, 0.5)
	tweenPos(5, 50, 555, 0.5)
    tweenPos(6, 50, 555, 0.5)
	tweenPos(7, 50, 555, 0.5)
end


function swap1up ()
    tweenPos(4, 1026, 50, 0.5)
	tweenPos(5, 914, 50, 0.5)
    tweenPos(6, 802, 50, 0.5)
	tweenPos(7, 690, 50, 0.5)
end
function swap2up ()
    tweenPos(4, 50, 50, 0.5)
	tweenPos(5, 162, 50, 0.5)
    tweenPos(6, 274, 50, 0.5)
	tweenPos(7, 386, 50, 0.5)
end
function swap3up ()
    tweenPos(4, 274, 50, 0.5)
	tweenPos(5, 386, 50, 0.5)
    tweenPos(6, 690, 50, 0.5)
	tweenPos(7, 914, 50, 0.5)
end
function swap4up ()
    tweenPos(4, 274, 50, 0.5)
	tweenPos(5, 386, 50, 0.5)
    tweenPos(6, 914, 50, 0.5)
	tweenPos(7, 1026, 50, 0.5)
end
function swap5up ()
    tweenPos(4, 914, 50, 0.5)
	tweenPos(5, 914, 50, 0.5)
    tweenPos(6, 802, 50, 0.5)
	tweenPos(7, 802, 50, 0.5)
end
function swap6up ()
    tweenPos(4, 1026, 50, 0.5)
	tweenPos(5, 1026, 50, 0.5)
    tweenPos(6, 1026, 50, 0.5)
	tweenPos(7, 1026, 50, 0.5)
end
function swap7up ()
    tweenPos(4, 1026, 50, 0.5)
	tweenPos(5, 802, 50, 0.5)
    tweenPos(6, 386, 50, 0.5)
	tweenPos(7, 50, 50, 0.5)
end
function swap8up ()
    tweenPos(4, 1026, 50, 0.5)
	tweenPos(5, 1026, 50, 0.5)
    tweenPos(6, 50, 50, 0.5)
	tweenPos(7, 50, 50, 0.5)
end
function swap9up ()
    tweenPos(4, 386, 50, 0.5)
	tweenPos(5, 274, 50, 0.5)
    tweenPos(6, 162, 50, 0.5)
	tweenPos(7, 50, 50, 0.5)
end
function swap0up ()
    tweenPos(4, 50, 50, 0.5)
	tweenPos(5, 50, 50, 0.5)
    tweenPos(6, 50, 50, 0.5)
	tweenPos(7, 50, 50, 0.5)
end