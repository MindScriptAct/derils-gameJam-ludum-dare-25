package com.mindscriptact.starlingtest.controller.game {
import com.mindscriptact.starlingtest.constants.GameScreens;
import com.mindscriptact.starlingtest.model.enemies.EnemyProxy;
import com.mindscriptact.starlingtest.model.gui.GuiProxy;
import org.mvcexpress.mvc.Command;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class ResetGameCommand extends Command {
	
	[Inject]
	public var guiProxy:GuiProxy;
	
	[Inject]
	public var enemyProxy:EnemyProxy;
	
	public function execute(blank:Object):void {
		//var screenId:String = guiProxy.getScreenId();
		//if (screenId == GameScreens.GAMEOVER_SCREEN) {
		//
		//}
		
		guiProxy.setScreenId(GameScreens.START_SCREEN);
		
		enemyProxy.removeAll();
	
	}

}
}