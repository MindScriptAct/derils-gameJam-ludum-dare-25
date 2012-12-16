package com.mindscriptact.starlingtest.controller.setup {
import com.mindscriptact.starlingtest.model.bankster.BanksterProxy;
import com.mindscriptact.starlingtest.model.config.GameConfig;
import com.mindscriptact.starlingtest.model.enemies.EnemyProxy;
import com.mindscriptact.starlingtest.model.gui.GuiProxy;
import com.mindscriptact.starlingtest.model.keyboard.KeyboardProxy;
import flash.display.Stage;
import org.mvcexpress.mvc.Command;

/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class SetUpProxyCommand extends Command {
	
	public function execute(stage:Stage):void {
		proxyMap.map(new KeyboardProxy(stage));
		proxyMap.map(new GameConfig());
		proxyMap.map(new BanksterProxy());
		proxyMap.map(new EnemyProxy());
		proxyMap.map(new GuiProxy());
	}

}
}