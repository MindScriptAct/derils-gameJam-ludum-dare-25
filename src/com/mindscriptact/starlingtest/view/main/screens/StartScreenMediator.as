package com.mindscriptact.starlingtest.view.main.screens {
import com.mindscriptact.starlingtest.messages.Message;
import com.mindscriptact.starlingtest.messages.ViewMessage;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.net.navigateToURL;
import flash.net.URLRequest;
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
		
		addListener(view.startTutorial, MouseEvent.CLICK, handleStartTutorial);
		
		
		
		addListener(view.flashButton, MouseEvent.CLICK, handleFlashLinkButton);
		addListener(view.mvcExpressButton, MouseEvent.CLICK, handleExpressLinkButton);
		addListener(view.starlingButton, MouseEvent.CLICK, handleStarlingLinkButton);
		addListener(view.blogButton, MouseEvent.CLICK, handleBlogLinkButton);
		addListener(view.twitterButton, MouseEvent.CLICK, handleTwitterLinkButton);
	
	}
	
	private function handleStartTutorial(event:MouseEvent):void {
		sendMessage(ViewMessage.START_TUTORIAL);
	}
	
	private function handleFlashLinkButton(event:MouseEvent):void {
		navigateToURL(new URLRequest("http://gaming.adobe.com/getstarted/"), "_blank");
	}
	
	private function handleExpressLinkButton(event:MouseEvent):void {
		navigateToURL(new URLRequest("http://mvcexpress.org/"), "_blank");
	}
	
	private function handleStarlingLinkButton(event:MouseEvent):void {
		navigateToURL(new URLRequest("http://gamua.com/starling/"), "_blank");
	}
	
	private function handleBlogLinkButton(event:MouseEvent):void {
		navigateToURL(new URLRequest("http://www.mindscriptact.com/"), "_blank");
	}
	
	private function handleTwitterLinkButton(event:MouseEvent):void {
		navigateToURL(new URLRequest("https://twitter.com/Deril"), "_blank");
	}
	
	private function handleStartGame(event:Event):void {
		sendMessage(Message.START_GAME);
	}
	
	override public function onRemove():void {
	
	}

}
}