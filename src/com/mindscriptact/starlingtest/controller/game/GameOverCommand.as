package com.mindscriptact.starlingtest.controller.game {
import com.mindscriptact.starlingtest.constants.GameScreens;
import com.mindscriptact.starlingtest.model.gui.GuiProxy;
import org.mvcexpress.mvc.Command;

/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class GameOverCommand extends Command {
	
	[Inject]
	public var guiProxy:GuiProxy;
	
	public function execute(blank:Object):void {
		
		guiProxy.setScreenId(GameScreens.GAMEOVER_SCREEN);
	
	}

}
}