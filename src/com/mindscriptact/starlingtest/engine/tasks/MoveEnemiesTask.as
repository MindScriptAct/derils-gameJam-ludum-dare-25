package com.mindscriptact.starlingtest.engine.tasks {
import com.mindscriptact.starlingtest.constants.EnemyTypes;
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
			if (enemyVo.enemyType == EnemyTypes.ANGRY_COMMONER) {
				if (enemyVo.goRight) {
					enemyVo.position.x += enemyVo.moveSpeed / 2;
				} else {
					enemyVo.position.x -= enemyVo.moveSpeed / 2;
				}
			} else {
				if (enemyVo.goRight) {
					enemyVo.position.x += enemyVo.moveSpeed;
				} else {
					enemyVo.position.x -= enemyVo.moveSpeed;
				}
			}
			
			if (enemyVo.enemyType == EnemyTypes.OCCUPYER) {
				if (enemyVo.goDown) {
					enemyVo.position.y += enemyVo.moveSpeed;
				} else {
					enemyVo.position.y -= enemyVo.moveSpeed;
				}
			}
			
			// check boundary.
			if (enemyVo.position.x < -GameConstants.ENEMY_SIZE || enemyVo.position.x > GameConstants.GAME_WIDTH + GameConstants.ENEMY_SIZE) {
				// move to command
				enemyVo.position.y = Math.floor(Math.random() * (GameConstants.GAME_HEIGHT - GameConstants.ENEMY_SIZE * 2)) + GameConstants.ENEMY_SIZE;
				enemyVo.goRight = (enemyVo.position.x < GameConstants.GAME_WIDTH / 2);
				
				enemyVo.moveSpeed += Math.random() * GameConstants.ENEMY_MOVE_SPEED_ACELERATE;
				
				if (enemyVo.moveSpeed > GameConstants.ENEMY_MOVE_SPEED_CAP) {
					enemyVo.moveSpeed = GameConstants.ENEMY_MOVE_SPEED_CAP
				}
			}
			if (enemyVo.position.y < GameConstants.ENEMY_SIZE || enemyVo.position.y > GameConstants.GAME_HEIGHT - GameConstants.ENEMY_SIZE) {
				// move to command
				enemyVo.goDown = (enemyVo.position.y < GameConstants.GAME_HEIGHT / 2)
			}
			
		}
	}

}
}