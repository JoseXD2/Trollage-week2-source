package;

import flixel.*;
import Controls.KeyboardScheme;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.input.gamepad.FlxGamepad;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import lime.utils.Assets;

/**
 * ...
 * @author bbpanzu
 */
class LonelyState extends FlxState
{

	var _goodEnding:Bool = false;
	
	public function new(goodEnding:Bool = true) 
	{
		super();
		_goodEnding = goodEnding;
		
	}
	
	override public function create():Void 
	{
		super.create();
		var end:FlxSprite = new FlxSprite(0, 0);
		end.loadGraphic(Paths.image("DEATH/lonely", 'Troll'));
		FlxG.camera.fade(FlxColor.BLACK, 0.8, true);
		add(end);
		
		
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		if (FlxG.keys.pressed.ENTER){
			endIt();
		}
		if (FlxG.keys.pressed.ESCAPE){
			menuBack();
		}
		
	}
	
	
	public function endIt(e:FlxTimer=null){
		trace("ENDING");
		LoadingState.loadAndSwitchState(new PlayState());
	}
	public function menuBack(e:FlxTimer=null){
		trace("ENDING");
		LoadingState.loadAndSwitchState(new FreeplayState());
	}
	
}