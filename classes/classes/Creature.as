﻿//CoC Creature.as
package classes
{
	import classes.GlobalFlags.kGAMECLASS;
	import classes.GlobalFlags.kFLAGS;
	import classes.PerkType;
	import classes.StatusAffectType;
	import classes.internals.Utils;
	import classes.Scenes.Places.TelAdre.UmasShop;
	
	public class Creature extends Utils
	{

		include "../../includes/appearanceDefs.as";

		public function get game():CoC {
			return kGAMECLASS;
		}
		public function get flags():DefaultDict {
			return game.flags;
		}

		//Variables
		
		//Short refers to player name and monster name. BEST VARIABLE NAME EVA!
		//"a" refers to how the article "a" should appear in text. 
		private var _short:String = "You";
		private var _a:String = "a ";
		public function get short():String { return _short; }
		public function set short(value:String):void { _short = value; }
		public function get a():String { return _a; }
		public function set a(value:String):void { _a = value; }
		public function get capitalA():String {
			if (_a.length == 0) return "";
			return _a.charAt(0).toUpperCase() + _a.substr(1);
		}

		//Weapon
		private var _weaponName:String = "";
		private var _weaponVerb:String = "";
		private var _weaponAttack:Number = 0;
		private var _weaponPerk:String = "";
		private var _weaponValue:Number = 0;
		public function get weaponName():String { return _weaponName; }
		public function get weaponVerb():String { return _weaponVerb; }
		public function get weaponAttack():Number { return _weaponAttack; }
		public function get weaponPerk():String { return _weaponPerk; }
		public function get weaponValue():Number { return _weaponValue; }
		public function set weaponName(value:String):void { _weaponName = value; }
		public function set weaponVerb(value:String):void { _weaponVerb = value; }
		public function set weaponAttack(value:Number):void { _weaponAttack = value; }
		public function set weaponPerk(value:String):void { _weaponPerk = value; }
		public function set weaponValue(value:Number):void { _weaponValue = value; }
		//Clothing/Armor
		private var _armorName:String = "";
		private var _armorDef:Number = 0;
		private var _armorPerk:String = "";
		private var _armorValue:Number = 0;
		public function get armorName():String { return _armorName; }
		public function get armorDef():Number { return _armorDef; }
		public function get armorPerk():String { return _armorPerk; }
		public function get armorValue():Number { return _armorValue; }
		public function set armorValue(value:Number):void { _armorValue = value; }
		public function set armorName(value:String):void { _armorName = value; }
		public function set armorDef(value:Number):void { _armorDef = value; }
		public function set armorPerk(value:String):void { _armorPerk = value; }
		//Jewelry!
		private var _jewelryName:String = "";
		private var _jewelryEffectId:Number = 0;
		private var _jewelryEffectMagnitude:Number = 0;
		private var _jewelryPerk:String = "";
		private var _jewelryValue:Number = 0;
		public function get jewelryName():String { return _jewelryName; }
		public function get jewelryEffectId():Number { return _jewelryEffectId; }
		public function get jewelryEffectMagnitude():Number { return _jewelryEffectMagnitude; }
		public function get jewelryPerk():String { return _jewelryPerk; }
		public function get jewelryValue():Number { return _jewelryValue; }
		public function set jewelryValue(value:Number):void { _jewelryValue = value; }
		public function set jewelryName(value:String):void { _jewelryName = value; }
		public function set jewelryEffectId(value:Number):void { _jewelryEffectId = value; }
		public function set jewelryEffectMagnitude(value:Number):void { _jewelryEffectId = value; }
		public function set jewelryPerk(value:String):void { _jewelryPerk = value; }
		//Shield!
		private var _shieldName:String = "";
		private var _shieldBlock:Number = 0;
		private var _shieldPerk:String = "";
		private var _shieldValue:Number = 0;
		public function get shieldName():String { return _shieldName; }
		public function get shieldBlock():Number { return _shieldBlock; }
		public function get shieldPerk():String { return _shieldPerk; }
		public function get shieldValue():Number { return _shieldValue; }
		public function set shieldValue(value:Number):void { _shieldValue = value; }
		public function set shieldName(value:String):void { _shieldName = value; }
		public function set shieldBlock(value:Number):void { _shieldBlock = value; }
		public function set shieldPerk(value:String):void { _shieldPerk = value; }
		//Undergarments!
		private var _upperGarmentName:String = "";
		private var _upperGarmentPerk:String = "";
		private var _upperGarmentValue:Number = 0;
		public function get upperGarmentName():String { return _upperGarmentName; }
		public function get upperGarmentPerk():String { return _upperGarmentPerk; }
		public function get upperGarmentValue():Number { return _upperGarmentValue; }
		public function set upperGarmentName(value:String):void { _upperGarmentName = value; }
		public function set upperGarmentPerk(value:String):void { _upperGarmentPerk = value; }
		public function set upperGarmentValue(value:Number):void { _upperGarmentValue = value; }
		
		private var _lowerGarmentName:String = "";
		private var _lowerGarmentPerk:String = "";
		private var _lowerGarmentValue:Number = 0;
		public function get lowerGarmentName():String { return _lowerGarmentName; }
		public function get lowerGarmentPerk():String { return _lowerGarmentPerk; }
		public function get lowerGarmentValue():Number { return _lowerGarmentValue; }
		public function set lowerGarmentName(value:String):void { _lowerGarmentName = value; }
		public function set lowerGarmentPerk(value:String):void { _lowerGarmentPerk = value; }
		public function set lowerGarmentValue(value:Number):void { _lowerGarmentValue = value; }
		//Primary stats
		public var str:Number = 0;
		public var tou:Number = 0;
		public var spe:Number = 0;
		public var inte:Number = 0;
		public var lib:Number = 0;
		public var sens:Number = 0;
		public var cor:Number = 0;
		public var fatigue:Number = 0;
		
		//Combat Stats
		public var HP:Number = 0;
		public var lust:Number = 0;		
		
		//Level Stats
		public var XP:Number = 0;
		public var level:Number = 0;
		public var gems:Number = 0;
		public var additionalXP:Number = 0;
				
		//Appearance Variables
		//Gender 1M, 2F, 3H
		public var gender:int = GENDER_NONE;
		private var _tallness:Number = 0;
		public function get tallness():Number { return _tallness; }
		public function set tallness(value:Number):void { _tallness = value; }

		/*Hairtype
		0- normal
		1- feather
		2- ghost
		3- goo!
		4- anemononeoenoeneo!*/
		public var hairType:Number = HAIR_NORMAL;
		public var hairColor:String = "no";
		public var hairLength:Number = 0;
		
		public var furColor:String = "no"; //Will be separate eventually.
		/*Beardstyle
		0- normal
		1- goatee
		2- clean-cut
		3- mountain-man*/
		public var beardStyle:Number = BEARD_NORMAL;
		public var beardLength:Number = 0;
				
		/*Skintype
		0 - skin
		1 - furry
		2 - scaley
		3 - goopey*/
		private var _skinType:Number = SKIN_TYPE_PLAIN;
		public function get skinType():Number { return _skinType; }
		public function set skinType(value:Number):void { _skinType = value; }
		private var _skinTone:String = "albino";
		public function get skinTone():String { return _skinTone; }
		public function set skinTone(value:String):void { _skinTone = value; }
		public var skinDesc:String = "skin";
		public var skinAdj:String = "";
		
/*		Facetype:
		0 - human
		1 - horse
		2 - dogface
		3 - cowface
		4 - sharkface-teeth
		5 - Human w/Naga fangz
		6 - kittah face
		7 - lizard face (durned argonians!)
		8 - bunnah faceahhh bunbun
		9 - kangaface
		10 - spidah-face (humanish)
		11 - foxface!
		12 - dragon face
		13 - Halfcoon
		14 - fullcoon
		15 - halfmouse
		16 - fullmouse*/
		public var faceType:Number = FACE_HUMAN;

		/*EarType
		-1 - none!
		0 - human
		1 - horse
		2 - dog
		3 - cow
		4 - elf
		5 - catzilla
		6 - Snakezilla
		7 - Bunbunz
		8 - Roo Ears
		9 - fox ears
		10 - dragon
		11 - coon
		12 - mouse*/
		public var earType:Number = EARS_HUMAN;
		public var earValue:Number = 0;
		
		/*Horntype
		1 - demonic
		2 - minotaur (cowlike)
		3 - Draconic/Lizard
		4 - Double draconic
		5 - Antlers*/
		public var hornType:Number = HORNS_NONE;
		public var horns:Number = 0;

		/*Wingtype
		0 - none
		1 - bee
		2 - large bee
		3 - faerie?
		4 - avian
		5 - dragoooon?
		6 - demon/bat
		7 - large demon/bat
		8 - shark wing lolololol
		9 - harpy
		10 - small dagron
		11 - trogdor wings
		12 - sandtrap wings*/
		private var _wingType:Number = WING_TYPE_NONE;
		public var wingDesc:String = "non-existant";
		public function get wingType():Number { return _wingType; }
		public function set wingType(value:Number):void { _wingType = value; }

		/* lowerBody:
		0 - normal
		1 - hooves
		2 - paws
		3 - snakelike body
		4 - centaur!
		5 - demonic heels
		6 - demon foot-claws
		7 - bee legs
		8 - goo mound
		9 - catfeet
		10 - lizardfeet
		11 - MLP.
		12 - DAH BUNNY!
		13 - Harpah Legz
		14 - Roo feet!
		15 - Spider Legz
		16 - Drider Legs
		17 - foxpaws
		18 - dragonfeet
		19 - raccoonfeet*/
		public var lowerBody:Number = LOWER_BODY_TYPE_HUMAN;

		/*tailType:
		0 - none
		1 - horse
		2 - dog
		3 - demon
		4 - cow!
		5 - spider!
		6 - bee!
		7 - shark tail!
		8 - catTAIIIIIL
		9 - lizard tail
		10 - bunbuntail
		11 - harpybutt
		12 - rootail
		13 - foxtail
		14 - dagron tail
		15 - raccoon tail
		16 - mousetail*/
		public var tailType:Number = TAIL_TYPE_NONE;
		
		//Tail venom is a 0-100 slider used for tail attacks. Recharges per hour.
		public var tailVenom:Number = 0;
		//Tail recharge determines how fast venom/webs comes back per hour.
		public var tailRecharge:Number = 5;
		
		/*hipRating
		0 - boyish
		2 - slender
		4 - average
		6 - noticable/ample
		10 - curvy//flaring
		15 - child-bearing/fertile
		20 - inhumanly wide*/
		public var hipRating:Number = HIP_RATING_BOYISH;
		
		/*buttRating
		0 - buttless
		2 - tight
		4 - average
		6 - noticable
		8 - large
		10 - jiggly
		13 - expansive
		16 - huge
		20 - inconceivably large/big/huge etc*/
		public var buttRating:Number = BUTT_RATING_BUTTLESS;
		
		//Piercings
		//TODO: Pull this out into it's own class and enum.
		public var nipplesPierced:Number = 0;
		public var nipplesPShort:String = "";
		public var nipplesPLong:String = "";
		public var lipPierced:Number = 0;
		public var lipPShort:String = "";
		public var lipPLong:String = "";
		public var tonguePierced:Number = 0;
		public var tonguePShort:String = "";
		public var tonguePLong:String = "";
		public var eyebrowPierced:Number = 0;
		public var eyebrowPShort:String = "";
		public var eyebrowPLong:String = "";
		public var earsPierced:Number = 0;
		public var earsPShort:String = "";
		public var earsPLong:String = "";
		public var nosePierced:Number = 0;
		public var nosePShort:String = "";
		public var nosePLong:String = "";

		//Head ornaments. Definitely need to convert away from hard coded types.
		public var antennae:Number = ANTENNAE_NONE;

		//Eyetype
		public var eyeType:Number = EYES_HUMAN;

		//TongueType
		public var tongueType:Number = TONUGE_HUMAN;

		//ArmType
		public var armType:Number = ARM_TYPE_HUMAN;

		//Gills
		public var gills:Boolean = false;

		//Sexual Stuff		
		//MALE STUFF
		//public var cocks:Array;
		//TODO: Tuck away into Male genital class?
		public var cocks:Array;
		//balls
		public var balls:Number = 0;
		public var cumMultiplier:Number = 1;
		public var ballSize:Number = 0;
		
		private var _hoursSinceCum:Number = 0;
		public function get hoursSinceCum():Number { return _hoursSinceCum; }
		public function set hoursSinceCum(v:Number):void {
			/*if (v == 0)
			{
				trace("noop");
			}*/
			_hoursSinceCum = v; 
		}
		
		//FEMALE STUFF
		//TODO: Box into Female genital class?
		public var vaginas:Array;
		//Fertility is a % out of 100. 
		public var fertility:Number = 10;
		public var clitLength:Number = .5;
		public var nippleLength:Number = .25;
		public var breastRows:Array;
		public var ass:AssClass = new AssClass();

		public function validate():String
		{
			var error:String = "";
			// 2. Value boundaries etc
			// 2.1. non-negative Number fields
			error += Utils.validateNonNegativeNumberFields(this,"Monster.validate",[
				"balls", "ballSize", "cumMultiplier", "hoursSinceCum",
				"tallness", "hipRating", "buttRating", "lowerBody", "armType",
				"skinType", "hairLength", "hairType",
				"faceType", "earType", "tongueType", "eyeType",
				"str", "tou", "spe", "inte", "lib", "sens", "cor",
				// Allow weaponAttack to be negative as a penalty to strength-calculated damage
				// Same with armorDef, bonusHP, additionalXP
				"weaponValue", "armorValue",
				"lust", "fatigue",
				"level", "gems",
				"tailVenom", "tailRecharge", "horns",
				"HP", "XP"
			]);
			// 2.2. non-empty String fields
			error += Utils.validateNonEmptyStringFields(this,"Monster.validate",[
				"short",
				"skinDesc",
				"weaponName", "weaponVerb", "armorName"
			]);
			// 3. validate members
			for each (var cock:Cock in cocks) {
				error += cock.validate();
			}
			for each (var vagina:VaginaClass in vaginas) {
				error += vagina.validate();
			}
			for each (var row:BreastRowClass in breastRows) {
				error += row.validate();
			}
			error += ass.validate();
			// 4. Inconsistent fields
			// 4.1. balls
			if (balls>0 && ballSize<=0){
				error += "Balls are present but ballSize = "+ballSize+". ";
			}
			if (ballSize>0 && balls<=0){
				error += "No balls but ballSize = "+ballSize+". ";
			}
			// 4.2. hair
			if (hairLength <= 0) {
				if (hairType != HAIR_NORMAL) error += "No hair but hairType = " + hairType + ". ";
			}
			// 4.3. tail
			if (tailType == TAIL_TYPE_NONE) {
				if (tailVenom != 0) error += "No tail but tailVenom = "+tailVenom+". ";
			}
			// 4.4. horns
			if (hornType == HORNS_NONE){
				if (horns>0) error += "horns > 0 but hornType = HORNS_NONE. ";
			} else {
				if (horns==0) error += "Has horns but their number 'horns' = 0. ";
			}
			return error;
		}
		
		//Monsters have few perks, which I think should be a status effect for clarity's sake.
		//TODO: Move perks into monster status effects.
		private var _perks:Array;
		public function perk(i:int):PerkClass{
			return _perks[i];
		}
		public function get perks():Array {
			return _perks;
		}
		public function get numPerks():int {
			return _perks.length;
		}
		//Current status effects. This has got very muddy between perks and status effects. Will have to look into it.
		//Someone call the grammar police!
		//TODO: Move monster status effects into perks. Needs investigation though.
		public var statusAffects:Array;

		//Constructor
		public function Creature()
		{
			//cocks = new Array();
			//The world isn't ready for typed Arrays just yet.
			cocks = [];
			vaginas = [];
			//vaginas: Vector.<Vagina> = new Vector.<Vagina>();
			breastRows = [];
			_perks = [];
			statusAffects = [];
			//keyItems = new Array();
		}

		//Functions			
		public function orgasm():void
		{
			game.dynStats("lus=",0,"res",false);
			hoursSinceCum = 0;
			flags[kFLAGS.TIMES_ORGASMED] += 1;
			
			if (countCockSocks("gilded") > 0) {
			
				var randomCock:int = rand( cocks.length );
				var bonusGems:int = rand( cocks[randomCock].cockThickness ) + countCockSocks("gilded"); // int so AS rounds to whole numbers
				game.outputText("\n\nFeeling some minor discomfort in your " + cockDescript(randomCock) + " you slip it out of your [armor] and examine it. <b>With a little exploratory rubbing and massaging, you manage to squeeze out " + bonusGems + " gems from its cum slit.</b>\n\n" );
				gems += bonusGems;
			}
		}

		//Create a perk
		public function createPerk(ptype:PerkType, value1:Number, value2:Number, value3:Number, value4:Number):void
		{
			var newKeyItem:PerkClass = new PerkClass(ptype);
			//used to denote that the array has already had its new spot pushed on.
			var arrayed:Boolean = false;
			//used to store where the array goes
			var keySlot:Number = 0;
			var counter:Number = 0;
			//Start the array if its the first bit
			if (perks.length == 0)
			{
				//trace("New Perk Started Array! " + keyName);
				perks.push(newKeyItem);
				arrayed = true;
				keySlot = 0;
			}
			//If it belongs at the end, push it on
			if (perk(perks.length - 1).perkName < ptype.name && !arrayed)
			{
				//trace("New Perk Belongs at the end!! " + keyName);
				perks.push(newKeyItem);
				arrayed = true;
				keySlot = perks.length - 1;
			}
			//If it belongs in the beginning, splice it in
			if (perk(0).perkName > ptype.name && !arrayed)
			{
				//trace("New Perk Belongs at the beginning! " + keyName);
				perks.splice(0, 0, newKeyItem);
				arrayed = true;
				keySlot = 0;
			}
			//Find the spot it needs to go in and splice it in.
			if (!arrayed)
			{
				//trace("New Perk using alphabetizer! " + keyName);
				counter = perks.length;
				while (counter > 0 && !arrayed)
				{
					counter--;
					//If the current slot is later than new key
					if (perk(counter).perkName > ptype.name)
					{
						//If the earlier slot is earlier than new key && a real spot
						if (counter - 1 >= 0)
						{
							//If the earlier slot is earlier slot in!
							if (perk(counter - 1).perkName <= ptype.name)
							{
								arrayed = true;
								perks.splice(counter, 0, newKeyItem);
								keySlot = counter;
							}
						}
						//If the item after 0 slot is later put here!
						else
						{
							//If the next slot is later we are go
							if(perk(counter).perkName <= ptype.name) {
								arrayed = true;
								perks.splice(counter, 0, newKeyItem);
								keySlot = counter;
							}
						}
					}
				}
			}
			//Fallback
			if (!arrayed)
			{
				//trace("New Perk Belongs at the end!! " + keyName);
				perks.push(newKeyItem);
				keySlot = perks.length - 1;
			}
			
			perk(keySlot).value1 = value1;
			perk(keySlot).value2 = value2;
			perk(keySlot).value3 = value3;
			perk(keySlot).value4 = value4;
			//trace("NEW PERK FOR PLAYER in slot " + keySlot + ": " + perk(keySlot).perkName);
		}

		/**
		 * Remove perk. Return true if there was such perk
		 */
		public function removePerk(ptype:PerkType):Boolean
		{
			var counter:Number = perks.length;
			//Various Errors preventing action
			if (perks.length <= 0)
			{
				return false;
			}
			while (counter > 0)
			{
				counter--;
				if (perk(counter).ptype == ptype)
				{
					perks.splice(counter, 1);
					//trace("Attempted to remove \"" + perkName + "\" perk.");
					return true;
				}
			}
			return false;
		}
		
		//has perk?
		public function findPerk(ptype:PerkType):Number
		{
			if (perks.length <= 0)
				return -2;
			for (var counter:int = 0; counter<perks.length; counter++)
			{
				if (perk(counter).ptype == ptype)
					return counter;
			}
			return -1;
		}
		
		//Duplicate perk
		//Deprecated?
		public function perkDuplicated(ptype:PerkType):Boolean
		{
			var timesFound:int = 0;
			if (perks.length <= 0)
				return false;
			for (var counter:int = 0; counter<perks.length; counter++)
			{
				if (perk(counter).ptype == ptype)
					timesFound++;
			}
			return (timesFound > 1);
		}
		
		//remove all perks
		public function removePerks():void
		{
			_perks = [];
		}
		
		public function addPerkValue(ptype:PerkType, valueIdx:Number = 1, bonus:Number = 0): void
		{
			var counter:int = findPerk(ptype);
			if (counter < 0) {
				trace("ERROR? Looking for perk '" + ptype + "' to change value " + valueIdx + ", and player does not have the perk.");
				return;
			}
			if (valueIdx < 1 || valueIdx > 4) {
				CoC_Settings.error("addPerkValue(" + ptype.id + ", " + valueIdx + ", " + bonus + ").");
				return;
			}
			if (valueIdx == 1)
				perk(counter).value1 += bonus;
			if (valueIdx == 2)
				perk(counter).value2 += bonus;
			if (valueIdx == 3)
				perk(counter).value3 += bonus;
			if (valueIdx == 4)
				perk(counter).value4 += bonus;
		}
		
		public function setPerkValue(ptype:PerkType, valueIdx:Number = 1, newNum:Number = 0): void
		{
			var counter:Number = findPerk(ptype);
			//Various Errors preventing action
			if (counter < 0) {
				trace("ERROR? Looking for perk '" + ptype + "' to change value " + valueIdx + ", and player does not have the perk.");
				return;
			}
			if (valueIdx < 1 || valueIdx > 4)
			{
				CoC_Settings.error("setPerkValue(" + ptype.id + ", " + valueIdx + ", " + newNum + ").");
				return;
			}
			if (valueIdx == 1)
				perk(counter).value1 = newNum;
			if (valueIdx == 2)
				perk(counter).value2 = newNum;
			if (valueIdx == 3)
				perk(counter).value3 = newNum;
			if (valueIdx == 4)
				perk(counter).value4 = newNum;
		}
		
		public function perkv1(ptype:PerkType):Number
		{
			var counter:Number = findPerk(ptype);
			if (counter < 0)
			{
				// trace("ERROR? Looking for perk '" + ptype + "', but player does not have it.");
				return 0;
			}
			return perk(counter).value1;
		}
		
	public function perkv2(ptype:PerkType):Number
	{
		var counter:Number = findPerk(ptype);
		if (counter < 0)
		{
			// trace("ERROR? Looking for perk '" + ptype + "', but player does not have it.");
			return 0;
		}
		return perk(counter).value2;
	}
		
	public function perkv3(ptype:PerkType):Number
	{
		var counter:Number = findPerk(ptype);
		if (counter < 0)
		{
			trace("ERROR? Looking for perk '" + ptype + "', but player does not have it.");
			return 0;
		}
		return perk(counter).value3;
	}
		
	public function perkv4(ptype:PerkType):Number
	{
		var counter:Number = findPerk(ptype);
		if (counter < 0)
		{
			trace("ERROR? Looking for perk '" + ptype + "', but player does not have it.");
			return 0;
		}
		return perk(counter).value4;
	}
		
		//{region StatusEffects
		//Create a status
		public function createStatusAffect(stype:StatusAffectType, value1:Number, value2:Number, value3:Number, value4:Number):void
		{
			var newStatusAffect:StatusAffectClass = new StatusAffectClass(stype,value1,value2,value3,value4);
			statusAffects.push(newStatusAffect);
			//trace("createStatusAffect -> "+statusAffects.join(","));
			//trace("NEW STATUS APPLIED TO PLAYER!: " + statusName);
		}
		
		//Remove a status
		public function removeStatusAffect(stype:StatusAffectType):void
		{
			var counter:Number = findStatusAffect(stype);
			if (counter < 0) return;
			statusAffects.splice(counter, 1);
			//trace("removeStatusAffect -> "+statusAffects.join(","));
		}
		
		public function findStatusAffect(stype:StatusAffectType):Number
		{
			for (var counter:int = 0; counter < statusAffects.length; counter++)
			{
				if (statusAffect(counter).stype == stype)
					return counter;
			}
			return -1;
		}
		//}endregion
		
		
		public function changeStatusValue(stype:StatusAffectType, statusValueNum:Number = 1, newNum:Number = 0):void
		{
			var counter:Number = findStatusAffect(stype);
			//Various Errors preventing action
			if (counter < 0)return;
			if (statusValueNum < 1 || statusValueNum > 4)
			{
				CoC_Settings.error("ChangeStatusValue called with invalid status value number.");
				return;
			}
			if (statusValueNum == 1)
				statusAffect(counter).value1 = newNum;
			if (statusValueNum == 2)
				statusAffect(counter).value2 = newNum;
			if (statusValueNum == 3)
				statusAffect(counter).value3 = newNum;
			if (statusValueNum == 4)
				statusAffect(counter).value4 = newNum;
		}
		
		public function addStatusValue(stype:StatusAffectType, statusValueNum:Number = 1, bonus:Number = 0):void
		{
			var counter:Number = findStatusAffect(stype);
			//Various Errors preventing action
			if (counter < 0)
			{
				return;
			}
			if (statusValueNum < 1 || statusValueNum > 4)
			{
				CoC_Settings.error("ChangeStatusValue called with invalid status value number.");
				return;
			}
			if (statusValueNum == 1)
				statusAffect(counter).value1 += bonus;
			if (statusValueNum == 2)
				statusAffect(counter).value2 += bonus;
			if (statusValueNum == 3)
				statusAffect(counter).value3 += bonus;
			if (statusValueNum == 4)
				statusAffect(counter).value4 += bonus;
		}
		
		public function statusAffect(idx:int):StatusAffectClass
		{
			return statusAffects [idx];
		}
		
		public function statusAffectv1(stype:StatusAffectType):Number
		{
			var counter:Number = findStatusAffect(stype);
			return (counter<0)?0:statusAffect(counter).value1;
		}
		
		public function statusAffectv2(stype:StatusAffectType):Number
		{
			var counter:Number = findStatusAffect(stype);
			return (counter<0)?0:statusAffect(counter).value2;
		}

		public function statusAffectv3(stype:StatusAffectType):Number
		{
			var counter:Number = findStatusAffect(stype);
			return (counter<0)?0:statusAffect(counter).value3;
		}

		public function statusAffectv4(stype:StatusAffectType):Number
		{
			var counter:Number = findStatusAffect(stype);
			return (counter<0)?0:statusAffect(counter).value4;
		}

		public function removeStatuses():void
		{
			var counter:Number = statusAffects.length;
			while (counter > 0)
			{
				counter--;
				statusAffects.splice(counter, 1);
			}
		}		
		
		public function biggestTitSize():Number
		{
			if (breastRows.length == 0)
				return -1;
			var counter:Number = breastRows.length;
			var index:Number = 0;
			while (counter > 0)
			{
				counter--;
				if (breastRows[index].breastRating < breastRows[counter].breastRating)
					index = counter;
			}
			return breastRows[index].breastRating;
		}
		
		public function cockArea(i_cockIndex:Number):Number
		{
			if (i_cockIndex >= cocks.length || i_cockIndex < 0)
				return 0;
			return (cocks[i_cockIndex].cockThickness * cocks[i_cockIndex].cockLength);
		}
		
		public function biggestCockLength():Number
		{
			if (cocks.length == 0)
				return 0;
			return cocks[biggestCockIndex()].cockLength;
		}
		
		public function biggestCockArea():Number
		{
			if (cocks.length == 0)
				return 0;
			var counter:Number = cocks.length;
			var index:Number = 0;
			while (counter > 0)
			{
				counter--;
				if (cockArea(index) < cockArea(counter))
					index = counter;
			}
			return cockArea(index);
		}
		
		//Find the second biggest dick and it's area.
		public function biggestCockArea2():Number
		{
			if (cocks.length <= 1)
				return 0;
			var counter:Number = cocks.length;
			var index:Number = 0;
			var index2:Number = -1;
			//Find the biggest
			while (counter > 0)
			{
				counter--;
				if (cockArea(index) < cockArea(counter))
					index = counter;
			}
			//Reset counter and find the next biggest
			counter = cocks.length;
			while (counter > 0)
			{
				counter--;
				//Is this spot claimed by the biggest?
				if (counter != index)
				{
					//Not set yet?
					if (index2 == -1)
						index2 = counter;
					//Is the stored value less than the current one?
					if (cockArea(index2) < cockArea(counter))
					{
						index2 = counter;
					}
				}
			}
			//If it couldn't find a second biggest...
			if (index == index2)
				return 0;
			return cockArea(index2);
		}
		
		public function longestCock():Number
		{
			if (cocks.length == 0)
				return 0;
			var counter:Number = cocks.length;
			var index:Number = 0;
			while (counter > 0)
			{
				counter--;
				if (cocks[index].cockLength < cocks[counter].cockLength)
					index = counter;
			}
			return index;
		}
		
		public function longestCockLength():Number
		{
			if (cocks.length == 0)
				return 0;
			var counter:Number = cocks.length;
			var index:Number = 0;
			while (counter > 0)
			{
				counter--;
				if (cocks[index].cockLength < cocks[counter].cockLength)
					index = counter;
			}
			return cocks[index].cockLength;
		}
		
		public function longestHorseCockLength():Number
		{
			if (cocks.length == 0)
				return 0;
			var counter:Number = cocks.length;
			var index:Number = 0;
			while (counter > 0)
			{
				counter--;
				if ((cocks[index].cockType != CockTypesEnum.HORSE && cocks[counter].cockType == CockTypesEnum.HORSE) || (cocks[index].cockLength < cocks[counter].cockLength && cocks[counter].cockType == CockTypesEnum.HORSE))
					index = counter;
			}
			return cocks[index].cockLength;
		}
		
		public function twoDickRadarSpecial(width:int):Boolean
		{
			//No two dicks?  FUCK OFF
			if (cockTotal() < 2)
				return false;
			
			//Set up vars
			//Get thinnest, work done already
			var thinnest:int = thinnestCockIndex();
			var thinnest2:int = 0;
			//For ze loop
			var temp:int = 0;
			//Make sure they arent the same at initialization
			if (thinnest2 == thinnest)
				thinnest2 = 1;
			//Loop through to find 2nd thinnest
			while (temp < cocks.length)
			{
				if (cocks[thinnest2].cockThickness > cocks[temp].cockThickness && temp != thinnest)
					thinnest2 = temp;
				temp++;
			}
			//If the two thicknesses added together are less than the arg, true, else false
			return cocks[thinnest].cockThickness + cocks[thinnest2].cockThickness < width;
		}
		
		public function totalCockThickness():Number
		{
			var thick:Number = 0;
			var counter:Number = cocks.length;
			while (counter > 0)
			{
				counter--;
				thick += cocks[counter].cockThickness;
			}
			return thick;
		}
		
		public function thickestCock():Number
		{
			if (cocks.length == 0)
				return 0;
			var counter:Number = cocks.length;
			var index:Number = 0;
			while (counter > 0)
			{
				counter--;
				if (cocks[index].cockThickness < cocks[counter].cockThickness)
					index = counter;
			}
			return index;
		}
		
		public function thickestCockThickness():Number
		{
			if (cocks.length == 0)
				return 0;
			var counter:Number = cocks.length;
			var index:Number = 0;
			while (counter > 0)
			{
				counter--;
				if (cocks[index].cockThickness < cocks[counter].cockThickness)
					index = counter;
			}
			return cocks[index].cockThickness;
		}
		
		public function thinnestCockIndex():Number
		{
			if (cocks.length == 0)
				return 0;
			var counter:Number = cocks.length;
			var index:Number = 0;
			while (counter > 0)
			{
				counter--;
				if (cocks[index].cockThickness > cocks[counter].cockThickness)
					index = counter;
			}
			return index;
		}
		
		public function smallestCockIndex():Number
		{
			if (cocks.length == 0)
				return 0;
			var counter:Number = cocks.length;
			var index:Number = 0;
			while (counter > 0)
			{
				counter--;
				if (cockArea(index) > cockArea(counter))
				{
					index = counter;
				}
			}
			return index;
		}
		
		public function smallestCockLength():Number
		{
			if (cocks.length == 0)
				return 0;
			return cocks[smallestCockIndex()].cockLength;
		}
		
		public function shortestCockIndex():Number
		{
			if (cocks.length == 0)
				return 0;
			var counter:Number = cocks.length;
			var index:Number = 0;
			while (counter > 0)
			{
				counter--;
				if (cocks[index].cockLength > cocks[counter].cockLength)
					index = counter;
			}
			return index;
		}
		
		public function shortestCockLength():Number
		{
			if (cocks.length == 0)
				return 0;
			var counter:Number = cocks.length;
			var index:Number = 0;
			while (counter > 0)
			{
				counter--;
				if (cocks[index].cockLength > cocks[counter].cockLength)
					index = counter;
			}
			return cocks[index].cockLength;
		}
		
		//Find the biggest cock that fits inside a given value
		public function cockThatFits(i_fits:Number = 0, type:String = "area"):Number
		{
			if (cocks.length <= 0)
				return -1;
			var cockIdxPtr:int = cocks.length;
			//Current largest fitter
			var cockIndex:int = -1;
			while (cockIdxPtr > 0)
			{
				cockIdxPtr--;
				if (type == "area")
				{
					if (cockArea(cockIdxPtr) <= i_fits)
					{
						//If one already fits
						if (cockIndex >= 0)
						{
							//See if the newcomer beats the saved small guy
							if (cockArea(cockIdxPtr) > cockArea(cockIndex))
								cockIndex = cockIdxPtr;
						}
						//Store the index of fitting dick
						else
							cockIndex = cockIdxPtr;
					}
				}
				else if (type == "length")
				{
					if (cocks[cockIdxPtr].cockLength <= i_fits)
					{
						//If one already fits
						if (cockIndex >= 0)
						{
							//See if the newcomer beats the saved small guy
							if (cocks[cockIdxPtr].cockLength > cocks[cockIndex].cockLength)
								cockIndex = cockIdxPtr;
						}
						//Store the index of fitting dick
						else
							cockIndex = cockIdxPtr;
					}
				}
			}
			return cockIndex;
		}
		
		//Find the 2nd biggest cock that fits inside a given value
		public function cockThatFits2(fits:Number = 0):Number
		{
			if (cockTotal() == 1)
				return -1;
			var counter:Number = cocks.length;
			//Current largest fitter
			var index:Number = -1;
			var index2:Number = -1;
			while (counter > 0)
			{
				counter--;
				//Does this one fit?
				if (cockArea(counter) <= fits)
				{
					//If one already fits
					if (index >= 0)
					{
						//See if the newcomer beats the saved small guy
						if (cockArea(counter) > cockArea(index))
						{
							//Save old wang
							if (index != -1)
								index2 = index;
							index = counter;
						}
						//If this one fits and is smaller than the other great
						else
						{
							if ((cockArea(index2) < cockArea(counter)) && counter != index)
							{
								index2 = counter;
							}
						}
						if (index >= 0 && index == index2)
							trace("FUCK ERROR COCKTHATFITS2 SHIT IS BROKED!");
					}
					//Store the index of fitting dick
					else
						index = counter;
				}
			}
			return index2;
		}
		
		public function smallestCockArea():Number
		{
			if (cockTotal() == 0)
				return -1;
			return cockArea(smallestCockIndex());
		}
		
		public function smallestCock():Number
		{
			return cockArea(smallestCockIndex());
		}
		
		public function biggestCockIndex():Number
		{
			if (cocks.length == 0)
				return 0;
			var counter:Number = cocks.length;
			var index:Number = 0;
			while (counter > 0)
			{
				counter--;
				if (cockArea(index) < cockArea(counter))
					index = counter;
			}
			return index;
		}
		
		//Find the second biggest dick's index.
		public function biggestCockIndex2():Number
		{
			if (cocks.length <= 1)
				return 0;
			var counter:Number = cocks.length;
			var index:Number = 0;
			var index2:Number = 0;
			//Find the biggest
			while (counter > 0)
			{
				counter--;
				if (cockArea(index) < cockArea(counter))
					index = counter;
			}
			//Reset counter and find the next biggest
			counter = cocks.length;
			while (counter > 0)
			{
				counter--;
				//Make sure index2 doesn't get stuck
				//at the same value as index1 if the
				//initial location is biggest.
				if (index == index2 && counter != index)
					index2 = counter;
				//Is the stored value less than the current one?
				if (cockArea(index2) < cockArea(counter))
				{
					//Make sure we don't set index2 to be the same
					//as the biggest dick.
					if (counter != index)
						index2 = counter;
				}
			}
			//If it couldn't find a second biggest...
			if (index == index2)
				return 0;
			return index2;
		}
		
		public function smallestCockIndex2():Number
		{
			if (cocks.length <= 1)
				return 0;
			var counter:Number = cocks.length;
			var index:Number = 0;
			var index2:Number = 0;
			//Find the smallest
			while (counter > 0)
			{
				counter--;
				if (cockArea(index) > cockArea(counter))
					index = counter;
			}
			//Reset counter and find the next biggest
			counter = cocks.length;
			while (counter > 0)
			{
				counter--;
				//Make sure index2 doesn't get stuck
				//at the same value as index1 if the
				//initial location is biggest.
				if (index == index2 && counter != index)
					index2 = counter;
				//Is the stored value less than the current one?
				if (cockArea(index2) > cockArea(counter))
				{
					//Make sure we don't set index2 to be the same
					//as the biggest dick.
					if (counter != index)
						index2 = counter;
				}
			}
			//If it couldn't find a second biggest...
			if (index == index2)
				return 0;
			return index2;
		}
		
		//Find the third biggest dick index.
		public function biggestCockIndex3():Number
		{
			if (cocks.length <= 2)
				return 0;
			var counter:Number = cocks.length;
			var index:Number = 0;
			var index2:Number = -1;
			var index3:Number = -1;
			//Find the biggest
			while (counter > 0)
			{
				counter--;
				if (cockArea(index) < cockArea(counter))
					index = counter;
			}
			//Reset counter and find the next biggest
			counter = cocks.length;
			while (counter > 0)
			{
				counter--;
				//If this index isn't used already
				if (counter != index)
				{
					//Has index been set to anything yet?
					if (index2 == -1)
						index2 = counter;
					//Is the stored value less than the current one?
					else if (cockArea(index2) < cockArea(counter))
					{
						index2 = counter;
					}
				}
			}
			//If it couldn't find a second biggest...
			if (index == index2 || index2 == -1)
				index2 = 0;
			//Reset counter and find the next biggest
			counter = cocks.length;
			while (counter > 0)
			{
				counter--;
				//If this index isn't used already
				if (counter != index && counter != index2)
				{
					//Has index been set to anything yet?
					if (index3 == -1)
						index3 = counter;
					//Is the stored value less than the current one?
					else if (cockArea(index3) < cockArea(counter))
					{
						index3 = counter;
					}
				}
			}
			//If it fails for some reason.
			if (index3 == -1)
				index3 = 0;
			return index3;
		}

		
		public function cockDescript(cockIndex:int = 0):String
		{
			return Appearance.cockDescript(this, cockIndex);
		}
		
		public function cockAdjective(index:Number = -1):String {
			if (index < 0) index = biggestCockIndex();
			var isPierced:Boolean = (cocks.length == 1) && (cocks[index].isPierced); //Only describe as pierced or sock covered if the creature has just one cock
			var hasSock:Boolean = (cocks.length == 1) && (cocks[index].sock != "");
			var isGooey:Boolean = (skinType == CoC.SKIN_TYPE_GOO);
			return Appearance.cockAdjective(cocks[index].cockType, cocks[index].cockLength, cocks[index].cockThickness, lust, cumQ(), isPierced, hasSock, isGooey);
		}
		
		public function wetness():Number
		{
			if (vaginas.length == 0)
				return 0;
			else
				return vaginas[0].vaginalWetness;
		}
		
		public function vaginaType(newType:int = -1):int
		{
			if (!hasVagina())
				return -1;
			if (newType != -1)
			{
				vaginas[0].type = newType;
			}
			return vaginas[0].type;
		}
		
		public function looseness(vag:Boolean = true):Number
		{
			if (vag)
			{
				if (vaginas.length == 0)
					return 0;
				else
					return vaginas[0].vaginalLooseness;
			}
			else
			{
				return ass.analLooseness;
			}
		}
		
		public function vaginalCapacity():Number
		{
			//If the player has no vaginas
			if (vaginas.length == 0)
				return 0;
			var total:Number;
			var bonus:Number = 0;
			//Centaurs = +50 capacity
			if (lowerBody == 4)
				bonus = 50;
			//Naga = +20 capacity
			else if (lowerBody == 3)
				bonus = 20;
			//Wet pussy provides 20 point boost
			if (findPerk(PerkLib.WetPussy) >= 0)
				bonus += 20;
			if (findPerk(PerkLib.HistorySlut) >= 0)
				bonus += 20;
			if (findPerk(PerkLib.OneTrackMind) >= 0)
				bonus += 10;
			if (findPerk(PerkLib.Cornucopia) >= 0)
				bonus += 30;
			if(findPerk(PerkLib.FerasBoonWideOpen) >= 0)
				bonus += 25;
			if(findPerk(PerkLib.FerasBoonMilkingTwat) >= 0)
				bonus += 40;
			total = (bonus + statusAffectv1(StatusAffects.BonusVCapacity) + 8 * vaginas[0].vaginalLooseness * vaginas[0].vaginalLooseness) * (1 + vaginas[0].vaginalWetness / 10);
			return total;
		}
		
		public function analCapacity():Number
		{
			var bonus:Number = 0;
			//Centaurs = +30 capacity
			if (lowerBody == 4)
				bonus = 30;
			if (findPerk(PerkLib.HistorySlut) >= 0)
				bonus += 20;
			if (findPerk(PerkLib.Cornucopia) >= 0)
				bonus += 30;
			if (findPerk(PerkLib.OneTrackMind) >= 0)
				bonus += 10;
			if (ass.analWetness > 0)
				bonus += 15;
			return ((bonus + statusAffectv1(StatusAffects.BonusACapacity) + 6 * ass.analLooseness * ass.analLooseness) * (1 + ass.analWetness / 10));
		}
		
		public function hasFuckableNipples():Boolean
		{
			var counter:Number = breastRows.length;
			while (counter > 0)
			{
				counter--;
				if (breastRows[counter].fuckable)
					return true;
			}
			return false;
		}
		
		public function hasBreasts():Boolean
		{
			if (breastRows.length > 0)
			{
				if (biggestTitSize() >= 1)
					return true;
			}
			return false;
		}
		
		public function hasNipples():Boolean
		{
			var counter:Number = breastRows.length;
			while (counter > 0)
			{
				counter--;
				if (breastRows[counter].nipplesPerBreast > 0)
					return true;
			}
			return false;
		}
		
		public function lactationSpeed():Number
		{
			//Lactation * breastSize x 10 (milkPerBreast) determines scene
			return biggestLactation() * biggestTitSize() * 10;
		}
		
		//Hacky code till I can figure out how to move appearance code out.
		//TODO: Get rid of this 
		public virtual function dogScore():Number {
			throw new Error("Not implemented. BAD");
		}
		
		//Hacky code till I can figure out how to move appearance code out.
		//TODO: Get rid of this
		public virtual function foxScore():Number {
			throw new Error("Not implemented. BAD");
		}
		
		public function biggestLactation():Number
		{
			if (breastRows.length == 0)
				return 0;
			var counter:Number = breastRows.length;
			var index:Number = 0;
			while (counter > 0)
			{
				counter--;
				if (breastRows[index].lactationMultiplier < breastRows[counter].lactationMultiplier)
					index = counter;
			}
			return breastRows[index].lactationMultiplier;
		}
		public function milked():void
		{
			if (findStatusAffect(StatusAffects.LactationReduction) >= 0)
				changeStatusValue(StatusAffects.LactationReduction, 1, 0);
			if (findStatusAffect(StatusAffects.LactationReduc0) >= 0)
				removeStatusAffect(StatusAffects.LactationReduc0);
			if (findStatusAffect(StatusAffects.LactationReduc1) >= 0)
				removeStatusAffect(StatusAffects.LactationReduc1);
			if (findStatusAffect(StatusAffects.LactationReduc2) >= 0)
				removeStatusAffect(StatusAffects.LactationReduc2);
			if (findStatusAffect(StatusAffects.LactationReduc3) >= 0)
				removeStatusAffect(StatusAffects.LactationReduc3);
			if (findPerk(PerkLib.Feeder) >= 0)
			{
				//You've now been milked, reset the timer for that
				addStatusValue(StatusAffects.Feeder,1,1);
				changeStatusValue(StatusAffects.Feeder, 2, 0);
			}
		}
		public function boostLactation(todo:Number):Number
		{
			if (breastRows.length == 0)
				return 0;
			var counter:Number = breastRows.length;
			var index:Number = 0;
			var changes:Number = 0;
			var temp2:Number = 0;
			//Prevent lactation decrease if lactating.
			if (todo >= 0)
			{
				if (findStatusAffect(StatusAffects.LactationReduction) >= 0)
					changeStatusValue(StatusAffects.LactationReduction, 1, 0);
				if (findStatusAffect(StatusAffects.LactationReduc0) >= 0)
					removeStatusAffect(StatusAffects.LactationReduc0);
				if (findStatusAffect(StatusAffects.LactationReduc1) >= 0)
					removeStatusAffect(StatusAffects.LactationReduc1);
				if (findStatusAffect(StatusAffects.LactationReduc2) >= 0)
					removeStatusAffect(StatusAffects.LactationReduc2);
				if (findStatusAffect(StatusAffects.LactationReduc3) >= 0)
					removeStatusAffect(StatusAffects.LactationReduc3);
			}
			if (todo > 0)
			{
				while (todo > 0)
				{
					counter = breastRows.length;
					todo -= .1;
					while (counter > 0)
					{
						counter--;
						if (breastRows[index].lactationMultiplier > breastRows[counter].lactationMultiplier)
							index = counter;
					}
					temp2 = .1;
					if (breastRows[index].lactationMultiplier > 1.5)
						temp2 /= 2;
					if (breastRows[index].lactationMultiplier > 2.5)
						temp2 /= 2;
					if (breastRows[index].lactationMultiplier > 3)
						temp2 /= 2;
					changes += temp2;
					breastRows[index].lactationMultiplier += temp2;
				}
			}
			else
			{
				while (todo < 0)
				{
					counter = breastRows.length;
					index = 0;
					if (todo > -.1)
					{
						while (counter > 0)
						{
							counter--;
							if (breastRows[index].lactationMultiplier < breastRows[counter].lactationMultiplier)
								index = counter;
						}
						//trace(biggestLactation());
						breastRows[index].lactationMultiplier += todo;
						if (breastRows[index].lactationMultiplier < 0)
							breastRows[index].lactationMultiplier = 0;
						todo = 0;
					}
					else
					{
						todo += .1;
						while (counter > 0)
						{
							counter--;
							if (breastRows[index].lactationMultiplier < breastRows[counter].lactationMultiplier)
								index = counter;
						}
						temp2 = todo;
						changes += temp2;
						breastRows[index].lactationMultiplier += temp2;
						if (breastRows[index].lactationMultiplier < 0)
							breastRows[index].lactationMultiplier = 0;
					}
				}
			}
			return changes;
		}
		
		public function averageLactation():Number
		{
			if (breastRows.length == 0)
				return 0;
			var counter:Number = breastRows.length;
			var index:Number = 0;
			while (counter > 0)
			{
				counter--;
				index += breastRows[counter].lactationMultiplier;
			}
			return Math.floor(index / breastRows.length);
		}
		
		//Calculate bonus virility rating!
		//anywhere from 5% to 100% of normal cum effectiveness thru herbs!
		public function virilityQ():Number
		{
			if (!hasCock())
				return 0;
			var percent:Number = 0.01;
			if (cumQ() >= 250)
				percent += 0.01;
			if (cumQ() >= 800)
				percent += 0.01;
			if (cumQ() >= 1600)
				percent += 0.02;
			if (findPerk(PerkLib.BroBody) >= 0)
				percent += 0.05;
			if (findPerk(PerkLib.MaraesGiftStud) >= 0)
				percent += 0.15;
			if (findPerk(PerkLib.FerasBoonAlpha) >= 0)
				percent += 0.10;
			if (perkv1(PerkLib.ElvenBounty) > 0)
				percent += 0.05;
			if (findPerk(PerkLib.FertilityPlus) >= 0)
				percent += 0.03;
			if (findPerk(PerkLib.FertilityMinus) >= 0 && lib < 25) //Reduces virility by 3%.
				percent -= 0.03;
			if (findPerk(PerkLib.PiercedFertite) >= 0)
				percent += 0.03;
			if (findPerk(PerkLib.OneTrackMind) >= 0)
				percent += 0.03;
			if (findPerk(PerkLib.MagicalVirility) >= 0)
				percent += 0.05;
			//Messy Orgasms?
			if (findPerk(PerkLib.MessyOrgasms) >= 0)
				percent += 0.03;
			//Fertite ring bonus!
			if (jewelryEffectId == 3)
				percent += (jewelryEffectMagnitude / 100);
			if (jewelryEffectId == 4)
				percent -= (jewelryEffectMagnitude / 100);
			if (findPerk(PerkLib.AscensionVirility) >= 0)
				percent += perkv1(PerkLib.AscensionVirility) * 0.05;				
			if (percent > 1)
				percent = 1;
			if (percent < 0)
				percent = 0;

			return percent;
		}
		
		//Calculate cum return
		public function cumQ():Number
		{
			if (!hasCock())
				return 0;
			var quantity:Number = 0;
			//Base value is ballsize*ballQ*cumefficiency by a factor of 2.
			//Other things that affect it: 
			//lust - 50% = normal output.  0 = half output. 100 = +50% output.
			//trace("CUM ESTIMATE: " + int(1.25*2*cumMultiplier*2*(lust + 50)/10 * (hoursSinceCum+10)/24)/10 + "(no balls), " + int(ballSize*balls*cumMultiplier*2*(lust + 50)/10 * (hoursSinceCum+10)/24)/10 + "(withballs)");
			var lustCoefficient:Number = (lust + 50) / 10;
			//If realistic mode is enabled, limits cum to capacity.
			if (flags[kFLAGS.HUNGER_ENABLED] >= 1)
			{
				lustCoefficient = (lust + 50) / 5;
				if (findPerk(PerkLib.PilgrimsBounty) >= 0) lustCoefficient = 30;
				var percent:Number = 0;
				percent = lustCoefficient + (hoursSinceCum + 10);
				if (percent > 100)
					percent = 100;
				if (quantity > cumCapacity()) 
					quantity = cumCapacity();
				return (percent / 100) * cumCapacity();
			}
			//Pilgrim's bounty maxes lust coefficient
			if (findPerk(PerkLib.PilgrimsBounty) >= 0)
				lustCoefficient = 150 / 10;
			if (balls == 0)
				quantity = int(1.25 * 2 * cumMultiplier * 2 * lustCoefficient * (hoursSinceCum + 10) / 24) / 10;
			else
				quantity = int(ballSize * balls * cumMultiplier * 2 * lustCoefficient * (hoursSinceCum + 10) / 24) / 10;
			if (findPerk(PerkLib.BroBody) >= 0)
				quantity *= 1.3;
			if (findPerk(PerkLib.FertilityPlus) >= 0)
				quantity *= 1.5;
			if (findPerk(PerkLib.FertilityMinus) >= 0 && lib < 25)
				quantity *= 0.7;
			if (findPerk(PerkLib.MessyOrgasms) >= 0)
				quantity *= 1.5;
			if (findPerk(PerkLib.OneTrackMind) >= 0)
				quantity *= 1.1;
			if (findPerk(PerkLib.MaraesGiftStud) >= 0)
				quantity += 350;
			if (findPerk(PerkLib.FerasBoonAlpha) >= 0)
				quantity += 200;
			if (findPerk(PerkLib.MagicalVirility) >= 0)
				quantity += 200;
			if(findPerk(PerkLib.FerasBoonSeeder) >= 0)
				quantity += 1000;
			//if(hasPerk("Elven Bounty") >= 0) quantity += 250;;
			quantity += perkv1(PerkLib.ElvenBounty);
			if (findPerk(PerkLib.BroBody) >= 0)
				quantity += 200;
			quantity += statusAffectv1(StatusAffects.Rut);
			quantity *= (1 + (2 * perkv1(PerkLib.PiercedFertite)) / 100);
			if (jewelryEffectId == 3)
				quantity *= (1 + (jewelryEffectMagnitude / 100))
			if (jewelryEffectId == 4)
				quantity *= (1 - (jewelryEffectMagnitude / 100))			
			//trace("Final Cum Volume: " + int(quantity) + "mLs.");
			//if (quantity < 0) trace("SOMETHING HORRIBLY WRONG WITH CUM CALCULATIONS");
			if (quantity < 2)
				quantity = 2;
			if (quantity > int.MAX_VALUE)
				quantity = int.MAX_VALUE;
			return quantity;
		}
		
		//Limits how much cum you can produce. Can be altered with perks, ball size, and multiplier. Only applies to realistic mode.
		public function cumCapacity():Number 
		{
			if (!hasCock()) return 0;
			var cumCap:Number = 0;
			//Alter capacity by balls.
			if (balls > 0) cumCap += Math.pow(((4 / 3) * Math.PI * (ballSize / 2)), 3) * balls// * cumMultiplier
			else cumCap +=  Math.pow(((4 / 3) * Math.PI * 1), 3) * 2// * cumMultiplier
			//Alter capacity by perks.
			if (findPerk(PerkLib.BroBody) >= 0) cumCap *= 1.3;
			if (findPerk(PerkLib.FertilityPlus) >= 0) cumCap *= 1.5;
			if (findPerk(PerkLib.FertilityMinus) >= 0 && lib < 25) cumCap *= 0.7;
			if (findPerk(PerkLib.MessyOrgasms) >= 0) cumCap *= 1.5;
			if (findPerk(PerkLib.OneTrackMind) >= 0) cumCap *= 1.1;
			if (findPerk(PerkLib.MaraesGiftStud) >= 0) cumCap += 350;
			if (findPerk(PerkLib.FerasBoonAlpha) >= 0) cumCap += 200;
			if (findPerk(PerkLib.MagicalVirility) >= 0) cumCap += 200;
			if (findPerk(PerkLib.FerasBoonSeeder) >= 0) cumCap += 1000;
			cumCap += perkv1(PerkLib.ElvenBounty);
			if (findPerk(PerkLib.BroBody) >= 0) cumCap += 200;
			cumCap += statusAffectv1(StatusAffects.Rut);
			cumCap *= (1 + (2 * perkv1(PerkLib.PiercedFertite)) / 100);
			//Alter capacity by accessories.
			if (jewelryEffectId == 3) cumCap *= (1 + (jewelryEffectMagnitude / 100));
			if (jewelryEffectId == 4) cumCap *= (1 - (jewelryEffectMagnitude / 100));
				
			cumCap *= cumMultiplier
			cumCap == Math.round(cumCap);
			if (cumCap > int.MAX_VALUE) 
				cumCap = int.MAX_VALUE;
			return cumCap;
		}
		
		public function countCocksOfType(type:CockTypesEnum):int {
			if (cocks.length == 0) return 0;
			var counter:int = 0;
			for (var x:int = 0; x < cocks.length; x++) {
				if (cocks[x].cockType == type) counter++;
			}
			return counter;
		}
		
		public function anemoneCocks():int { //How many anemonecocks?
			return countCocksOfType(CockTypesEnum.ANEMONE);
		}
		
		public function catCocks():int { //How many catcocks?
			return countCocksOfType(CockTypesEnum.CAT);
		}
		
		public function demonCocks():int { //How many demoncocks?
			return countCocksOfType(CockTypesEnum.DEMON);
		}
		
		public function displacerCocks():int { //How many displacerCocks?
			return countCocksOfType(CockTypesEnum.DISPLACER);
		}
		
		// Note: DogCocks/FoxCocks are functionally identical. They actually change back and forth depending on some
		// of the PC's attributes, and this is recaluculated every hour spent at camp.
		// As such, delineating between the two is kind of silly.
		public function dogCocks():int { //How many dogCocks
			if (cocks.length == 0) return 0;
			var counter:int = 0;
			for (var x:int = 0; x < cocks.length; x++) {
				if (cocks[x].cockType == CockTypesEnum.DOG || cocks[x].cockType == CockTypesEnum.FOX) counter++;
			}
			return counter;
		}
		
		public function dragonCocks():int { //How many dragonCocks?
			return countCocksOfType(CockTypesEnum.DRAGON);
		}
		
		public function foxCocks():int { //How many foxCocks
			return dogCocks();
		}
		
		public function horseCocks():int { //How many horsecocks?
			return countCocksOfType(CockTypesEnum.HORSE);
		}
		
		public function kangaCocks():int { //How many kangawangs?
			return countCocksOfType(CockTypesEnum.KANGAROO);
		}
		
		public function lizardCocks():int { //How many lizard/snake-cocks?
			return countCocksOfType(CockTypesEnum.LIZARD);
		}
		
		public function pigCocks():int { //How many lizard/snake-cocks?
			return countCocksOfType(CockTypesEnum.PIG);
		}
		
		public function normalCocks():int { //How many normalCocks?
			return countCocksOfType(CockTypesEnum.HUMAN);
		}
		
		public function tentacleCocks():int { //How many tentaclecocks?
			return countCocksOfType(CockTypesEnum.TENTACLE);
		}
		
		public function findFirstCockType(ctype:CockTypesEnum):Number
		{
			var index:Number = 0;
			if (cocks[index].cockType == ctype)
				return index;
			while (index < cocks.length)
			{
				index++;
				if (cocks[index].cockType == ctype)
					return index;
			}
			//trace("Creature.findFirstCockType ERROR - searched for cocktype: " + ctype + " and could not find it.");
			return 0;
		}
		
		/*public function findFirstCockType(type:Number = 0):Number
		{
			var index:Number = 0;
			if (cocks[index].cockType == type)
				return index;
			while (index < cocks.length)
			{
				index++;
				if (cocks[index].cockType == type)
					return index;
			}
			//trace("Creature.findFirstCockType ERROR - searched for cocktype: " + type + " and could not find it.");
			return 0;
		}*/
		
		//Change first normal cock to horsecock!
		//Return number of affected cock, otherwise -1
		public function addHorseCock():Number
		{
			var counter:Number = cocks.length;
			while (counter > 0)
			{
				counter--;
				//Human - > horse
				if (cocks[counter].cockType == CockTypesEnum.HUMAN)
				{
					cocks[counter].cockType = CockTypesEnum.HORSE;
					return counter;
				}
				//Dog - > horse
				if (cocks[counter].cockType == CockTypesEnum.DOG)
				{
					cocks[counter].cockType = CockTypesEnum.HORSE;
					return counter;
				}
				//Tentacle - > horse
				if (cocks[counter].cockType == CockTypesEnum.TENTACLE)
				{
					cocks[counter].cockType = CockTypesEnum.HORSE;
					return counter;
				}
				//Demon -> horse
				if (cocks[counter].cockType == CockTypesEnum.DEMON)
				{
					cocks[counter].cockType = CockTypesEnum.HORSE;
					return counter;
				}
				//Catch-all
				if (cocks[counter].cockType.Index > 4)
				{
					cocks[counter].cockType = CockTypesEnum.HORSE;
					return counter;
				}
			}
			return -1;
		}
		
		//TODO Seriously wtf. 1500+ calls to cockTotal, 340+ call to totalCocks. I'm scared to touch either.
		//How many cocks?
		public function cockTotal():Number
		{
			return (cocks.length);
		}
		
		//Alternate
		public function totalCocks():Number
		{
			return (cocks.length);
		}
		
		//BOolean alternate
		public function hasCock():Boolean
		{
			return cocks.length >= 1;

		}
		
		public function hasSockRoom():Boolean
		{
			var index:int = cocks.length;
			while (index > 0)
			{
				index--;
				if (cocks[index].sock == "")
					return true;
			}
			return false
		}
		
		// Deprecated
		public function hasSock(arg:String = ""):Boolean
		{
			var index:int = cocks.length;
			
			while (index > 0)
			{
				index--;
				if (cocks[index].sock != "")
				{
				if (arg == "" || cocks[index].sock == arg)
					return true;
				}
			}
			return false
		}
		public function countCockSocks(type:String):int
		{
			var count:int = 0;
			
			for (var i:Number = 0; i < cocks.length; i++) {
				if (cocks[i].sock == type) {
					count++
				}
			}
			//trace("countCockSocks found " + count + " " + type);
			return count;
		}
		
		public function canAutoFellate():Boolean
		{
			if (!hasCock())
				return false;
			return (cocks[0].cockLength >= 20);
		}
		
		//PC can fly?
		public function canFly():Boolean
		{
			//web also makes false!
			if (findStatusAffect(StatusAffects.Web) >= 0)
				return false;
			return _wingType == 2 || _wingType == 7 || _wingType == 9 || _wingType == 11 || _wingType == 12;

		}
		
		//check for vagoo
		public function hasVagina():Boolean
		{
			return vaginas.length > 0;

		}
		
		public function hasVirginVagina():Boolean
		{
			if (vaginas.length > 0)
				return vaginas[0].virgin;
			return false;
		}

		//GENDER IDENTITIES
		public function genderText(male:String = "man", female:String = "woman", futa:String = "herm", eunuch:String = "eunuch"):String
		{
			if (vaginas.length > 0) {
				if (cocks.length > 0) return futa;
				return female;
			}
			else if (cocks.length > 0) {
				return male;
			}
			return eunuch;
		}

		public function manWoman(caps:Boolean = false):String
		{
			//Dicks?
			if (totalCocks() > 0)
			{
				if (hasVagina())
				{
					if (caps)
						return "Futa";
					else
						return "futa";
				}
				else
				{
					if (caps)
						return "Man";
					else
						return "man";
				}
			}
			else
			{
				if (hasVagina())
				{
					if (caps)
						return "Woman";
					else
						return "woman";
				}
				else
				{
					if (caps)
						return "Eunuch";
					else
						return "eunuch";
				}
			}
		}
		
		public function guyGirl(caps:Boolean = false):String
		{
			if (caps)
				return mf("Guy", "Girl");
			else 
				return mf("guy", "girl");
		}
		
		public function mfn(male:String, female:String, neuter:String):String
		{
			if (gender == 0)
				return neuter;
			else
				return mf(male, female);
		}
		
		//Rewritten!
		public function mf(male:String, female:String):String
		{
			//if (femWeight()) return female;
			//else return male;
			//Dicks?
			if (totalCocks() > 0)
			{
				if (hasVagina())
				{
					if (biggestTitSize() >= 2) return female;
					else if (biggestTitSize() == 1) {
						if (kGAMECLASS.player.femininity > 50) return female;
						else return male;
					}
					else return male;
				}
				else return male;
			}
			else
			{
				if (hasVagina())
					if (biggestTitSize() == 0 && kGAMECLASS.player.femininity < 45) return male;
					else return female;
				else
				{
					if (biggestTitSize() >= 3) return female;
					else return male;
				}
			}
		}
		
		//Used for measuring femininity. If less than 50, returns false for male. Otherwise, returns true for female.
		/*public function femWeight():Number {
			//1/2 facial
			var weighting:Number = femininity;
			//Tits count up to their rating for femininity
			if (biggestTitSize() >= 1) {
				trace("boobs confirmed");
				if (biggestTitSize() * 3 > 50) weighting += 50;
				else weighting += biggestTitSize() * 3;
			}
			//Flat chest + 20 masculine
			else if (biggestTitSize() == 0) {
				trace("no boobs confirmed");
				weighting -= 20;
			}
			//Hips give small boost
			if (hipRating() >= 6) weighting += hipRating() * 1.5;
			else weighting -= (6 - hipRating()) * 3;
			if (hairLength > 8) weighting += (hairLength - 7) * 1.5;
			else weighting -= (8 - hairLength) * 1.5;
			if (tone > 70) weighting -= 10;
			if (tone < 30) weighting += 10;
			if (lipRating() > 1) weighting += lipRating() * 3;
			if (hasBeard()) weighting -= 100;
			trace("Femininity Rating = " + weighting);
			//Neuters first!
			if (weighting <= 49) return false;
			else return true;
		} */
		
		
		public function boyGirl(caps:Boolean = false):String
		{
			if (caps) return mf("Boy", "Girl");
			else return mf("boy", "girl");
		}
		
		public function heShe(caps:Boolean = false):String
		{
			if (caps) return mf("He", "She");
			else return mf("he", "she");
		}
		
		public function himHer(caps:Boolean = false):String
		{
			if (caps) return mf("Him", "Her");
			else return mf("him", "her");
		}
		
		public function maleFemale(caps:Boolean = false):String
		{
			if (caps) return mf("Male", "Female");
			else return mf("male", "female");
		}
		
		public function maleFemaleHerm(caps:Boolean = false):String
		{
			if (gender == 0) {
				if (caps) return mf("Genderless", "Fem-genderless");
				else return mf("genderless", "fem-genderless");
			}
			else if (gender == 1) {
				if (caps) return mf("Male", "Dickgirl");
				else return mf("male", "dickgirl");
			}
			else if (gender == 2) {
				if (caps) return mf("Cuntboy", "Female");
				else return mf("cuntboy", "female");
			}
			else if (gender == 3) {
				if (caps) return mf("Maleherm", "Hermaphrodite");
				else return mf("maleherm", "hermaphrodite");
			}
			else return "<b>Gender error!</b>";
		}
		
		public function hisHer(caps:Boolean = false):String
		{
			if (caps) return mf("His", "Her");
			else return mf("his", "her");
		}
		
		//sir/madam
		public function sirMadam(caps:Boolean = false):String
		{
			if (caps) return mf("Sir", "Madam");
			else return mf("sir", "madam");
		}
		
		//Create a cock. Default type is HUMAN
		public function createCock(clength:Number = 5.5, cthickness:Number = 1,ctype:CockTypesEnum=null):Boolean
		{
			if (ctype == null) ctype = CockTypesEnum.HUMAN;
			if (cocks.length >= 10)
				return false;
			var newCock:Cock = new Cock(clength, cthickness,ctype);
			//var newCock:cockClass = new cockClass();
			cocks.push(newCock);
			cocks[cocks.length-1].cockThickness = cthickness;
			cocks[cocks.length-1].cockLength = clength;
			return true;
		}
		
		//create vagoo
		public function createVagina(virgin:Boolean = true, vaginalWetness:Number = 1, vaginalLooseness:Number = 0):Boolean
		{
			if (vaginas.length >= 2)
				return false;
			var newVagina:VaginaClass = new VaginaClass(vaginalWetness,vaginalLooseness,virgin);
			vaginas.push(newVagina);
			return true;
		}
		
		//create a row of breasts
		public function createBreastRow(size:Number=0,nipplesPerBreast:Number=1):Boolean
		{
			if (breastRows.length >= 10)
				return false;
			var newBreastRow:BreastRowClass = new BreastRowClass();
			newBreastRow.breastRating = size;
			newBreastRow.nipplesPerBreast = nipplesPerBreast;
			breastRows.push(newBreastRow);
			return true;
		}
		
		public function genderCheck():void
		{
			if (hasCock() && hasVagina())
				gender = GENDER_HERM;
			else if (hasCock())
				gender = GENDER_MALE;
			else if (hasVagina())
				gender = GENDER_FEMALE;
			else
				gender = GENDER_NONE;
		}
		
		//Remove cocks
		public function removeCock(arraySpot:int, totalRemoved:int):void
		{
			//Various Errors preventing action
			if (arraySpot < 0 || totalRemoved <= 0)
			{
				//trace("ERROR: removeCock called but arraySpot is negative or totalRemoved is 0.");
				return;
			}
			if (cocks.length == 0)
			{
				//trace("ERROR: removeCock called but cocks do not exist.");
			}
			else
			{
				if (arraySpot > cocks.length - 1)
				{
					//trace("ERROR: removeCock failed - array location is beyond the bounds of the array.");
				}
				else
				{
					try
					{
						cocks.splice(arraySpot, totalRemoved);
					}
					catch (e:Error)
					{
						trace("Argument error in Creature[" + this._short + "]: " + e.message);
					}
					//trace("Attempted to remove " + totalRemoved + " cocks.");
				}
			}
			genderCheck();
		}
		
		//REmove vaginas
		public function removeVagina(arraySpot:int = 0, totalRemoved:int = 1):void
		{
			//Various Errors preventing action
			if (arraySpot < -1 || totalRemoved <= 0)
			{
				//trace("ERROR: removeVagina called but arraySpot is negative or totalRemoved is 0.");
				return;
			}
			if (vaginas.length == 0)
			{
				//trace("ERROR: removeVagina called but cocks do not exist.");
			}
			else
			{
				if (arraySpot > vaginas.length - 1)
				{
					//trace("ERROR: removeVagina failed - array location is beyond the bounds of the array.");
				}
				else
				{
					vaginas.splice(arraySpot, totalRemoved);
					//trace("Attempted to remove " + totalRemoved + " vaginas.");
				}
			}
			genderCheck();
		}
		
		//Remove a breast row
		public function removeBreastRow(arraySpot:int, totalRemoved:int):void
		{
			//Various Errors preventing action
			if (arraySpot < -1 || totalRemoved <= 0)
			{
				//trace("ERROR: removeBreastRow called but arraySpot is negative or totalRemoved is 0.");
				return;
			}
			if (breastRows.length == 0)
			{
				//trace("ERROR: removeBreastRow called but cocks do not exist.");
			}
			else if (breastRows.length == 1 || breastRows.length - totalRemoved < 1)
			{
				//trace("ERROR: Removing the current breast row would break the Creature classes assumptions about breastRow contents.");
			}
			else
			{
				if (arraySpot > breastRows.length - 1)
				{
					//trace("ERROR: removeBreastRow failed - array location is beyond the bounds of the array.");
				}
				else
				{
					breastRows.splice(arraySpot, totalRemoved);
					//trace("Attempted to remove " + totalRemoved + " breastRows.");
				}
			}
		}
		
		// This is placeholder shit whilst I work out a good way of BURNING ENUM TO THE FUCKING GROUND
		// and replacing it with something that will slot in and work with minimal changes and not be
		// A FUCKING SHITSTAIN when it comes to intelligent de/serialization.
		public function fixFuckingCockTypesEnum():void
		{
			if (this.cocks.length > 0)
			{
				for (var i:int = 0; i < this.cocks.length; i++)
				{
					this.cocks[i].cockType = CockTypesEnum.ParseConstantByIndex(this.cocks[i].cockType.Index);
				}
			}
		}

		public function buttChangeNoDisplay(cArea:Number):Boolean {
			var stretched:Boolean = false;
			//cArea > capacity = autostreeeeetch half the time.
			if(cArea >= analCapacity() && rand(2) == 0) {
				if(ass.analLooseness >= 5) {}
				else ass.analLooseness++;
				stretched = true;
				//Reset butt stretchin recovery time
				if(findStatusAffect(StatusAffects.ButtStretched) >= 0) changeStatusValue(StatusAffects.ButtStretched,1,0);
			}
			//If within top 10% of capacity, 25% stretch
			if(cArea < analCapacity() && cArea >= .9*analCapacity() && rand(4) == 0) {
				ass.analLooseness++;
				stretched = true;
			}
			//if within 75th to 90th percentile, 10% stretch
			if(cArea < .9 * analCapacity() && cArea >= .75 * analCapacity() && rand(10) == 0) {
				ass.analLooseness++;
				stretched = true;
			}
			//Anti-virgin
			if(ass.analLooseness == 0) {
				ass.analLooseness++;
				stretched = true;
			}
			//Delay un-stretching
			if(cArea >= .5 * analCapacity()) {
				//Butt Stretched used to determine how long since last enlargement
				if(findStatusAffect(StatusAffects.ButtStretched) < 0) createStatusAffect(StatusAffects.ButtStretched,0,0,0,0);
				//Reset the timer on it to 0 when restretched.
				else changeStatusValue(StatusAffects.ButtStretched,1,0);
			}
			if(stretched) {
				trace("BUTT STRETCHED TO " + (ass.analLooseness) + ".");
			}
			return stretched;
		}

		public function cuntChangeNoDisplay(cArea:Number):Boolean{
			if(vaginas.length == 0) return false;
			var stretched:Boolean = false;
			if(findPerk(PerkLib.FerasBoonMilkingTwat) < 0 || vaginas[0].vaginalLooseness <= VAGINA_LOOSENESS_NORMAL) {
			//cArea > capacity = autostreeeeetch.
			if(cArea >= vaginalCapacity()) {
				if(vaginas[0].vaginalLooseness >= VAGINA_LOOSENESS_LEVEL_CLOWN_CAR) {}
				else vaginas[0].vaginalLooseness++;
				stretched = true;
			}
			//If within top 10% of capacity, 50% stretch
			else if(cArea >= .9 * vaginalCapacity() && rand(2) == 0) {
				vaginas[0].vaginalLooseness++;
				stretched = true;
			}
			//if within 75th to 90th percentile, 25% stretch
			else if(cArea >= .75 * vaginalCapacity() && rand(4) == 0) {
				vaginas[0].vaginalLooseness++;
				stretched = true;
				}
			}
			//If virgin
			if(vaginas[0].virgin) {
				vaginas[0].virgin = false;
			}
			//Delay anti-stretching
			if(cArea >= .5 * vaginalCapacity()) {
				//Cunt Stretched used to determine how long since last enlargement
				if(findStatusAffect(StatusAffects.CuntStretched) < 0) createStatusAffect(StatusAffects.CuntStretched,0,0,0,0);
				//Reset the timer on it to 0 when restretched.
				else changeStatusValue(StatusAffects.CuntStretched,1,0);
			}
			if(stretched) {
				trace("CUNT STRETCHED TO " + (vaginas[0].vaginalLooseness) + ".");
			}
			return stretched;
		}
		
		public function get inHeat():Boolean {
			return findStatusAffect(StatusAffects.Heat) >= 0;
		}
		
		public function get inRut():Boolean {
			return findStatusAffect(StatusAffects.Rut) >= 0;
		}

		public function bonusFertility():Number
		{
			var counter:Number = 0;
			if (inHeat)
				counter += statusAffectv1(StatusAffects.Heat);
			if (findPerk(PerkLib.FertilityPlus) >= 0)
				counter += 15;
			if (findPerk(PerkLib.FertilityMinus) >= 0 && lib < 25)
				counter -= 15;
			if (findPerk(PerkLib.MaraesGiftFertility) >= 0)
				counter += 50;
			if (findPerk(PerkLib.FerasBoonBreedingBitch) >= 0)
				counter += 30;
			if (findPerk(PerkLib.MagicalFertility) >= 0)
				counter += 10;
			counter += perkv2(PerkLib.ElvenBounty);
			counter += perkv1(PerkLib.PiercedFertite);
			if (jewelryEffectId == 3)
				counter += jewelryEffectMagnitude
			if (jewelryEffectId == 4)
				counter -= jewelryEffectMagnitude
			counter += perkv1(PerkLib.AscensionFertility) * 5;
			return counter;
		}

		public function totalFertility():Number
		{
			return (bonusFertility() + fertility);
		}

		public function isBiped():Boolean
		{
			//Naga/Centaur
			if (lowerBody == LOWER_BODY_TYPE_NAGA || lowerBody == LOWER_BODY_TYPE_CENTAUR)
				return false;
			if (lowerBody == LOWER_BODY_TYPE_GOO || lowerBody == LOWER_BODY_TYPE_PONY)
				return false;
			return true;
		}

		public function isNaga():Boolean
		{
			if (lowerBody == LOWER_BODY_TYPE_NAGA)
				return true;
			return false;
		}

		public function isTaur():Boolean
		{
			if (lowerBody == LOWER_BODY_TYPE_CENTAUR || lowerBody == LOWER_BODY_TYPE_PONY)
				return true;
			return false;
		}

		public function isDrider():Boolean
		{
			return (lowerBody == LOWER_BODY_TYPE_DRIDER_LOWER_BODY);
		}

		public function isGoo():Boolean
		{
			if (lowerBody == LOWER_BODY_TYPE_GOO)
				return true;
			return false;
		}

		public function legs():String
		{
			var select:Number = 0;
			//lowerBody:
			//0 - normal
			if (lowerBody == 0)
				return "legs";
			//1 - hooves
			if (lowerBody == 1)
				return "legs";
			//2 - paws
			if (lowerBody == 2)
				return "legs";
			//3 - snakelike body
			if (lowerBody == 3)
				return "snake-like coils";
			//4 - centaur!
			if (lowerBody == 4)
				return "four legs";
			//8 - goo shit
			if (lowerBody == 8)
				return "mounds of goo";
			//PONY
			if (lowerBody == 11)
				return "cute pony-legs";
			//Bunnah!
			if (lowerBody == 12) {
				select = Math.floor(Math.random() * (5));
				if (select == 0)
					return "fuzzy, bunny legs";
				else if (select == 1)
					return "fur-covered legs";
				else if (select == 2)
					return "furry legs";
				else
					return "legs";
			}
			if (lowerBody == 13) {
				select = Math.floor(Math.random() * (5));
				if (select == 0)
					return "bird-like legs";
				else if (select == 1)
					return "feathered legs";
				else
					return "legs";
			}
			if (lowerBody == 17) {
				select = Math.floor(Math.random() * (4));
				if (select == 0)
					return "fox-like legs";
				else if (select == 1)
					return "legs";
				else if (select == 2)
					return "legs";
				else
					return "vulpine legs";
			}
			if (lowerBody == 19) {
				select = Math.floor(Math.random() * (4));
				if (select == 0)
					return "raccoon-like legs";
				else
					return "legs";
			}
			if (lowerBody == 21) {
				select = Math.floor(Math.random() * (4));
				if (select == 0)
					return "pig-like legs";
				else if (select == 1)
					return "legs";
				else if (select == 2)
					return "legs";
				else
					return "swine legs";
			}
			return "legs";
		}

		public function skinFurScales():String
		{
			var skinzilla:String = "";
			//Adjectives first!
			if (skinAdj != "")
				skinzilla += skinAdj + ", ";
			//Fur handled a little differently since it uses
			//haircolor
			if (_skinType == 1)
				skinzilla += hairColor + " ";
			else
				skinzilla += _skinTone + " ";
			skinzilla += skinDesc;
			return skinzilla;
		}

		public function leg():String
		{
			var select:Number = 0;
			//lowerBody:
			//0 - normal
			if (lowerBody == 0)
				return "leg";
			//1 - hooves
			if (lowerBody == 1)
				return "leg";
			//2 - paws
			if (lowerBody == 2)
				return "leg";
			//3 - snakelike body
			if (lowerBody == 3)
				return "snake-tail";
			//4 - centaur!
			if (lowerBody == 4)
				return "equine leg";
			//8 - goo shit
			if (lowerBody == 8)
				return "mound of goo";
			//PONY
			if (lowerBody == 11)
				return "cartoonish pony-leg";
			//BUNNAH
			if (lowerBody == 12) {
				select = Math.random() * (5);
				if (select == 0)
					return "fuzzy, bunny leg";
				else if (select == 1)
					return "fur-covered leg";
				else if (select == 2)
					return "furry leg";
				else
					return "leg";
			}
			if (lowerBody == 13) {
				select = Math.floor(Math.random() * (5));
				if (select == 0)
					return "bird-like leg";
				else if (select == 1)
					return "feathered leg";
				else
					return "leg";
			}
			if (lowerBody == 17) {
				select = Math.floor(Math.random() * (4));
				if (select == 0)
					return "fox-like leg";
				else if (select == 1)
					return "leg";
				else if (select == 2)
					return "leg";
				else
					return "vulpine leg";
			}
			if (lowerBody == 19) {
				select = Math.floor(Math.random() * (4));
				if (select == 0)
					return "raccoon-like leg";
				else
					return "leg";
			}
			return "leg";
		}

		public function feet():String
		{
			var select:Number = 0;
			//lowerBody:
			//0 - normal
			if (lowerBody == 0)
				return "feet";
			//1 - hooves
			if (lowerBody == 1)
				return "hooves";
			//2 - paws
			if (lowerBody == 2)
				return "paws";
			//3 - snakelike body
			if (lowerBody == 3)
				return "coils";
			//4 - centaur!
			if (lowerBody == 4)
				return "hooves";
			//5 - demonic heels
			if (lowerBody == 5)
				return "demonic high-heels";
			//6 - demonic claws
			if (lowerBody == 6)
				return "demonic foot-claws";
			//8 - goo shit
			if (lowerBody == 8)
				return "slimey cillia";
			if (lowerBody == 11)
				return "flat pony-feet";
			//BUNNAH
			if (lowerBody == 12) {
				select = rand(5);
				if (select == 0)
					return "large bunny feet";
				else if (select == 1)
					return "rabbit feet";
				else if (select == 2)
					return "large feet";
				else
					return "feet";
			}
			if (lowerBody == 13) {
				select = Math.floor(Math.random() * (5));
				if (select == 0)
					return "taloned feet";
				else
					return "feet";
			}
			if (lowerBody == 14)
				return "foot-paws";
			if (lowerBody == 17) {
				select = rand(4);
				if (select == 0)
					return "paws";
				else if (select == 1)
					return "soft, padded paws";
				else if (select == 2)
					return "fox-like feet";
				else
					return "paws";
			}
			if (lowerBody == 19) {
				select = Math.floor(Math.random() * (3));
				if (select == 0)
					return "raccoon-like feet";
				else if (select == 1)
					return "long-toed paws";
				else if (select == 2)
					return "feet";
				else
					return "paws";
			}
			return "feet";
		}

		public function foot():String
		{
			var select:Number = 0;
			//lowerBody:
			//0 - normal
			if (lowerBody == 0)
				return "foot";
			//1 - hooves
			if (lowerBody == 1)
				return "hoof";
			//2 - paws
			if (lowerBody == 2)
				return "paw";
			//3 - snakelike body
			if (lowerBody == 3)
				return "coiled tail";
			//4 - centaur!
			if (lowerBody == 4)
				return "hoof";
			//8 - goo shit
			if (lowerBody == 8)
				return "slimey undercarriage";
			//PONY
			if (lowerBody == 11)
				return "flat pony-foot";
			//BUNNAH
			if (lowerBody == 12) {
				select = Math.random() * (5);
				if (select == 0)
					return "large bunny foot";
				else if (select == 1)
					return "rabbit foot";
				else if (select == 2)
					return "large foot";
				else
					return "foot";
			}
			if (lowerBody == 13) {
				select = Math.floor(Math.random() * (5));
				if (select == 0)
					return "taloned foot";
				else
					return "foot";
			}
			if (lowerBody == 17) {
				select = Math.floor(Math.random() * (4));
				if (select == 0)
					return "paw";
				else if (select == 1)
					return "soft, padded paw";
				else if (select == 2)
					return "fox-like foot";
				else
					return "paw";
			}
			if (lowerBody == 14)
				return "foot-paw";
			if (lowerBody == 19) {
				select = Math.floor(Math.random() * (3));
				if (select == 0)
					return "raccoon-like foot";
				else if (select == 1)
					return "long-toed paw";
				else if (select == 2)
					return "foot";
				else
					return "paw";
			}
			return "foot";
		}

		public function canOvipositSpider():Boolean
		{
			if (eggs() >= 10 && findPerk(PerkLib.SpiderOvipositor) >= 0 && isDrider() && tailType == 5)
				return true;
			return false;
		}

		public function canOvipositBee():Boolean
		{
			if (eggs() >= 10 && findPerk(PerkLib.BeeOvipositor) >= 0 && tailType == 6)
				return true;
			return false;
		}

		public function canOviposit():Boolean
		{
			if (canOvipositSpider() || canOvipositBee())
				return true;
			return false;
		}

		public function eggs():int
		{
			if (findPerk(PerkLib.SpiderOvipositor) < 0 && findPerk(PerkLib.BeeOvipositor) < 0)
				return -1;
			else if (findPerk(PerkLib.SpiderOvipositor) >= 0)
				return perkv1(PerkLib.SpiderOvipositor);
			else
				return perkv1(PerkLib.BeeOvipositor);
		}

		public function addEggs(arg:int = 0):int
		{
			if (findPerk(PerkLib.SpiderOvipositor) < 0 && findPerk(PerkLib.BeeOvipositor) < 0)
				return -1;
			else {
				if (findPerk(PerkLib.SpiderOvipositor) >= 0) {
					addPerkValue(PerkLib.SpiderOvipositor, 1, arg);
					if (eggs() > 50)
						setPerkValue(PerkLib.SpiderOvipositor, 1, 50);
					return perkv1(PerkLib.SpiderOvipositor);
				}
				else {
					addPerkValue(PerkLib.BeeOvipositor, 1, arg);
					if (eggs() > 50)
						setPerkValue(PerkLib.BeeOvipositor, 1, 50);
					return perkv1(PerkLib.BeeOvipositor);
				}
			}
		}

		public function dumpEggs():void
		{
			if (findPerk(PerkLib.SpiderOvipositor) < 0 && findPerk(PerkLib.BeeOvipositor) < 0)
				return;
			setEggs(0);
			//Sets fertile eggs = regular eggs (which are 0)
			fertilizeEggs();
		}

		public function setEggs(arg:int = 0):int
		{
			if (findPerk(PerkLib.SpiderOvipositor) < 0 && findPerk(PerkLib.BeeOvipositor) < 0)
				return -1;
			else {
				if (findPerk(PerkLib.SpiderOvipositor) >= 0) {
					setPerkValue(PerkLib.SpiderOvipositor, 1, arg);
					if (eggs() > 50)
						setPerkValue(PerkLib.SpiderOvipositor, 1, 50);
					return perkv1(PerkLib.SpiderOvipositor);
				}
				else {
					setPerkValue(PerkLib.BeeOvipositor, 1, arg);
					if (eggs() > 50)
						setPerkValue(PerkLib.BeeOvipositor, 1, 50);
					return perkv1(PerkLib.BeeOvipositor);
				}
			}
		}

		public function fertilizedEggs():int
		{
			if (findPerk(PerkLib.SpiderOvipositor) < 0 && findPerk(PerkLib.BeeOvipositor) < 0)
				return -1;
			else if (findPerk(PerkLib.SpiderOvipositor) >= 0)
				return perkv2(PerkLib.SpiderOvipositor);
			else
				return perkv2(PerkLib.BeeOvipositor);
		}

		public function fertilizeEggs():int
		{
			if (findPerk(PerkLib.SpiderOvipositor) < 0 && findPerk(PerkLib.BeeOvipositor) < 0)
				return -1;
			else if (findPerk(PerkLib.SpiderOvipositor) >= 0)
				setPerkValue(PerkLib.SpiderOvipositor, 2, eggs());
			else
				setPerkValue(PerkLib.BeeOvipositor, 2, eggs());
			return fertilizedEggs();
		}

		public function breastCup(rowNum:Number):String
		{
			return Appearance.breastCup(breastRows[rowNum].breastRating);
//Should change this to make use of Appearance			return BreastStore.cupSize(breastRows[rowNum].breastRating);
			/*
			if (breastRows[rowNum].breastRating < 1)
				return "flat, manly breast";
			else if (breastRows[rowNum].breastRating < 2)
				return "A-cup";
			else if (breastRows[rowNum].breastRating < 3)
				return "B-cup";
			else if (breastRows[rowNum].breastRating < 4)
				return "C-cup";
			else if (breastRows[rowNum].breastRating < 5)
				return "D-cup";
			else if (breastRows[rowNum].breastRating < 6)
				return "DD-cup";
			else if (breastRows[rowNum].breastRating < 7)
				return "big DD-cup";
			else if (breastRows[rowNum].breastRating < 8)
				return "E-cup";
			else if (breastRows[rowNum].breastRating < 9)
				return "big E-cup";
			else if (breastRows[rowNum].breastRating < 10)
				return "EE-cup";
			else if (breastRows[rowNum].breastRating < 11)
				return "big EE-cup";
			else if (breastRows[rowNum].breastRating < 12)
				return "F-cup";
			else if (breastRows[rowNum].breastRating < 13)
				return "big F-cup";
			else if (breastRows[rowNum].breastRating < 14)
				return "FF-cup";
			else if (breastRows[rowNum].breastRating < 15)
				return "big FF-cup";
			else if (breastRows[rowNum].breastRating < 16)
				return "G-cup";
			else if (breastRows[rowNum].breastRating < 17)
				return "big G-cup";
			else if (breastRows[rowNum].breastRating < 18)
				return "GG-cup";
			else if (breastRows[rowNum].breastRating < 19)
				return "big GG-cup";
			else if (breastRows[rowNum].breastRating < 20)
				return "H-cup";
			else if (breastRows[rowNum].breastRating < 21)
				return "big H-cup";
			else if (breastRows[rowNum].breastRating < 22)
				return "HH-cup";
			else if (breastRows[rowNum].breastRating < 23)
				return "big HH-cup";
			else if (breastRows[rowNum].breastRating < 24)
				return "HHH-cup";
			else if (breastRows[rowNum].breastRating < 25)
				return "I-cup";
			else if (breastRows[rowNum].breastRating < 26)
				return "big I-cup";
			else if (breastRows[rowNum].breastRating < 27)
				return "II-cup";
			else if (breastRows[rowNum].breastRating < 28)
				return "big II-cup";
			else if (breastRows[rowNum].breastRating < 29)
				return "J-cup";
			else if (breastRows[rowNum].breastRating < 30)
				return "big J-cup";
			else if (breastRows[rowNum].breastRating < 31)
				return "JJ-cup";
			else if (breastRows[rowNum].breastRating < 32)
				return "big JJ-cup";
			else if (breastRows[rowNum].breastRating < 33)
				return "K-cup";
			else if (breastRows[rowNum].breastRating < 34)
				return "big K-cup";
			else if (breastRows[rowNum].breastRating < 35)
				return "KK-cup";
			else if (breastRows[rowNum].breastRating < 36)
				return "big KK-cup";
			else if (breastRows[rowNum].breastRating < 37)
				return "L-cup";
			else if (breastRows[rowNum].breastRating < 38)
				return "big L-cup";
			else if (breastRows[rowNum].breastRating < 39)
				return "LL-cup";
			else if (breastRows[rowNum].breastRating < 40)
				return "big LL-cup";
			else if (breastRows[rowNum].breastRating < 41)
				return "M-cup";
			else if (breastRows[rowNum].breastRating < 42)
				return "big M-cup";
			else if (breastRows[rowNum].breastRating < 43)
				return "MM-cup";
			else if (breastRows[rowNum].breastRating < 44)
				return "big MM-cup";
			else if (breastRows[rowNum].breastRating < 45)
				return "MMM-cup";
			else if (breastRows[rowNum].breastRating < 46)
				return "large MMM-cup";
			else if (breastRows[rowNum].breastRating < 47)
				return "N-cup";
			else if (breastRows[rowNum].breastRating < 48)
				return "large N-cup";
			else if (breastRows[rowNum].breastRating < 49)
				return "NN-cup";
			else if (breastRows[rowNum].breastRating < 50)
				return "large NN-cup";
			else if (breastRows[rowNum].breastRating < 51)
				return "O-cup";
			else if (breastRows[rowNum].breastRating < 52)
				return "large O-cup";
			else if (breastRows[rowNum].breastRating < 53)
				return "OO-cup";
			else if (breastRows[rowNum].breastRating < 54)
				return "large OO-cup";
			else if (breastRows[rowNum].breastRating < 55)
				return "P-cup";
			else if (breastRows[rowNum].breastRating < 56)
				return "large P-cup";
			else if (breastRows[rowNum].breastRating < 57)
				return "PP-cup";
			else if (breastRows[rowNum].breastRating < 58)
				return "large PP-cup";
			else if (breastRows[rowNum].breastRating < 59)
				return "Q-cup";
			else if (breastRows[rowNum].breastRating < 60)
				return "large Q-cup";
			else if (breastRows[rowNum].breastRating < 61)
				return "QQ-cup";
			else if (breastRows[rowNum].breastRating < 62)
				return "large QQ-cup";
			else if (breastRows[rowNum].breastRating < 63)
				return "R-cup";
			else if (breastRows[rowNum].breastRating < 64)
				return "large R-cup";
			else if (breastRows[rowNum].breastRating < 65)
				return "RR-cup";
			else if (breastRows[rowNum].breastRating < 66)
				return "large RR-cup";
			else if (breastRows[rowNum].breastRating < 67)
				return "S-cup";
			else if (breastRows[rowNum].breastRating < 68)
				return "large S-cup";
			else if (breastRows[rowNum].breastRating < 69)
				return "SS-cup";
			else if (breastRows[rowNum].breastRating < 70)
				return "large SS-cup";
			else if (breastRows[rowNum].breastRating < 71)
				return "T-cup";
			else if (breastRows[rowNum].breastRating < 72)
				return "large T-cup";
			else if (breastRows[rowNum].breastRating < 73)
				return "TT-cup";
			else if (breastRows[rowNum].breastRating < 74)
				return "large TT-cup";
			else if (breastRows[rowNum].breastRating < 75)
				return "U-cup";
			else if (breastRows[rowNum].breastRating < 76)
				return "large U-cup";
			else if (breastRows[rowNum].breastRating < 77)
				return "UU-cup";
			else if (breastRows[rowNum].breastRating < 78)
				return "large UU-cup";
			else if (breastRows[rowNum].breastRating < 79)
				return "V-cup";
			else if (breastRows[rowNum].breastRating < 80)
				return "large V-cup";
			else if (breastRows[rowNum].breastRating < 81)
				return "VV-cup";
			else if (breastRows[rowNum].breastRating < 82)
				return "large VV-cup";
			else if (breastRows[rowNum].breastRating < 83)
				return "W-cup";
			else if (breastRows[rowNum].breastRating < 84)
				return "large W-cup";
			else if (breastRows[rowNum].breastRating < 85)
				return "WW-cup";
			else if (breastRows[rowNum].breastRating < 86)
				return "large WW-cup";
			else if (breastRows[rowNum].breastRating < 87)
				return "X-cup";
			else if (breastRows[rowNum].breastRating < 88)
				return "large X-cup";
			else if (breastRows[rowNum].breastRating < 89)
				return "XX-cup";
			else if (breastRows[rowNum].breastRating < 90)
				return "large XX-cup";
			else if (breastRows[rowNum].breastRating < 91)
				return "Y-cup";
			else if (breastRows[rowNum].breastRating < 92)
				return "large Y-cup";
			else if (breastRows[rowNum].breastRating < 93)
				return "YY-cup";
			else if (breastRows[rowNum].breastRating < 94)
				return "large YY-cup";
			else if (breastRows[rowNum].breastRating < 95)
				return "Z-cup";
			else if (breastRows[rowNum].breastRating < 96)
				return "large Z-cup";
			else if (breastRows[rowNum].breastRating < 97)
				return "ZZ-cup";
			else if (breastRows[rowNum].breastRating < 98)
				return "large ZZ-cup";
			else if (breastRows[rowNum].breastRating < 99)
				return "ZZZ-cup";
			else if (breastRows[rowNum].breastRating < 100)
				return "large ZZZ-cup";
			// else if(breastRows[rowNum].breastRating < 20) return "watermelon-sized cup";
			// else if(breastRows[rowNum].breastRating < 35) return "tent-sized cup";
			// else if(breastRows[rowNum].breastRating < 60) return "truck-sized cup";
			// else if(breastRows[rowNum].breastRating < 100) return "parachute-sized cup";
			else
				return "game-breaking cup";
			return "Error-Cup (breastSize Error Number: " + breastRows[rowNum].breastRating;
			//watermelon-sized
			//tent sized
			//truck sized
			//parachute sized
			//pool-sized
			//hanger-sized
			//town-sized
			//city-sized
			//state-sized
			//continent-sized
			//planet-sized
			//WTFISTHISWHYISNTITGAMEOVER?
			*/
		}

		public function bRows():Number
		{
			return breastRows.length;
		}

		public function totalBreasts():Number
		{
			var counter:Number = breastRows.length;
			var total:Number = 0;
			while (counter > 0) {
				counter--;
				total += breastRows[counter].breasts;
			}
			return total;
		}

		public function totalNipples():Number
		{
			var counter:Number = breastRows.length;
			var total:Number = 0;
			while (counter > 0) {
				counter--;
				total += breastRows[counter].nipplesPerBreast * breastRows[counter].breasts;
			}
			return total;
		}

		public function smallestTitSize():Number
		{
			if (breastRows.length == 0)
				return -1;
			var counter:Number = breastRows.length;
			var index:Number = 0;
			while (counter > 0) {
				counter--;
				if (breastRows[index].breastRating > breastRows[counter].breastRating)
					index = counter;
			}
			return breastRows[index].breastRating;
		}

		public function smallestTitRow():Number
		{
			if (breastRows.length == 0)
				return -1;
			var counter:Number = breastRows.length;
			var index:Number = 0;
			while (counter > 0) {
				counter--;
				if (breastRows[index].breastRating > breastRows[counter].breastRating)
					index = counter;
			}
			return index;
		}

		public function biggestTitRow():Number
		{
			var counter:Number = breastRows.length;
			var index:Number = 0;
			while (counter > 0) {
				counter--;
				if (breastRows[index].breastRating < breastRows[counter].breastRating)
					index = counter;
			}
			return index;
		}

		public function averageBreastSize():Number
		{
			var counter:Number = breastRows.length;
			var average:Number = 0;
			while (counter > 0) {
				counter--;
				average += breastRows[counter].breastRating;
			}
			if (breastRows.length == 0)
				return 0;
			return (average / breastRows.length);
		}

		public function averageCockThickness():Number
		{
			var counter:Number = cocks.length;
			var average:Number = 0;
			while (counter > 0) {
				counter--;
				average += cocks[counter].cockThickness;
			}
			if (cocks.length == 0)
				return 0;
			return (average / cocks.length);
		}

		public function averageNippleLength():Number
		{
			var counter:Number = breastRows.length;
			var average:Number = 0;
			while (counter > 0) {
				counter--;
				average += (breastRows[counter].breastRating / 10 + .2);
			}
			return (average / breastRows.length);
		}

		public function averageVaginalLooseness():Number
		{
			var counter:Number = vaginas.length;
			var average:Number = 0;
			//If the player has no vaginas
			if (vaginas.length == 0)
				return 2;
			while (counter > 0) {
				counter--;
				average += vaginas[counter].vaginalLooseness;
			}
			return (average / vaginas.length);
		}

		public function averageVaginalWetness():Number
		{
			//If the player has no vaginas
			if (vaginas.length == 0)
				return 2;
			var counter:Number = vaginas.length;
			var average:Number = 0;
			while (counter > 0) {
				counter--;
				average += vaginas[counter].vaginalWetness;
			}
			return (average / vaginas.length);
		}

		public function averageCockLength():Number
		{
			var counter:Number = cocks.length;
			var average:Number = 0;
			while (counter > 0) {
				counter--;
				average += cocks[counter].cockLength;
			}
			if (cocks.length == 0)
				return 0;
			return (average / cocks.length);
		}

		public function canTitFuck():Boolean
		{
			if (breastRows.length == 0) return false;
			
			var counter:Number = breastRows.length;
			var index:Number = 0;
			while (counter > 0) {
				counter--;
				if (breastRows[index].breasts < breastRows[counter].breasts && breastRows[counter].breastRating > 3)
					index = counter;
			}
			if (breastRows[index].breasts >= 2 && breastRows[index].breastRating > 3)
				return true;
			return false;
		}

		public function mostBreastsPerRow():Number
		{
			if (breastRows.length == 0) return 2;
			
			var counter:Number = breastRows.length;
			var index:Number = 0;
			while (counter > 0) {
				counter--;
				if (breastRows[index].breasts < breastRows[counter].breasts)
					index = counter;
			}
			return breastRows[index].breasts;
		}

		public function averageNipplesPerBreast():Number
		{
			var counter:Number = breastRows.length;
			var breasts:Number = 0;
			var nipples:Number = 0;
			while (counter > 0) {
				counter--;
				breasts += breastRows[counter].breasts;
				nipples += breastRows[counter].nipplesPerBreast * breastRows[counter].breasts;
			}
			if (breasts == 0)
				return 0;
			return Math.floor(nipples / breasts);
		}

		public function allBreastsDescript():String
		{
			return Appearance.allBreastsDescript(this);
		}

		//Simplified these cock descriptors and brought them into the creature class
		public function sMultiCockDesc():String {
			return (cocks.length > 1 ? "one of your " : "your ") + cockMultiLDescriptionShort();
		}
		
		public function SMultiCockDesc():String {
			return (cocks.length > 1 ? "One of your " : "Your ") + cockMultiLDescriptionShort();
		}
		
		public function oMultiCockDesc():String {
			return (cocks.length > 1 ? "each of your " : "your ") + cockMultiLDescriptionShort();
		}
		
		public function OMultiCockDesc():String {
			return (cocks.length > 1 ? "Each of your " : "Your ") + cockMultiLDescriptionShort();
		}
		
		private function cockMultiLDescriptionShort():String {
			if (cocks.length < 1) {
				CoC_Settings.error("<b>ERROR: NO WANGS DETECTED for cockMultiLightDesc()</b>");
				return "<b>ERROR: NO WANGS DETECTED for cockMultiLightDesc()</b>";
			}
			if (cocks.length == 1) { //For a songle cock return the default description
				return Appearance.cockDescript(this, 0);
			}
			switch (cocks[0].cockType) { //With multiple cocks only use the descriptions for specific cock types if all cocks are of a single type
				case CockTypesEnum.ANEMONE:
				case CockTypesEnum.CAT:
				case CockTypesEnum.DEMON:
				case CockTypesEnum.DISPLACER:
				case CockTypesEnum.DRAGON:
				case CockTypesEnum.HORSE:
				case CockTypesEnum.KANGAROO:
				case CockTypesEnum.LIZARD:
				case CockTypesEnum.PIG:
				case CockTypesEnum.TENTACLE:
					if (countCocksOfType(cocks[0].cockType) == cocks.length) return Appearance.cockNoun(cocks[0].cockType) + "s";
					break;
				case CockTypesEnum.DOG:
				case CockTypesEnum.FOX:
					if (dogCocks() == cocks.length) return Appearance.cockNoun(CockTypesEnum.DOG) + "s";
				default:
			}
			return Appearance.cockNoun(CockTypesEnum.HUMAN) + "s";
		}
		
		public function hasSheath():Boolean {
			if (cocks.length == 0) return false;
			for (var x:int = 0; x < cocks.length; x++) {
				switch (cocks[x].cockType) {
					case CockTypesEnum.CAT:
					case CockTypesEnum.DISPLACER:
					case CockTypesEnum.DOG:
					case CockTypesEnum.FOX:
					case CockTypesEnum.HORSE:
					case CockTypesEnum.KANGAROO:
					case CockTypesEnum.AVIAN:
						return true; //If there's even one cock of any of these types then return true
					default:
				}
			}
			return false;
		}
		
		public function sheathDescription():String {
			if (hasSheath()) return "sheath";
			return "base";
		}
		
		public function vaginaDescript(idx:int = 0):String
		{
			return Appearance.vaginaDescript(this, 0);
		}

		public function nippleDescript(rowIdx:int):String
		{
			return Appearance.nippleDescription(this, rowIdx);
		}

		public function chestDesc():String
		{
			if (biggestTitSize() < 1) return "chest";
			return Appearance.biggestBreastSizeDescript(this);
//			return Appearance.chestDesc(this);
		}

		public function allChestDesc():String {
			if (biggestTitSize() < 1) return "chest";
			return allBreastsDescript();
		}

		public function clitDescript():String {
			return Appearance.clitDescription(this);
		}

		public function cockHead(cockNum:int = 0):String {
			if (cockNum < 0 || cockNum > cocks.length - 1) {
				CoC_Settings.error("");
				return "ERROR";
			}
			switch (cocks[cockNum].cockType) {
				case CockTypesEnum.CAT:
					if (rand(2) == 0) return "point";
					return "narrow tip";
				case CockTypesEnum.DEMON:
					if (rand(2) == 0) return "tainted crown";
					return "nub-ringed tip";
				case CockTypesEnum.DISPLACER:
					switch (rand(5)) {
						case  0: return "star tip";
						case  1: return "blooming cock-head";
						case  2: return "open crown";
						case  3: return "alien tip";
						default: return "bizarre head";
					}
				case CockTypesEnum.DOG:
				case CockTypesEnum.FOX:
					if (rand(2) == 0) return "pointed tip";
					return "narrow tip";
				case CockTypesEnum.HORSE:
					if (rand(2) == 0) return "flare";
					return "flat tip";
				case CockTypesEnum.KANGAROO:
					if (rand(2) == 0) return "tip";
					return "point";
				case CockTypesEnum.LIZARD:
					if (rand(2) == 0) return "crown";
					return "head";
				case CockTypesEnum.TENTACLE:
					if (rand(2) == 0) return "mushroom-like tip";
					return "wide plant-like crown";
				default:
			}
			if (rand(2) == 0) return "crown";
			if (rand(2) == 0) return "head";
			return "cock-head";
		}

		//Short cock description. Describes length or girth. Supports multiple cocks.
		public function cockDescriptShort(i_cockIndex:int = 0):String
		{
			// catch calls where we're outside of combat, and eCockDescript could be called.
			if (cocks.length == 0)
				return "<B>ERROR. INVALID CREATURE SPECIFIED to cockDescriptShort</B>";

			var description:String = "";
			var descripted:Boolean = false;
			//Discuss length one in 3 times
			if (rand(3) == 0) {
				if (cocks[i_cockIndex].cockLength >= 30)
					description = "towering ";
				else if (cocks[i_cockIndex].cockLength >= 18)
					description = "enormous ";
				else if (cocks[i_cockIndex].cockLength >= 13)
					description = "massive ";
				else if (cocks[i_cockIndex].cockLength >= 10)
					description = "huge ";
				else if (cocks[i_cockIndex].cockLength >= 7)
					description = "long ";
				else if (cocks[i_cockIndex].cockLength >= 5)
					description = "average ";
				else
					description = "short ";
				descripted = true;
			}
			else if (rand(2) == 0) { //Discuss girth one in 2 times if not already talked about length.
				//narrow, thin, ample, broad, distended, voluminous
				if (cocks[i_cockIndex].cockThickness <= .75) description = "narrow ";
				if (cocks[i_cockIndex].cockThickness > 1 && cocks[i_cockIndex].cockThickness <= 1.4) description = "ample ";
				if (cocks[i_cockIndex].cockThickness > 1.4 && cocks[i_cockIndex].cockThickness <= 2) description = "broad ";
				if (cocks[i_cockIndex].cockThickness > 2 && cocks[i_cockIndex].cockThickness <= 3.5) description = "fat ";
				if (cocks[i_cockIndex].cockThickness > 3.5) description = "distended ";
				descripted = true;
			}
//Seems to work better without this comma:			if (descripted && cocks[i_cockIndex].cockType != CockTypesEnum.HUMAN) description += ", ";
			description += Appearance.cockNoun(cocks[i_cockIndex].cockType);

			return description;
		}

		public function assholeOrPussy():String
		{
			return Appearance.assholeOrPussy(this);
		}

		public function multiCockDescriptLight():String
		{
			return Appearance.multiCockDescriptLight(this);
		}

		public function multiCockDescript():String
		{
			return Appearance.multiCockDescript(this);
		}

		public function ballsDescriptLight(forcedSize:Boolean = true):String
		{
			return Appearance.ballsDescription(forcedSize, true, this);
		}

		public function sackDescript():String
		{
			return Appearance.sackDescript(this);
		}

		public function breastDescript(rowNum:int):String {
			//ERROR PREVENTION
			if (breastRows.length - 1 < rowNum) {
				CoC_Settings.error("");
				return "<b>ERROR, breastDescript() working with invalid breastRow</b>";
			}
			if (breastRows.length == 0) {
				CoC_Settings.error("");
				return "<b>ERROR, breastDescript() called when no breasts are present.</b>";
			}
			return BreastStore.breastDescript(breastRows[rowNum].breastRating, breastRows[rowNum].lactationMultiplier);
		}

		private function breastSize(val:Number):String
		{
			return Appearance.breastSize(val);
		}
		
		public function damagePercent(display:Boolean = false, applyModifiers:Boolean = false):Number {
			var mult:Number = 100;
			var armorMod:Number = armorDef;
			//--BASE--
			//Toughness modifier.
			if (!display) {
				mult -= rand(tou) * 0.2;
				if (mult < 80) mult = 80;
			}
			//Modify armor rating based on weapons.
			if (applyModifiers) {
				if (game.player.weapon == game.weapons.JRAPIER || game.player.weapon == game.weapons.SPEAR) armorMod = 0;
				if (game.player.weapon == game.weapons.KATANA) armorMod -= 5;
				if (game.player.findPerk(PerkLib.LungingAttacks) >= 0) armorMod /= 2;
				if (armorMod < 0) armorMod = 0;
			}
			mult -= armorMod;
			
			//--PERKS--
			//Take damage you masochist!
			if (findPerk(PerkLib.Masochist) >= 0 && lib >= 60) {
				mult *= 0.8;
				if (short == game.player.short) game.dynStats("lus", 2);
			}
			if (findPerk(PerkLib.ImmovableObject) >= 0 && tou >= 75) {
				mult *= 0.9;
			}
			
			//--STATUS AFFECTS--
			//Black cat beer = 25% reduction!
			if (statusAffectv1(StatusAffects.BlackCatBeer) > 0)
				mult *= 0.75;
			// Uma's Massage bonuses
			var statIndex:int = findStatusAffect(StatusAffects.UmasMassage);
			if (statIndex >= 0) {
				if (statusAffect(statIndex).value1 == UmasShop.MASSAGE_RELAXATION) {
					mult *= statusAffect(statIndex).value2;
				}
			}
			//Round things off.
			mult = Math.round(mult);
			//Caps damage reduction at 80%.
			if (mult < 20) mult = 20;
			return mult;
		}
	}
}


