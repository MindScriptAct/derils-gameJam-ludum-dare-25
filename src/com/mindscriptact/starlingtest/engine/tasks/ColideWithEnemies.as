package com.mindscriptact.starlingtest.engine.tasks {
import com.mindscriptact.starlingtest.constants.EnemyTypes;
import com.mindscriptact.starlingtest.constants.GameConstants;
import com.mindscriptact.starlingtest.messages.Message;
import com.mindscriptact.starlingtest.model.enemies.EnemyVO;
import com.mindscriptact.starlingtest.model.gui.BankTimeVO;
import flash.geom.Point;
import org.mvcexpress.live.Task;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class ColideWithEnemies extends Task {
	
	[Inject(name="bankster_Position")]
	public var curentPosition:Point;
	
	[Inject(name="enemies_data")]
	public var enemies:Vector.<EnemyVO>
	
	override public function run():void {
		
		var range:int = (GameConstants.BANKSTA_SIZE / 3 + GameConstants.ENEMY_SIZE / 3)
		var rangePowered:int = range * range;
		
		for (var i:int = 0; i < enemies.length; i++) {
			var enemyVo:EnemyVO = enemies[i];
			if (enemyVo.enemyType == EnemyTypes.OCCUPYER) {
				
				var dx:Number = curentPosition.x - enemyVo.position.x;
				var dy:Number = curentPosition.y - enemyVo.position.y;
				var distPow:int = dx * dx + dy * dy;
				if (distPow < rangePowered) {
					sendPostMessage(Message.GAME_OVER);
				}
				
			}
		}
	
	}

}
}