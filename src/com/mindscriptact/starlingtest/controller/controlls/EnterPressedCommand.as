package com.mindscriptact.starlingtest.controller.controlls {
import com.mindscriptact.starlingtest.constants.EnemyTypes;
import com.mindscriptact.starlingtest.constants.GameScreens;
import com.mindscriptact.starlingtest.messages.Message;
import com.mindscriptact.starlingtest.model.gui.GuiProxy;
import org.mvcexpress.mvc.Command;

/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class EnterPressedCommand extends Command {
	
	[Inject]
	public var guiProxy:GuiProxy;
	
	public function execute(blank:Object):void {
		var screenId:String = guiProxy.getScreenId();
		if (screenId == GameScreens.START_SCREEN) {
			sendMessage(Message.START_GAME);
		} else if (screenId == GameScreens.GAMEOVER_SCREEN) {
			sendMessage(Message.RESET_GAME);
		} else if (screenId == GameScreens.GAME_SCREEN) {
			throw Error("");
			
		}
	}

}
}