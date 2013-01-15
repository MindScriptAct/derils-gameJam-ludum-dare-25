package com.mindscriptact.ludumDare25.engine.tasks {
import com.mindscriptact.ludumDare25.constants.EnemyTypes;
import com.mindscriptact.ludumDare25.constants.GameConstants;
import com.mindscriptact.ludumDare25.messages.Message;
import com.mindscriptact.ludumDare25.model.bankster.BanksterDataVO;
import com.mindscriptact.ludumDare25.model.enemies.EnemyVO;
import org.mvcexpress.live.Task;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class ColideWithEnemies extends Task {
	
	[Inject(name="bankster_Position")]
	public var curentPosition:BanksterDataVO;
	
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