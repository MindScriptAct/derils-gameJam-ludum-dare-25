package com.mindscriptact.starlingtest.view.main.screens {
import com.bit101.components.PushButton;
import com.mindscriptact.starlingtest.messages.Message;
import com.mindscriptact.starlingtest.model.gui.GuiProxy;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.text.TextFormat;
import flash.text.TextFormatAlign;
import org.mvcexpress.mvc.Mediator;

/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class GameOverScreenMediator extends Mediator {
	
	[Inject]
	public var view:GameOverScreenSPR;
	
	[Inject]
	public var guiProxy:GuiProxy;
	
	override public function onRegister():void {
		//var startButton:PushButton = new PushButton(view, 100, 100, "BAIL OUT!", handleStartGame);
		
		addListener(view.bailOut, MouseEvent.CLICK, handleGomeOver);
		
		view.scoredMoney.text = "" + guiProxy.getTotalScore() + " $";
				
		(view.scoredMoney as TextField).setTextFormat(new TextFormat('myBoldVerdana', 49, 0xFFFFFF, true, null, null, null, null, TextFormatAlign.LEFT));
	}
	
	private function handleGomeOver(event:MouseEvent):void {
		sendMessage(Message.RESET_GAME);
	
	}
	
	override public function onRemove():void {
	}

}
}