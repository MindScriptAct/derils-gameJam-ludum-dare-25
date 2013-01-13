package com.mindscriptact.starlingtest {
import com.mindscriptact.mvcExpressLogger.MvcExpressLogger;
import com.mindscriptact.starlingtest.picLib.SoundLib;
import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;
import utils.debug.Stats;

/**
 * ...
 * @author rBanevicius
 */
[Frame(factoryClass="com.mindscriptact.starlingtest.Preloader")]

public class Main extends Sprite {
	
	//[Embed(source="/fonts/capitalist.ttf", //
	//fontName="capitalistFont", //
	//mimeType="application/x-font", //
	//fontWeight="normal", //
	//fontStyle="normal", //
	//advancedAntiAliasing="true", //
	//embedAsCFF="false")] //
	//private var myEmbeddedFont:Class;
	
	//[Embed(systemFont="Verdana", //
	//fontName="myVerdana", //
	//mimeType="application/x-font", //
	//fontWeight="normal", //
	//fontStyle="normal", //
	//advancedAntiAliasing="true", //
	//embedAsCFF="false")] //
	//private var myVerdana:Class;
	
	[Embed(systemFont="Verdana", //
		fontName="myBoldVerdana", //
		mimeType="application/x-font", //
		fontWeight="heavy", //
		fontStyle="normal", //
		advancedAntiAliasing="true", //
		embedAsCFF="false")] //
	private var myBoldVerdana:Class;
	
	private var starlingTestModule:StarlingTestModule;
	
	public function Main():void {
		if (stage)
			init();
		else
			addEventListener(Event.ADDED_TO_STAGE, init);
	}
	
	private function init(e:Event = null):void {
		
		SoundLib.getInstance();
		
		removeEventListener(Event.ADDED_TO_STAGE, init);
		// entry point
		
		this.stage.scaleMode = StageScaleMode.NO_SCALE;
		this.stage.align = StageAlign.TOP_LEFT;
		
		//
		
		CONFIG::debug {
			MvcExpressLogger.init(this.stage, 1280, 0, 700, 400, 1, false);
			this.addChild(new Stats(400, 1290, 420, false, true, true));
			
			starlingTestModule = new StarlingTestModule();
			starlingTestModule.start(this);
			
			return;
		}
		//this.addChild(new Stats(400, 0, 0, true, true, true));
		
		starlingTestModule = new StarlingTestModule();
		starlingTestModule.start(this);
	
	}

}
}