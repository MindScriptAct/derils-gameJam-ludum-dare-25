package com.mindscriptact.starlingtest.controller.setup {
import com.mindscriptact.starlingtest.controller.controlls.SpacePressedCammand;
import com.mindscriptact.starlingtest.controller.enemies.AddCommonerCammand;
import com.mindscriptact.starlingtest.controller.game.StartGameCammend;
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
		commandMap.map(Message.ADD_COMMONER, AddCommonerCammand);
		commandMap.map(Message.SPACE_PRESS, SpacePressedCammand);
	}

}
}