package com.mindscriptact.ludumDare25.controller.game {
import com.mindscriptact.ludumDare25.constants.GameConstants;
import com.mindscriptact.ludumDare25.constants.GameScreens;
import com.mindscriptact.ludumDare25.model.gui.GuiProxy;
import com.mindscriptact.ludumDare25.picLib.SoundLib;
import flash.utils.getTimer;
import org.mvcexpress.mvc.Command;

/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class GameOverCommand extends Command {
	
	[Inject]
	public var guiProxy:GuiProxy;
	
	public function execute(blank:Object):void {
		
		guiProxy.enableEnterTimeStamp = getTimer() + GameConstants.ENTER_KEY_DISABLE_TIME;
		guiProxy.setScreenId(GameScreens.GAMEOVER_SCREEN);
		
		SoundLib.playRandomeFinisher();
	
	}

}
}