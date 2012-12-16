package com.mindscriptact.starlingtest {
import com.bit101.components.HUISlider;
import com.mindscriptact.starlingtest.constants.GameConstants;
import com.mindscriptact.starlingtest.controller.setup.SetUpControllerCommand;
import com.mindscriptact.starlingtest.controller.setup.SetUpKeyboerdCommand;
import com.mindscriptact.starlingtest.controller.setup.SetUpProcessesCommand;
import com.mindscriptact.starlingtest.controller.setup.SetUpProxyCommand;
import com.mindscriptact.starlingtest.controller.setup.SetUpViewCommand;
import com.mindscriptact.starlingtest.messages.DataMessage;
import com.mindscriptact.starlingtest.messages.Message;
import com.mindscriptact.starlingtest.messages.ViewMessage;
import com.mindscriptact.starlingtest.model.keyboard.KeyboardProxy;
import com.mindscriptact.starlingtest.view.game.Game;
import com.mindscriptact.starlingtest.view.starling.StarlingMediator;
import flash.display3D.Context3DRenderMode;
import flash.events.Event;
import flash.geom.Rectangle;
import flash.utils.setTimeout;
import org.mvcexpress.modules.ModuleCore;
import org.mvcexpress.utils.checkClassStringConstants;
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
		CONFIG::debug {
			checkClassStringConstants(Message, DataMessage, ViewMessage);
		}
	
	}
	
	public function start(main:Main):void {
		trace("StarlingTestModule.start > main : " + main);
		
		commandMap.execute(SetUpProxyCommand, main.stage);
		
		commandMap.execute(SetUpViewCommand);
		
		commandMap.execute(SetUpKeyboerdCommand);
		
		commandMap.execute(SetUpControllerCommand);
		// set up keyboard
		
		processMap.setStage(main.stage);
		
		var mStarling:Starling = new Starling(Game, main.stage, new Rectangle(0, 0, GameConstants.GAME_WIDTH, GameConstants.GAME_HEIGHT));
		//var mStarling:Starling = new Starling(Game, main.stage, new Rectangle(0, 0, 800, 600),null, Context3DRenderMode.SOFTWARE);
		mediatorMap.mediateWith(mStarling, StarlingMediator);
		
		mediatorMap.mediate(main);
		
		setTimeout(initProcess, 100);
	
	}
	
	private function initProcess():void {
		commandMap.execute(SetUpProcessesCommand);
		//sendMessage(Message.START_GAME);
	}
	
	override protected function onDispose():void {
	
	}

}
}