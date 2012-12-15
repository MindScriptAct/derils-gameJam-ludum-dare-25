package com.mindscriptact.starlingtest.view.main {
import com.bit101.components.HUISlider;
import com.bit101.components.PushButton;
import com.mindscriptact.starlingtest.Main;
import com.mindscriptact.starlingtest.messages.Message;
import com.mindscriptact.starlingtest.view.gui.GuiHolder;
import flash.events.Event;
import org.mvcexpress.mvc.Mediator;

/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class MainMediator extends Mediator {
	private var antialiasing:HUISlider;
	
	[Inject]
	public var view:Main;
	
	//[Inject]
	//public var myProxy:MyProxy;
	
	override public function onRegister():void {
		
		var guiHolder:GuiHolder = new GuiHolder();
		view.addChild(guiHolder);
		
		mediatorMap.mediate(guiHolder);
		
		
		
		
		antialiasing = new HUISlider(view, 1300, 550, "Antialiasing", handleValueChange);
		antialiasing.value = 1;
		antialiasing.minimum = 0;
		antialiasing.maximum = 16;
		antialiasing.labelPrecision = 0;
		
		var startButton:PushButton = new PushButton(view, 1300, 580, "START", handleStartGame);
		
		var addCommanButton:PushButton = new PushButton(view, 1400, 580, "ADD COMMONER", handleAddCommoner);
	}
	
	public function handleAddCommoner(event:Event):void {
		sendMessage(Message.ADD_COMMONER, 1);
	}
	
	private function handleStartGame(event:Event):void {
		sendMessage(Message.START_GAME, 0);
	}
	
	private function handleValueChange(event:Event):void {
		//trace("StarlingTestModule.handleValueChange > event : " + event, antialiasing.value);
		sendMessage(Message.STARLING_ANTIALIASING_CHANGE, Math.floor(antialiasing.value));
	
	}
	
	override public function onRemove():void {
	
	}

}
}