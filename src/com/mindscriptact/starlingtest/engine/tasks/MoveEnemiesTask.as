package com.mindscriptact.starlingtest.engine.tasks {
import com.mindscriptact.starlingtest.constants.GameConstants;
import com.mindscriptact.starlingtest.model.enemies.EnemyVO;
import org.mvcexpress.live.Task;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class MoveEnemiesTask extends Task {
	
	[Inject(name="enemies_data")]
	public var enemies:Vector.<EnemyVO>
	
	override public function run():void {
		
		for (var i:int = 0; i < enemies.length; i++) {
			var enemyVo:EnemyVO = enemies[i];
			if (enemyVo.leftSide) {
				enemyVo.position.x += enemyVo.moveSpeed;
			} else {
				enemyVo.position.x -= enemyVo.moveSpeed;
			}
			
			// check boundary.
			if (enemyVo.position.x < -GameConstants.ENEMY_SIZE || enemyVo.position.x > GameConstants.GAME_WIDTH + GameConstants.ENEMY_SIZE) {
				// move to command
				enemyVo.position.y = Math.floor(Math.random() * (GameConstants.GAME_HEIGHT - GameConstants.ENEMY_SIZE * 2)) + GameConstants.ENEMY_SIZE;
				
				enemyVo.leftSide = (enemyVo.position.x < GameConstants.GAME_WIDTH / 2)
				
			}
			
		}
	}

}
}