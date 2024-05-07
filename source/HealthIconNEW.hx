// UNUSED UNTIL I FIX PLAYSTATE TO WORK WITH IT LOL
package;

import flixel.FlxSprite;

class HealthIcon extends FlxSprite
{
    public var sprTracker:FlxSprite;

    public function new(char:String = 'bf', isPlayer:Bool = false)
    {
        super();
        loadGraphic(Paths.image('icons/icon-' + char), true, 150, 150);

		antialiasing = true;
		animation.add('bf', [0, 1], 0, false, isPlayer);
		animation.add('face', [10, 11], 0, false, isPlayer);
		animation.add('dad', [12, 13], 0, false, isPlayer);
		animation.add('bf-old', [14, 15], 0, false, isPlayer);
		animation.add('gf', [16], 0, false, isPlayer);
		animation.play(char);
		scrollFactor.set();
    }

    override function update(elapsed:Float)
    {
        super.update(elapsed);

        if (sprTracker != null)
            setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
    }
}