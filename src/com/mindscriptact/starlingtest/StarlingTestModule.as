package com.mindscriptact.starlingtest {
import com.bit101.components.HUISlider;
import com.mindscriptact.starlingtest.constants.GameConstants;
import com.mindscriptact.starlingtest.controller.setup.SetUpKeyboerdCommand;
import com.mindscriptact.starlingtest.controller.setup.SetUpViewCommand;
import com.mindscriptact.starlingtest.messages.Message;
import com.mindscriptact.starlingtest.model.keyboard.KeyboardProxy;
import com.mindscriptact.starlingtest.view.game.Game;
import com.mindscriptact.starlingtest.view.starling.StarlingMediator;
import flash.display3D.Context3DRenderMode;
import flash.events.Event;
import flash.geom.Rectangle;
import flash.utils.setTimeout;
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
		
		// set up keyboard
		
		proxyMap.map(new KeyboardProxy(main.stage));
		
		
		
		commandMap.execute(SetUpViewCommand);
		
		commandMap.execute(SetUpKeyboerdCommand);
		
		var mStarling:Starling = new Starling(Game, main.stage, new Rectangle(0, 0, GameConstants.GAME_WIDTH, GameConstants.GAME_HEIGHT));
		//var mStarling:Starling = new Starling(Game, main.stage, new Rectangle(0, 0, 800, 600),null, Context3DRenderMode.SOFTWARE);
		mediatorMap.mediateWith(mStarling, StarlingMediator);
		
		mediatorMap.mediate(main);
		
		// TODO : remove
		setTimeout(debugStartGame, 100);
	
	}
	
	private function debugStartGame():void {
		sendMessage(Message.START_GAME, 1);
	}
	
	override protected function onDispose():void {
	
	}

}
}