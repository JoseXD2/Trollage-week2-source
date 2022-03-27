package;

import Controls.KeyboardScheme;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import io.newgrounds.NG;
import lime.app.Application;
import flixel.util.FlxTimer;
import flash.events.KeyboardEvent;

#if desktop
import Discord.DiscordClient;
#end

using StringTools;

class MainMenuState extends MusicBeatState
{
	var curSelected:Int = 0;

	var menuItems:FlxTypedGroup<FlxSprite>;

	#if !switch
	var optionShit:Array<String> = ['story mode', 'freeplay', 'credits', 'options'];
	#else
	var optionShit:Array<String> = ['story mode', 'freeplay', 'options'];
	#end

	var newInput:Bool = true;

	public static var kadeEngineVer:String = "Kade Engine";
	public static var gameVer:String = "0.2.7.1";

	var magenta:FlxSprite;
	var stati:FlxSprite;
	var isCutscene:Bool = false;
	var camFollow:FlxObject;

	public static var finishedFunnyMove:Bool = false;

	override function create()
	{

		if (FlxG.keys.justPressed.F)
			{
				FlxG.save.data.week2beaten = false;
			}

		FlxG.mouse.visible = false;
		
		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end
	

		persistentUpdate = persistentDraw = true;

		var bg = new FlxSprite(-80).loadGraphic(Paths.image('menuDesat'));
		bg.scrollFactor.x = 0;
		bg.scrollFactor.y = 0.18;
		bg.setGraphicSize(Std.int(bg.width * 1.1));
		bg.updateHitbox();
		bg.screenCenter();
		bg.visible = false;
		bg.antialiasing = true;
		bg.color = 0xFF000000;
		add(bg);

		camFollow = new FlxObject(0, 0, 1, 1);
		add(camFollow);

		magenta = new FlxSprite(-80).loadGraphic(Paths.image('menuDesat'));
		magenta.scrollFactor.x = 0;
		magenta.scrollFactor.y = 0.18;
		magenta.setGraphicSize(Std.int(magenta.width * 1.1));
		magenta.updateHitbox();
		magenta.screenCenter();
		magenta.visible = false;
		magenta.antialiasing = true;
		magenta.color = 0xFF000000;
		add(magenta);
		// magenta.scrollFactor.set();

		menuItems = new FlxTypedGroup<FlxSprite>();
		add(menuItems);

		var tex = Paths.getSparrowAtlas('Menu/Menu-Assets', 'Troll');

		for (i in 0...2)
		{
			var menuItem:FlxSprite = new FlxSprite(0 + (i * 670), -20);
			menuItem.frames = tex;
			menuItem.animation.addByPrefix('idle', optionShit[i] + "Idle", 24);
			menuItem.animation.addByPrefix('selected', optionShit[i] + "Select", 24);
			menuItem.setGraphicSize(Std.int(menuItem.width * 0.44));
			menuItem.updateHitbox();
			menuItem.animation.play('idle');
			menuItem.ID = i;
			menuItems.add(menuItem);
			menuItem.scrollFactor.set();
			menuItem.antialiasing = true;	
		}

		for (i in 2...3)
		{
			var menuItem:FlxSprite = new FlxSprite(0, 350);
			menuItem.frames = tex;
			menuItem.animation.addByPrefix('idle', optionShit[i] + "Idle", 24);
			menuItem.animation.addByPrefix('selected', optionShit[i] + "Select", 24);
			menuItem.setGraphicSize(Std.int(menuItem.width * 0.44));
			menuItem.updateHitbox();
			menuItem.animation.play('idle');
			menuItem.ID = i;
			menuItems.add(menuItem);
			menuItem.scrollFactor.set();
			menuItem.antialiasing = true;
			menuItem.centerOffsets();
		}

		for (i in 3...4)
		{
			var menuItem:FlxSprite = new FlxSprite(670, 350);
			menuItem.frames = tex;
			menuItem.animation.addByPrefix('idle', optionShit[i] + "Idle", 24);
			menuItem.animation.addByPrefix('selected', optionShit[i] + "Select", 24);
			menuItem.setGraphicSize(Std.int(menuItem.width * 0.44));
			menuItem.updateHitbox();
			menuItem.animation.play('idle');
			menuItem.ID = i;
			menuItems.add(menuItem);
			menuItem.scrollFactor.set();
			menuItem.antialiasing = true;
			menuItem.centerOffsets();
		}

		var button = new FlxSprite(0, -20).loadGraphic(Paths.image('Menu/button', 'Troll'));
		button.setGraphicSize(Std.int(button.width * 0.65));
		button.updateHitbox();
		button.screenCenter();
		button.visible = false;
		add(button);

		button.updateHitbox();
		buttonhitbox = new FlxObject(button.x + button.width, button.y - button.height, 24, 24);
		add(buttonhitbox);

		// NG.core.calls.event.logEvent('swag').send();


		if (FlxG.save.data.dfjk)
			controls.setKeyboardScheme(KeyboardScheme.Solo, true);
		else
			controls.setKeyboardScheme(KeyboardScheme.Duo(true), true);

		changeItem();


		super.create();
	}
	var buttonhitbox:FlxObject;

