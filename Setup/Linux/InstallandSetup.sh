echo Make sure you have Haxe installed or this won't work!
echo Installing needed libs for Indev Engine!
haxelib install lime 7.9.0
haxelib install openfl
haxelib --never install flixel 4.11.0
haxelib run lime setup flixel
haxelib run lime setup -y
haxelib install polymod
haxelib install flixel-tools
haxelib install flixel-addons 2.11.0
haxelib install flixel-ui
echo Setting up flixel-tools and lime..
haxelib run flixel-tools setup
haxelib run lime setup -y
haxelib set flixel 4.11.0
haxelib set lime 7.9.0
haxelib set flixel-addons 2.11.0
echo Indev Engine fully set up for building!