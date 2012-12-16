package com.mindscriptact.starlingtest.controller.game {
import com.mindscriptact.starlingtest.constants.GameScreens;
import com.mindscriptact.starlingtest.messages.Message;
import com.mindscriptact.starlingtest.model.gui.GuiProxy;
import org.mvcexpress.mvc.Command;

/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class StartGameCammend extends Command {
	
	[Inject]
	public var guiProxy:GuiProxy;
	
	public function execute(blank:Object):void {
		
		var screenId:String = guiProxy.getScreenId();
		if (screenId == GameScreens.START_SCREEN) {
			guiProxy.setScreenId(GameScreens.GAME_SCREEN);
			guiProxy.resetTotalMoney();
			sendMessage(Message.START_STAGE, 0);
		}
	}

}
}