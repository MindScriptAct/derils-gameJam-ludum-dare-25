package com.mindscriptact.starlingtest.engine.tasks {
import com.mindscriptact.starlingtest.constants.EnemyTypes;
import com.mindscriptact.starlingtest.controller.enemies.params.EnemyTypeChangeParamsVo;
import com.mindscriptact.starlingtest.messages.Message;
import com.mindscriptact.starlingtest.model.enemies.EnemyVO;
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