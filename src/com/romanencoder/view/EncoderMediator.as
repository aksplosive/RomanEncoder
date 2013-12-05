package com.romanencoder.view
{
	import com.romanencoder.model.EncoderProxy;
	import com.romanencoder.view.components.EncoderView;
	
	import flash.events.MouseEvent;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class EncoderMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "EncoderMediator";
		
		private var m_encoderProxy:EncoderProxy;
		
		/**
		 * Constructor
		 */ 
		public function EncoderMediator(viewComponent:Object=null)
		{
			super(NAME, viewComponent);
			m_encoderProxy = facade.retrieveProxy(EncoderProxy.NAME) as EncoderProxy;
			view.doTextField.addEventListener(MouseEvent.MOUSE_DOWN, convert);
		}
		
		/**
		 * convert roman to arabic and vice versa
		 */ 
		public function convert(event:MouseEvent):void
		{
			var num:Number = Number(view.fromTextField.text);
			if(isNaN(num)) 
			{
				view.toTextField.text = m_encoderProxy.romanToArabic(view.fromTextField.text).toString();
			}
			else if(num <= 3999)
			{
		 		view.toTextField.text = m_encoderProxy.arabicToRoman(num);
			}
		}
		
		/**
		 * Cast the viewComponent to its actual type.
		 */
		protected function get view():EncoderView
		{
			return viewComponent as EncoderView;
		}
	}
}