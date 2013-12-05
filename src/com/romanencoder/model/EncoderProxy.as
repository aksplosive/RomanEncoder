package com.romanencoder.model
{
	import flash.utils.Dictionary;
	
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	public class EncoderProxy extends Proxy implements IProxy
	{
		public static const NAME:String = 'EncoderProxy';
		
		/**
		 * Constructor
		 */ 
		public function EncoderProxy()
		{
			super(NAME, Number(0));
		}
		
		/**
		 * Get roman string from arabic 
		 */ 
		public function arabicToRoman(num:int):String
		{
			var roman:String = "";
			var romanLetters:Vector.<String> = new <String>[ 'M', 'CM', 'D', 'CD', 'C', 'XC', 'L', 'XL', 'X', 'IX', 'V', 'IV', 'I' ];
			var romanNumbers:Vector.<int> = new <int>[ 1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1 ];
			var len:int = romanLetters.length;
			for (var i:int = 0; i < len; i++) 
			{
				while (num >= romanNumbers[i]) 
				{
					roman += romanLetters[i];
					num -= romanNumbers[i];
				}
			}
			return roman;	
		}
		
		/**
		 * get arabic from roman string
		 */ 
		public function romanToArabic(roman:String):int
		{
			var romanArr:Array = roman.toUpperCase().split('');
			var romanLetters:Vector.<String> = new <String>[ 'I', 'V', 'X', 'L', 'C', 'D', 'M' ];
			var romanNumbers:Vector.<int> = new <int>[ 1, 5, 10, 50, 100, 500, 1000 ];
			var num:Number = 0, val:Number = 0;
			while (romanArr.length) {
				val = romanNumbers[romanLetters.indexOf(romanArr.shift())];
				num += val * ((romanArr.length!=0 && val < romanNumbers[romanLetters.indexOf(romanArr[0])]) ? -1 : 1);
			}
			return num;
		}
	}
}