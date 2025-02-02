/**
 * Created by aimozg on 10.01.14.
 */
package classes.Items.Weapons
{
	import classes.Items.Weapon;
	import classes.PerkLib;
	import classes.Player;

	public class LethiciteStaff extends Weapon {
		
		public function LethiciteStaff() {
			super("L.Staff", "Lthc. Staff", "lethicite staff", "a lethicite staff", "smack", 14, 1337, "This staff is made of a dark material and seems to tingle to the touch.  The top consists of a glowing lethicite orb.  It once belonged to Lethice who was defeated in your hands. \n\nType: Weapon (Magical) \nAttack: 14 \nBase value: 1337 \nSpecial: Wizard's Focus (+80% spell effect multiplier)", "Wizard's Focus");
		}
		
		override public function playerEquip():Weapon {
			while (game.player.findPerk(PerkLib.WizardsFocus) >= 0) game.player.removePerk(PerkLib.WizardsFocus);
			game.player.createPerk(PerkLib.WizardsFocus, 0.8, 0, 0, 0);
			return super.playerEquip();
		}
		
		override public function playerRemove():Weapon {
			while (game.player.findPerk(PerkLib.WizardsFocus) >= 0) game.player.removePerk(PerkLib.WizardsFocus);
			return super.playerRemove();
		}
		
	}
}