	var selectedSomethin:Bool = false;

	var code = '';

	override function update(elapsed:Float)
	{
		FlxG.mouse.enabled = true;


		FlxG.mouse.visible = true;

		if (FlxG.sound.music.volume < 0.8)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}


		if (!selectedSomethin)
		{
			if (FlxG.mouse.justPressed && FlxG.mouse.overlaps(buttonhitbox))
			{
				selectedSomethin = true;
				FlxG.mouse.visible = false;
				PlayState.SONG = Song.loadFromJson("trolling-hard", "Trolling");
				PlayState.isStoryMode = true;
				PlayState.storyDifficulty = 2;

				PlayState.storyWeek = 3;
				LoadingState.loadAndSwitchState(new PlayState());
				trace("Story Menu Selected");
			}

			if (controls.UP_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(-2);
			}

			if (controls.DOWN_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(2);
			}

			if (controls.RIGHT_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(1);
			}

			if (controls.LEFT_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(-1);
			}

			if (controls.ACCEPT)
			{
				if (optionShit[curSelected] == 'donate')
				{
					#if linux
					Sys.command('/usr/bin/xdg-open', ["https://ninja-muffin24.itch.io/funkin", "&"]);
					#else
					FlxG.openURL('https://ninja-muffin24.itch.io/funkin');
					#end
				}
				else
				{
					selectedSomethin = true;
					FlxG.sound.play(Paths.sound('confirmMenu'));

					FlxFlicker.flicker(magenta, 1.1, 0.15, false);

					menuItems.forEach(function(spr:FlxSprite)
					{
						if (curSelected != spr.ID)
						{
							FlxTween.tween(spr, {alpha: 0}, 1.3, {
								ease: FlxEase.quadOut,
								onComplete: function(twn:FlxTween)
								{
									spr.kill();
								}
							});
						}
						else
						{
							FlxFlicker.flicker(spr, 1, 0.06, false, false, function(flick:FlxFlicker)
							{
								var daChoice:String = optionShit[curSelected];
								var video:MP4Handler = new MP4Handler();
								switch (daChoice)
								{
									case 'story mode':

										PlayState.SONG = Song.loadFromJson("tomfoolery-hard", "tomfoolery");
										PlayState.isStoryMode = true;
										PlayState.storyDifficulty = 2;
						
										PlayState.storyWeek = 2;
										if (!isCutscene)
											{
												new FlxTimer().start(1, function(tmr:FlxTimer)
												{
													{
														video.playMP4(Paths.video('Tomfoolery'));
														video.finishCallback = function()
													{
														LoadingState.loadAndSwitchState(new PlayState());
													}
															isCutscene = true;
													}
												});
											}
										
										trace("Story Menu Selected");
									case 'freeplay':
										FlxG.switchState(new FreeplayState());

										trace("Freeplay Menu Selected");

									case 'credits':
										FlxG.switchState(new CreditsState());
										trace("Credits Selected");

									case 'options':
										FlxG.switchState(new OptionsMenu());
								}
							});
						}
					});
				}
			}
		}
		super.update(elapsed);
	}

	function changeItem(huh:Int = 0)
	{
		curSelected += huh;

		if (curSelected >= menuItems.length)
			curSelected = 0;
		if (curSelected == -2)
			curSelected = menuItems.length - 2;
		if (curSelected < 0)
			curSelected = menuItems.length - 1;

		menuItems.forEach(function(spr:FlxSprite)
		{
			spr.animation.play('idle');

			if (spr.ID == curSelected)
			{
				spr.animation.play('selected');
				camFollow.setPosition(spr.getGraphicMidpoint().x, spr.getGraphicMidpoint().y);
			}

			spr.updateHitbox();
		});
	}
}