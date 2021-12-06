package freeplayStuff;

import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;

using StringTools;

class FreeplayScore extends FlxTypedSpriteGroup<ScoreNum>
{
	public var scoreShit(default, set):Int = 0;

	function set_scoreShit(val):Int
	{
		var loopNum:Int = group.members.length - 1;
		var dumbNumb = Std.parseInt(Std.string(val));
		var prevNum:ScoreNum;

		while (dumbNumb > 0)
		{
			group.members[loopNum].digit = dumbNumb % 10;

			// var funnyNum = group.members[loopNum];
			// prevNum = group.members[loopNum + 1];

			// if (prevNum != null)
			// {
			// funnyNum.x = prevNum.x - (funnyNum.width * 0.7);
			// }

			// funnyNum.y = (funnyNum.baseY - (funnyNum.height / 2)) + 73;
			// funnyNum.x = (funnyNum.baseX - (funnyNum.width / 2)) + 450; // this plus value is hand picked lol!

			dumbNumb = Math.floor(dumbNumb / 10);
			loopNum--;
		}

		while (loopNum > 0)
		{
			group.members[loopNum].digit = 0;
			loopNum--;
		}

		return val;
	}

	public function new(x:Float, y:Float, scoreShit:Int = 100)
	{
		super(x, y);

		for (i in 0...7)
		{
			add(new ScoreNum(x + (45 * i), y, 0));
		}

		this.scoreShit = scoreShit;
	}

	public function updateScore(scoreNew:Int)
	{
		scoreShit = scoreNew;
	}
}

class ScoreNum extends FlxSprite
{
	public var digit(default, set):Int = 0;

	function set_digit(val):Int
	{
		if (animation.curAnim != null && animation.curAnim.name != Std.string(val))
		{
			animation.play(Std.string(val), true, false, 0);
			updateHitbox();

			y = (baseY - (height / 2)) + 45;
		}

		return val;
	}

	public var baseY:Float = 0;
	public var baseX:Float = 0;

	public function new(x:Float, y:Float, ?initDigit:Int = 0)
	{
		super(x, y);

		baseY = y;
		baseX = x;

		frames = Paths.getSparrowAtlas('noteComboNumbers');

		for (i in 0...10)
		{
			var stringNum:String = Std.string(i);
			animation.addByPrefix(stringNum, stringNum, 24, false);
		}

		this.digit = initDigit;

		animation.play(Std.string(digit), true);
		antialiasing = true;

		setGraphicSize(Std.int(width * 0.3));
		updateHitbox();
	}
}