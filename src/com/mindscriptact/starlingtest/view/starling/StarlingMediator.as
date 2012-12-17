package com.mindscriptact.starlingtest.view.starling {
import com.mindscriptact.starlingtest.messages.Message;
import org.mvcexpress.mvc.Mediator;
import starling.core.Starling;
import starling.events.Event;

/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class StarlingMediator extends Mediator {
	
	[Inject]
	public var view:Starling;
	
	//[Inject]
	//public var myProxy:MyProxy;
	
	override public function onRegister():void {
		view.antiAliasing = 0;
		view.start();
		CONFIG::debug {
			view.showStats = true;
		}
		
		view.addEventListener(Event.ROOT_CREATED, handleRootCreated);
		
		addHandler(Message.STARLING_ANTIALIASING_CHANGE, handleAntialiasingChange);
		
	}
	
	private function handleAntialiasingChange(antialiasing:int):void {
		view.antiAliasing = antialiasing;
	}
	
	private function handleRootCreated(event:Event):void {
		view.removeEventListener(Event.ROOT_CREATED, handleRootCreated);
		mediatorMap.mediate(view.root);
	}
	
	override public function onRemove():void {
	
	}

}
}