package com.mindscriptact.starlingtest.view.main.screens {
import com.bit101.components.PushButton;
import com.mindscriptact.starlingtest.messages.Message;
import flash.events.Event;
import org.mvcexpress.mvc.Mediator;

/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class StartScreenMediator extends Mediator {
	
	[Inject]
	public var view:StartScreen;
	
	//[Inject]
	//public var myProxy:MyProxy;
	
	override public function onRegister():void {
		var startButton:PushButton = new PushButton(view, 100, 100, "START", handleStartGame);
	}
	
	private function handleStartGame(event:Event):void {
		sendMessage(Message.START_GAME);
	}
	
	override public function onRemove():void {
	
	}

}
}