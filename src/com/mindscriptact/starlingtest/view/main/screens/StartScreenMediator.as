package com.mindscriptact.starlingtest.view.main.screens {
import com.mindscriptact.starlingtest.messages.Message;
import flash.events.Event;
import flash.events.MouseEvent;
import org.mvcexpress.mvc.Mediator;

/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class StartScreenMediator extends Mediator {
	
	[Inject]
	public var view:StartScreenSPR;
	
	//[Inject]
	//public var myProxy:MyProxy;
	
	override public function onRegister():void {
		//var startButton:PushButton = new PushButton(, 1100, 700, "START GAME!", handleStartGame);
		
		addListener(view.startGameButton, MouseEvent.CLICK, handleStartGame);
	}
	
	private function handleStartGame(event:Event):void {
		sendMessage(Message.START_GAME);
	}
	
	override public function onRemove():void {
	
	}

}
}