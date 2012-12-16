package com.mindscriptact.starlingtest.controller.setup {
import com.mindscriptact.starlingtest.controller.controlls.EnterPressedCommand;
import com.mindscriptact.starlingtest.controller.controlls.SpacePressedCammand;
import com.mindscriptact.starlingtest.controller.enemies.AddCommonerCammand;
import com.mindscriptact.starlingtest.controller.enemies.ChangeEnemyTypeCommand;
import com.mindscriptact.starlingtest.controller.game.GameOverCommand;
import com.mindscriptact.starlingtest.controller.game.ResetGameCommand;
import com.mindscriptact.starlingtest.controller.game.StartGameCammend;
import com.mindscriptact.starlingtest.controller.game.StartStageCommand;
import com.mindscriptact.starlingtest.messages.Message;
import org.mvcexpress.mvc.Command;

/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class SetUpControllerCommand extends Command {
	
	//[Inject]
	//public var myProxy:MyProxy;
	
	public function execute(blank:Object):void {
		commandMap.map(Message.START_GAME, StartGameCammend);
		commandMap.map(Message.START_STAGE, StartStageCommand);
		commandMap.map(Message.GAME_OVER, GameOverCommand);
		commandMap.map(Message.RESET_GAME, ResetGameCommand);
		
		commandMap.map(Message.ADD_COMMONER, AddCommonerCammand);
		commandMap.map(Message.SPACE_PRESS, SpacePressedCammand);
		commandMap.map(Message.ENTER_PRESS, EnterPressedCommand);
		commandMap.map(Message.CHANGE_ENEMY_TYPE, ChangeEnemyTypeCommand);
	}

}
}