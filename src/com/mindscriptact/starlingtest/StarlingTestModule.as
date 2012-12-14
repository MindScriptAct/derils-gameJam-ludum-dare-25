package com.mindscriptact.starlingtest {
import com.bit101.components.HUISlider;
import com.mindscriptact.starlingtest.controller.setup.SetUpViewCommand;
import com.mindscriptact.starlingtest.view.game.Game;
import com.mindscriptact.starlingtest.view.starling.StarlingMediator;
import flash.display3D.Context3DRenderMode;
import flash.events.Event;
import flash.geom.Rectangle;
import org.mvcexpress.modules.ModuleCore;
import starling.core.Starling;

/**
 * COMMENT : todo
 * @author rBanevicius
 */
public class StarlingTestModule extends ModuleCore {
	
	private var antialiasing:HUISlider;
	
	static public const NAME:String = "StarlingTestModule";
	
	public function StarlingTestModule() {
		super(StarlingTestModule.NAME);
	}
	
	override protected function onInit():void {
	
	}
	
	public function start(main:Main):void {
		trace("StarlingTestModule.start > main : " + main);
		
		commandMap.execute(SetUpViewCommand);
		
		var mStarling:Starling = new Starling(Game, main.stage, new Rectangle(0, 0, 800, 600));
		//var mStarling:Starling = new Starling(Game, main.stage, new Rectangle(0, 0, 800, 600),null, Context3DRenderMode.SOFTWARE);
		mediatorMap.mediateWith(mStarling, StarlingMediator);
		
		mediatorMap.mediate(main);

	
	}

	
	override protected function onDispose():void {
	
	}

}
}