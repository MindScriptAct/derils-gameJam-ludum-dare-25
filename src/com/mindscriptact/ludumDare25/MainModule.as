package com.mindscriptact.ludumDare25 {
import com.bit101.components.HUISlider;
import com.mindscriptact.ludumDare25.constants.GameConstants;
import com.mindscriptact.ludumDare25.controller.setup.SetUpControllerCommand;
import com.mindscriptact.ludumDare25.controller.setup.SetUpKeyboerdCommand;
import com.mindscriptact.ludumDare25.controller.setup.SetUpProcessesCommand;
import com.mindscriptact.ludumDare25.controller.setup.SetUpProxyCommand;
import com.mindscriptact.ludumDare25.controller.setup.SetUpViewCommand;
import com.mindscriptact.ludumDare25.messages.DataMessage;
import com.mindscriptact.ludumDare25.messages.Message;
import com.mindscriptact.ludumDare25.messages.ViewMessage;
import com.mindscriptact.ludumDare25.view.game.Game;
import com.mindscriptact.ludumDare25.view.starling.StarlingMediator;
import flash.geom.Rectangle;
import flash.utils.setTimeout;
import org.mvcexpress.modules.ModuleCore;
import org.mvcexpress.utils.checkClassStringConstants;
import starling.core.Starling;

/**
 * COMMENT : todo
 * @author rBanevicius
 */
public class MainModule extends ModuleCore {
	
	private var antialiasing:HUISlider;
	
	static public const NAME:String = "StarlingTestModule";
	
	public function MainModule() {
		super(MainModule.NAME);
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