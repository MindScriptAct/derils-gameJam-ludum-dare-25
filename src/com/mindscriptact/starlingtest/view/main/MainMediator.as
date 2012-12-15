package com.mindscriptact.starlingtest.view.main {
import com.bit101.components.HUISlider;
import com.mindscriptact.starlingtest.Main;
import com.mindscriptact.starlingtest.messages.Message;
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
		antialiasing = new HUISlider(view, 1300, 550, "Antialiasing", handleValueChange);
		antialiasing.value = 1;
		antialiasing.minimum = 0;
		antialiasing.maximum = 16;
		antialiasing.labelPrecision = 0;
	}
	
	private function handleValueChange(event:Event):void {
		//trace("StarlingTestModule.handleValueChange > event : " + event, antialiasing.value);
		sendMessage(Message.STARLING_ANTIALIASING_CHANGE, Math.floor(antialiasing.value));
	
	}
	
	override public function onRemove():void {
	
	}

}
}