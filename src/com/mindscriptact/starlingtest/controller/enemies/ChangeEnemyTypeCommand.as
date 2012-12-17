package com.mindscriptact.starlingtest.controller.enemies {
import com.mindscriptact.starlingtest.controller.enemies.params.EnemyTypeChangeParamsVo;
import com.mindscriptact.starlingtest.model.enemies.EnemyProxy;
import org.mvcexpress.mvc.Command;

/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class ChangeEnemyTypeCommand extends Command {
	
	[Inject]
	public var enemyProxy:EnemyProxy;
	;
	
	public function execute(enemyChangeParams:EnemyTypeChangeParamsVo):void {
		enemyProxy.changeEnemyType(enemyChangeParams.id, enemyChangeParams.enemyType, 0);
	}

}
}