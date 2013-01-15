package com.mindscriptact.ludumDare25.view.main.screens {
import com.greensock.TweenMax;
import com.mindscriptact.ludumDare25.messages.Message;
import com.mindscriptact.ludumDare25.model.gui.GuiProxy;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.text.TextFormat;
import flash.text.TextFormatAlign;
import flash.utils.setTimeout;
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
		view.bailOut.visible = false;
		
		view.scoredMoney.text = "" + guiProxy.getTotalScore() + " $";
		
		(view.scoredMoney as TextField).setTextFormat(new TextFormat('myBoldVerdana', 49, 0xFFFFFF, true, null, null, null, null, TextFormatAlign.LEFT));
		
		setTimeout(showBailoutButton, 1000);
	}
	
	private function showBailoutButton():void {
		view.bailOut.visible = true;
		view.bailOut.alpha = 0;
		TweenMax.to(view.bailOut, 1, {alpha: 1});
	}
	
	private function handleGomeOver(event:MouseEvent):void {
		sendMessage(Message.RESET_GAME);
	
	}
	
	override public function onRemove():void {
	}

}
}