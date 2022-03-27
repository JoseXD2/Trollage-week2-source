package;

#if desktop
import Discord.DiscordClient;
#end
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
#if MODS_ALLOWED
import sys.FileSystem;
import sys.io.File;
#end
import lime.utils.Assets;

using StringTools;

class CreditsState extends MusicBeatState
{
	var curSelected:Int = -1;

	private var grpOptions:FlxTypedGroup<Alphabet>;
	private var iconArray:Array<AttachedSprite> = [];
	private var creditsStuff:Array<Array<String>> = [];

	var bg:FlxSprite;
	var descText:FlxText;
	var intendedColor:Int;
	var colorTween:FlxTween;

	override function create()
	{
		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end

		bg = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		add(bg);
		bg.screenCenter();
		
		grpOptions = new FlxTypedGroup<Alphabet>();
		add(grpOptions);

		#if MODS_ALLOWED
		//trace("finding mod shit");
		for (folder in Paths.getModDirectories())
		{
			var creditsFile:String = Paths.mods(folder + '/data/credits.txt');
			if (FileSystem.exists(creditsFile))
			{
				var firstarray:Array<String> = File.getContent(creditsFile).split('\n');
				for(i in firstarray)
				{
					var arr:Array<String> = i.replace('\\n', '\n').split("::");
					if(arr.length >= 5) arr.push(folder);
					creditsStuff.push(arr);
				}
				creditsStuff.push(['']);
			}
		};
		var folder = "";
			var creditsFile:String = Paths.mods('data/credits.txt');
			if (FileSystem.exists(creditsFile))
			{
				var firstarray:Array<String> = File.getContent(creditsFile).split('\n');
				for(i in firstarray)
				{
					var arr:Array<String> = i.replace('\\n', '\n').split("::");
					if(arr.length >= 5) arr.push(folder);
					creditsStuff.push(arr);
				}
				creditsStuff.push(['']);
			}
		#end

		var pisspoop:Array<Array<String>> = [ //Name - Icon name - Description - Link - BG Color
			["Director"],
			['BALLOON',					'jeff',					"Creator/Director of the mod, Artist",									'https://twitter.com/Balloon84195471',								'FFDC00'],
			[''],
			['ARTISTS'],
			['NUMBERLESS',				'nrmbrels',				'Drew bg’s, sprites, menu selection, logo and icons',					'https://twitter.com/Numberl93411599',								'FF9200'],
			['FORE',					'fore',					'Main Week 2 Background Artist',										'https://twitter.com/Fore_8040',										'C30085'],
			['TERRA',					'tebra',				'Imposter Sprites',														'https://discord.gg/modmakers',										'389A58'],
			['TOP TOPHATTER',			'tophat',				'Artist/animator who likes top hats (also fucked your mom btw)',		'https://twitter.com/TophatterTop',									'FFFFFF'],
			['DAVE',					'dagve',				'I want to cri, I really do :troll:',									'www.youtube.com/channel/UCEceiIdJpbuT4HgFUtCs1dw',				'D7B4F3'],
			['FIRE DEMON WALKER',		'fdw',					'draw',																	'https://twitter.com/FireDemonWalker?t=K2tkln3s4HzyNJWcARZZeQ&s=09','E61A46'],
			['SHIBECICLE',				'shb',					'dog',																	'https://twitter.com/shibecicle',									'F4442E'],
			['DANIZTIC',				'daniztic',				"Smile Troll",															'https://twitter.com/d4niztic?t=HWs310ae-edIGwdB7yu0bw&s=09',		'6B6B6B'],
			['TOK',						'tiktok',				'furry girl',															'https://twitter.com/thatone_kid39?s=21',							'AD8FE6'],
			[''],
			['MUSIC ARTISTS'],
			['SUSEJ HELLINTOWN',		'suseg',				'aqui trabaja como main composser',										'https://twitter.com/SusejHellintown',								'Y0FFD9'],
			['KEEGAN',					'kegn',					'Composer Of Happiness, Ultimate Trolldown, and Trollistic',			'https://twitter.com/__Keegan_',									'FFAA00'],
			['TIOSANS',					'sams',					'Smile song',															'https://twitter.com/NewTioSans?t=cQ9WqPphV85sSUF1Am7-tA&s=09',		'00FFF7'],
			['ARMYDILLO',				'army',					'A loser who makes fnf music',											'https://twitter.com/Armydilloiscool',								'7E2BD5'],
			['FRANDER',					'fander',				'Music artist fro [REDACTED]',											'https://twitter.com/FRANDERMAN123',										'FFFFFF'],
			[''],
			['ANIMATORS'],
			['SPRINGPOLYON',			'poly',					'Ragdolls',																'https://www.youtube.com/channel/UCDZMTldAYANVF77gt-30c7g',			'000000'],
			['PORCHE',					'porche',				'I animated some sprites for this mod, pretty good sprite animator.',	'https://twitter.com/phuphasin',									'AF33FF'],
			['STEBAN',					'steban',				'Just A Random Animator And Artist, Me gusta el pan, HI MOM!',			'https://mobile.twitter.com/stebanartz',							'900C3F'],
			['SPRINGTRAP CRITIQUE',		'springcret',			'Animator',																'https://twitter.com/PrivWakkoKin',									'FFEAA6'],
			[''],
			["Coders"],
			['BLUE SKYTTLE',			'skible',				"Main Programmer and Charter\nalso corruptus Sex Week When",			'https://www.youtube.com/channel/UCFXT0bACplLejhV4bz3TiDQ',			'8EFECD'],
			['BIG SODA',				'bigddoa',				"Coder and Cool Guy",													'https://twitter.com/Nightkniyt',									'FF61118a'],
			[''],
			["VOICE ACTORS"],
			['OVRON',					'overy',				"Voice Actor",															'https://gamebanana.com/members/1903050',							'5aaddd'],
			[''],
			["BASE CHARTS"],
			['ACTIVE777',				'agtive',				"Derp animator and v1 charter. Also N",									'https://twitter.com/Active7772',								'32FF00'],
			[''],
			["COOL PEOPLE"],
			['ARTHUR ADJ',				'arter',				"Emotional Support, I guess",											'https://twitter.com/AdjDraws',		'FFCE33'],
			['JAMMEDBONE',				'Jam',				"Creater of Trollge over Whitty",											'https://www.youtube.com/channel/UCWsrsnnwAGQ3LZlYoJkIpHw',										'FFCE33'],
			['MALICIOUS BUNNY',			'maishus Bunni',		"Blueballs Incident Creator",											'https://twitter.com/BunnyMalicious',								'F73838'],
			['GARTALICK',				'garglingDEEZNUTSBI-',	"XD",																	'https://twitter.com/GatalickGun',									'6F2DFC'],
		];
		
		for(i in pisspoop){
			creditsStuff.push(i);
		}
	
		for (i in 0...creditsStuff.length)
		{
			var isSelectable:Bool = !unselectableCheck(i);
			var optionText:Alphabet = new Alphabet(0, 70 * i, creditsStuff[i][0], !isSelectable, false);
			optionText.isMenuItem = true;
			optionText.screenCenter(X);
			optionText.yAdd -= 70;
			if(isSelectable) {
				optionText.x -= 70;
			}
			optionText.forceX = optionText.x;
			//optionText.yMult = 90;
			optionText.targetY = i;
			grpOptions.add(optionText);

			if(isSelectable) {

				var icon:AttachedSprite = new AttachedSprite('credits/' + creditsStuff[i][1]);
				icon.xAdd = optionText.width + 10;
				icon.sprTracker = optionText;
	
				// using a FlxGroup is too much fuss!
				iconArray.push(icon);
				add(icon);

				if(curSelected == -1) curSelected = i;
			}
		}

		descText = new FlxText(50, 600, 1180, "", 32);
		descText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		descText.scrollFactor.set();
		descText.borderSize = 2.4;
		add(descText);

		bg.color = getCurrentBGColor();
		intendedColor = bg.color;
		changeSelection();
		super.create();
	}

	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.7)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		var upP = FlxG.keys.justPressed.UP;
		var downP = FlxG.keys.justPressed.DOWN;

		if (upP)
		{
			changeSelection(-1);
		}
		if (downP)
		{
			changeSelection(1);
		}

		if (controls.BACK)
		{
			if(colorTween != null) {
				colorTween.cancel();
			}
			FlxG.sound.play(Paths.sound('cancelMenu'));
			FlxG.switchState(new MainMenuState());
		}
		if(controls.ACCEPT) {
			CoolUtil.browserLoad(creditsStuff[curSelected][3]);
		}
		super.update(elapsed);
	}

	function changeSelection(change:Int = 0)
	{
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
		do {
			curSelected += change;
			if (curSelected < 0)
				curSelected = creditsStuff.length - 1;
			if (curSelected >= creditsStuff.length)
				curSelected = 0;
		} while(unselectableCheck(curSelected));

		var newColor:Int =  getCurrentBGColor();
		if(newColor != intendedColor) {
			if(colorTween != null) {
				colorTween.cancel();
			}
			intendedColor = newColor;
			colorTween = FlxTween.color(bg, 1, bg.color, intendedColor, {
				onComplete: function(twn:FlxTween) {
					colorTween = null;
				}
			});
		}

		var bullShit:Int = 0;

		for (item in grpOptions.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			if(!unselectableCheck(bullShit-1)) {
				item.alpha = 0.4;
				if (item.targetY == 0) {
					item.alpha = 1;
				}
			}
		}
		descText.text = creditsStuff[curSelected][2];
	}

	function getCurrentBGColor() {
		var bgColor:String = creditsStuff[curSelected][4];
		if(!bgColor.startsWith('0x')) {
			bgColor = '0xFF' + bgColor;
		}
		return Std.parseInt(bgColor);
	}

	private function unselectableCheck(num:Int):Bool {
		return creditsStuff[num].length <= 1;
	}
}