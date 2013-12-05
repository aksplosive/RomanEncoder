package com.romanencoder.view.components
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.TextEvent;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	public class EncoderView extends Sprite
	{
		//text field to enter input
		private var m_fromTextField:TextField;
		
		//text field that acts as a button
		private var m_doTextField:TextField;
		
		//text field to show output
		private var m_toTextField:TextField;
		
		//text field to display information
		private var m_infoTextField:TextField;
		
		/**
		 * Constructor
		 */ 
		public function EncoderView()
		{
			var txtFormat:TextFormat = new TextFormat();
			txtFormat.size = 18;
			txtFormat.align = TextFormatAlign.CENTER;
			
			m_fromTextField = new TextField();
			m_fromTextField.type = TextFieldType.INPUT;
			m_fromTextField.border = true;
			m_fromTextField.width = 150;
			m_fromTextField.height = 30;
			m_fromTextField.text = "Enter value here...";
			m_fromTextField.setTextFormat(txtFormat);
			addChild(m_fromTextField);
			
			m_doTextField = new TextField();
			m_doTextField.text = "=>";
			m_doTextField.setTextFormat(txtFormat);
			m_doTextField.border = true;
			m_doTextField.width = 30;
			m_doTextField.height = 30;
			m_doTextField.x = 160;
			addChild(m_doTextField);
			
			m_toTextField = new TextField();
			m_toTextField.border = true;
			m_toTextField.width = 150;
			m_toTextField.height = 30;
			m_toTextField.text = "";
			m_toTextField.defaultTextFormat = txtFormat;
			m_toTextField.setTextFormat(txtFormat);
			m_toTextField.x = 200;
			addChild(m_toTextField);
			
			m_infoTextField = new TextField();
			m_infoTextField.type = TextFieldType.INPUT;
			m_infoTextField.width = 400;
			m_infoTextField.height = 30;
			m_infoTextField.text = "*Enter a Number(1-3999) /OR/ Enter a Roman numeral AND Press =>";
			m_infoTextField.y = 40;
			addChild(m_infoTextField);
		}
		
		public function get fromTextField():TextField
		{
			return m_fromTextField;
		}
		
		public function get doTextField():TextField
		{
			return m_doTextField;
		}
		
		public function get toTextField():TextField
		{
			return m_toTextField;
		}
	}
}