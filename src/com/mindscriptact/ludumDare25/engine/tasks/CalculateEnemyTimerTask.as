package com.mindscriptact.ludumDare25.engine.tasks {
import com.mindscriptact.ludumDare25.constants.EnemyTypes;
import com.mindscriptact.ludumDare25.controller.enemies.params.EnemyTypeChangeParamsVo;
import com.mindscriptact.ludumDare25.messages.Message;
import com.mindscriptact.ludumDare25.model.enemies.EnemyVO;
import flash.utils.getTimer;
import org.mvcexpress.live.Task;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class CalculateEnemyTimerTask extends Task {
	
	[Inject(name="enemies_data")]
	public var enemies:Vector.<EnemyVO>
	
	override public function run():void {
		var timer:uint = getTimer();
		for (var i:int = 0; i < enemies.length; i++) {
			if (enemies[i].enemyType == EnemyTypes.ANGRY_COMMONER) {
				enemies[i].timeRemaining -= timer - enemies[i].lastTimer;
				enemies[i].lastTimer = timer;
				if (enemies[i].timeRemaining < 0) {
					sendPostMessage(Message.CHANGE_ENEMY_TYPE, new EnemyTypeChangeParamsVo(enemies[i].id, EnemyTypes.OCCUPYER));
				}
			}
		}
	}

}
}