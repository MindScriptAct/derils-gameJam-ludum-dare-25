package com.mindscriptact.starlingtest.model.keyboard {
import flash.display.Stage;
import flash.events.KeyboardEvent;
import flash.utils.Dictionary;
import org.mvcexpress.mvc.Proxy;

/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class KeyboardProxy extends Proxy {
	private var stage:Stage;
	private var keyRegistry:Dictionary = new Dictionary();
	private var messageKeysRegistry:Dictionary = new Dictionary();
	
	public function KeyboardProxy(stage:Stage) {
		this.stage = stage;
	}
	
	override protected function onRegister():void {
		stage.addEventListener(KeyboardEvent.KEY_DOWN, handleKeyPressedDown);
		stage.addEventListener(KeyboardEvent.KEY_UP, handleKeyPressedUp);
	}
	
	override protected function onRemove():void {
		stage.removeEventListener(KeyboardEvent.KEY_DOWN, handleKeyPressedDown);
		stage.removeEventListener(KeyboardEvent.KEY_UP, handleKeyPressedUp);
	}
	
	private function handleKeyPressedUp(event:KeyboardEvent):void {
		keyRegistry[event.keyCode] = false;
		//
		if (messageKeysRegistry[event.keyCode] != null) {
			sendMessage(messageKeysRegistry[event.keyCode]);
		}
	}
	
	private function handleKeyPressedDown(event:KeyboardEvent):void {
		keyRegistry[event.keyCode] = true;
	}
	
	public function isKeyPressed(keyCode:int):Boolean {
		return (keyRegistry[keyCode] == true);
	}
	
	public function registerMessageSendOnPress(keyCode:int, message:String):void {
		messageKeysRegistry[keyCode] = message;
	}
	
	public function removeMessageSendOnPress(keyCode:int):void {
		delete messageKeysRegistry[keyCode];
	}

}
}