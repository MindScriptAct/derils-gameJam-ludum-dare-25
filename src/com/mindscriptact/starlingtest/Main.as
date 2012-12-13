package com.mindscriptact.starlingtest {
import com.mindscriptact.mvcExpressLogger.MvcExpressLogger;
import flash.display.LineScaleMode;
import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;

/**
 * ...
 * @author rBanevicius
 */
public class Main extends Sprite {
	
	public function Main():void {
		if (stage)
			init();
		else
			addEventListener(Event.ADDED_TO_STAGE, init);
	}
	
	private function init(e:Event = null):void {
		removeEventListener(Event.ADDED_TO_STAGE, init);
		// entry point
		
		this.stage.scaleMode = StageScaleMode.NO_SCALE;
		this.stage.align = StageAlign.TOP_LEFT;
		
		MvcExpressLogger.init(this.stage, 500, 0, 700, 400, 1, true);
		
		//
		var starlingTestModule:StarlingTestModule = new StarlingTestModule();
		starlingTestModule.start(this);
	}

}

}