package com.romanencoder.view
{
	import com.romanencoder.ApplicationFacade;
	import com.romanencoder.view.components.EncoderView;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class ApplicationMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "ApplicationMediator";
		
		//encoder view which contains view components of roman to arabic converter
		private var m_encoderView:EncoderView;
		
		/**
		 * Constructor
		 */ 
		public function ApplicationMediator( viewComponent:Object ) 
		{
			super( NAME, viewComponent );
		}
		
		/**
		 * List all notifications this Mediator is interested in.
		 */
		override public function listNotificationInterests():Array 
		{
			return [ ApplicationFacade.ADD_VIEW];
		}
		
		/**
		 * Handle all notifications this Mediator is interested in.
		 */
		override public function handleNotification( note:INotification ):void 
		{
			switch ( note.getName() ) 
			{
				case ApplicationFacade.ADD_VIEW:
					m_encoderView = new EncoderView();
					m_encoderView.x = 150;
					m_encoderView.y = 200;
					facade.registerMediator(new EncoderMediator(m_encoderView));
					stage.addChild(m_encoderView);
					break;
			}
		}
		
		/**
		 * Cast the viewComponent to its actual type.
		 */
		protected function get stage():RomanEncoder
		{
			return viewComponent as RomanEncoder;
		}
		
	}
}