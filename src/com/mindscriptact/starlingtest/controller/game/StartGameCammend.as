package com.mindscriptact.starlingtest.controller.game {
import com.mindscriptact.starlingtest.constants.GameConstants;
import com.mindscriptact.starlingtest.model.bankster.BanksterProxy;
import org.mvcexpress.mvc.Command;

/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class StartGameCammend extends Command {
	
	[Inject]
	public var banksterProxy:BanksterProxy;
	
	public function execute(level:int):void {
		banksterProxy.teleportBankster(GameConstants.GAME_WIDTH >> 1, GameConstants.GAME_HEIGHT >> 1);
	}

}
}