package com.mindscriptact.ludumDare25.controller.setup {
import com.mindscriptact.ludumDare25.controller.controlls.EnterPressedCommand;
import com.mindscriptact.ludumDare25.controller.controlls.SpacePressedCammand;
import com.mindscriptact.ludumDare25.controller.enemies.AddCommonerCammand;
import com.mindscriptact.ludumDare25.controller.enemies.ChangeEnemyTypeCommand;
import com.mindscriptact.ludumDare25.controller.game.GameOverCommand;
import com.mindscriptact.ludumDare25.controller.game.ResetGameCommand;
import com.mindscriptact.ludumDare25.controller.game.StartGameCammend;
import com.mindscriptact.ludumDare25.controller.game.StartStageCommand;
import com.mindscriptact.ludumDare25.messages.Message;
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