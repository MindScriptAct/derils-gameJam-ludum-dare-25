package com.mindscriptact.starlingtest.controller.game {
import com.mindscriptact.starlingtest.constants.GameConstants;
import com.mindscriptact.starlingtest.constants.GameScreens;
import com.mindscriptact.starlingtest.model.bankster.BanksterProxy;
import com.mindscriptact.starlingtest.model.gui.GuiProxy;
import org.mvcexpress.mvc.Command;

/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class StartGameCammend extends Command {
	
	[Inject]
	public var banksterProxy:BanksterProxy;
	
	[Inject]
	public var guiProxy:GuiProxy;
	
	public function execute(blank:Object):void {
		
		var screenId:String = guiProxy.getScreenId();
		if (screenId == GameScreens.START_SCREEN) {
			guiProxy.setScreenId(GameScreens.GAME_SCREEN);
			
			banksterProxy.teleportBankster(GameConstants.GAME_WIDTH >> 1, GameConstants.GAME_HEIGHT >> 1);
			
			guiProxy.resetBankTimer();
			guiProxy.setBankTotalTime(GameConstants.BANK_TIME);
			
			guiProxy.setMoney(0);
			guiProxy.setNeededMoney(100);
		}
	}

}
}