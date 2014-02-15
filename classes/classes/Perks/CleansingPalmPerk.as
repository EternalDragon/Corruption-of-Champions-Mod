package classes.Perks
{
	import classes.PerkClass;
	import classes.PerkType;
	import classes.GlobalFlags.kGAMECLASS;

	public class CleansingPalmPerk extends PerkType
	{

		override public function desc(params:PerkClass = null):String
		{
			if (kGAMECLASS.player.cor >= 10) return "<b>DISABLED</b> - Corruption too high!";
			else return super.desc(params);
		}

		public function CleansingPalmPerk()
		{
			super("Controlled Breath", "Controlled Breath", "Jojo’s training allows you to recover more quickly. Increases rate of fatigue regeneration by 10%");
		}
	}
}