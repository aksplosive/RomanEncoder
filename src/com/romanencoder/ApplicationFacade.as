package com.romanencoder
{
	import com.romanencoder.controller.StartupCommand;
	
	import org.puremvc.as3.interfaces.IFacade;
	import org.puremvc.as3.patterns.facade.Facade;
	
	public class ApplicationFacade extends Facade implements IFacade
	{
		public static const NAME:String = "ApplicationFacade";
		
		public static const STARTUP:String = "ApplicationFacadeStartUp";
		
		public static const ADD_VIEW:String = "ApplicationFacadeAddView";
		
		public static function getInstance():ApplicationFacade 
		{
			return (instance ? instance : new ApplicationFacade()) as ApplicationFacade;
		}
		
		override protected function initializeController():void
		{
			super.initializeController();
			registerCommand(STARTUP, StartupCommand);
		}
		
		/**
		 * startup
		 */ 
		public function startup(stage:Object):void 
		{
			sendNotification(STARTUP, stage);
		}
	}
}