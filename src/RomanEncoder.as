package
{
	import com.romanencoder.ApplicationFacade;
	
	import flash.display.Sprite;
	
	[SWF( width='600', height='400', frameRate='30', backgroundColor='#FFFFFF' )]
	public class RomanEncoder extends Sprite
	{
		/**
		 * Constructor
		 */ 
		public function RomanEncoder()
		{
			ApplicationFacade.getInstance().startup(this);
		}
	}
}