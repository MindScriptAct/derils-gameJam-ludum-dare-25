package com.mindscriptact.ludumDare25.controller.game {
import com.mindscriptact.ludumDare25.constants.GameScreens;
import com.mindscriptact.ludumDare25.model.enemies.EnemyProxy;
import com.mindscriptact.ludumDare25.model.gui.GuiProxy;
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