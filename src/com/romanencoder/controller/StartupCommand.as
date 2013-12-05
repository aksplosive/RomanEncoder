package com.romanencoder.controller
{
	import com.romanencoder.ApplicationFacade;
	import com.romanencoder.model.EncoderProxy;
	import com.romanencoder.view.ApplicationMediator;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class StartupCommand extends SimpleCommand implements ICommand
	{
		override public function execute(notification:INotification):void
		{
			//register the proxy
			facade.registerProxy(new EncoderProxy());
			//register application mediator
			facade.registerMediator( new ApplicationMediator( notification.getBody() as RomanEncoder ) );
			//inform application mediator to add view to stage
			sendNotification( ApplicationFacade.ADD_VIEW );
		}
	}
}