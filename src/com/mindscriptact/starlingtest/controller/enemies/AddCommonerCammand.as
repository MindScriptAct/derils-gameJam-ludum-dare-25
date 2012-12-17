package com.mindscriptact.starlingtest.controller.enemies {
import com.mindscriptact.starlingtest.constants.EnemyTypes;
import com.mindscriptact.starlingtest.constants.GameConstants;
import com.mindscriptact.starlingtest.model.enemies.EnemyProxy;
import flash.geom.Point;
import org.mvcexpress.mvc.PooledCommand;

/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class AddCommonerCammand extends PooledCommand {
	
	[Inject]
	public var enemyProxy:EnemyProxy;
	
	public function execute(count:int):void {
		
		for (var i:int = 0; i < count; i++) {
			var goRight:Boolean = Math.random() > 0.5;
			var goDown:Boolean = Math.random() > 0.5;
			
			var position:Point = new Point();
			
			if (goRight) {
				position.x = -GameConstants.ENEMY_SIZE;
			} else {
				position.x = GameConstants.GAME_WIDTH + GameConstants.ENEMY_SIZE;
			}
			
			var moveSpeed:Number = GameConstants.ENEMY_MOVE_SPEED_BASE;
			moveSpeed += Math.random() * GameConstants.ENEMY_MOVE_SPEED_MODIFIER;
			
			position.y = Math.floor(Math.random() * (GameConstants.GAME_HEIGHT - GameConstants.ENEMY_SIZE * 2)) + GameConstants.ENEMY_SIZE;
			
			var cotalCoins:int = GameConstants.ENEMY_COINS;
			enemyProxy.addEnemy(EnemyTypes.COMMONER, position, goRight, goDown, moveSpeed, cotalCoins);
		}
	}

}
}