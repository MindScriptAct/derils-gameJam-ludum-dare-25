package com.mindscriptact.ludumDare25.controller.setup {
import com.mindscriptact.ludumDare25.model.bankster.BanksterProxy;
import com.mindscriptact.ludumDare25.model.config.GameConfig;
import com.mindscriptact.ludumDare25.model.enemies.EnemyProxy;
import com.mindscriptact.ludumDare25.model.gui.GuiProxy;
import com.mindscriptact.ludumDare25.model.keyboard.KeyboardProxy;
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