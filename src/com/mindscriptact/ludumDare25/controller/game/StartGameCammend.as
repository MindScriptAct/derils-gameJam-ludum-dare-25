package com.mindscriptact.ludumDare25.controller.game {
import com.mindscriptact.ludumDare25.constants.GameScreens;
import com.mindscriptact.ludumDare25.messages.Message;
import com.mindscriptact.ludumDare25.model.gui.GuiProxy;
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