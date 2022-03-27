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



class Tomfoolery2 extends FlxState
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
		end.loadGraphic(Paths.image("Phase4/End2", 'Troll'));
		FlxG.camera.fade(FlxColor.BLACK, 0.8, true);
		add(end);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		if (FlxG.keys.pressed.ENTER){
			endIt();
		}
		
	}
	
	
	public function endIt(e:FlxTimer=null){
		trace("ENDING");
		if (FlxG.save.data.didtomfoolery)
			LoadingState.loadAndSwitchState(new Tomfoolery3());
		else if (FlxG.random.bool(10))
			LoadingState.loadAndSwitchState(new Tomfoolery3());
		else
		LoadingState.loadAndSwitchState(new MainMenuState());
	}
	
}