package com.mindscriptact.starlingtest.model.enemies {
import com.mindscriptact.starlingtest.messages.DataMessage;
import flash.geom.Point;
import org.mvcexpress.mvc.Proxy;

/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class EnemyProxy extends Proxy {
	
	[Provide(name="enemies_data")]
	public var enemies:Vector.<EnemyVO> = new Vector.<EnemyVO>();
	
	public function EnemyProxy() {
	
	}
	
	public function addEnemy(position:Point, leftSide:Boolean, moveSpeed:Number, totalMoney:int):void {
		trace("EnemyProxy.addEnemy");
		
		var enemy:EnemyVO = new EnemyVO();
		enemy.position = position;
		enemy.leftSide = leftSide;
		enemy.moveSpeed = moveSpeed;
		
		enemy.totalMoney = totalMoney;
		enemy.curentMoney = totalMoney;
		
		enemies.push(enemy);
		
		sendMessage(DataMessage.ENEMY_ADDED, enemy.id);
	}
	
	override protected function onRegister():void {
	
	}
	
	override protected function onRemove():void {
	
	}
	
	public function removeMoneyInRangeOfPoint(position:Point, rangePowered:int, ammount:int):int {
		var totalMoneyRemoved:int = 0;
		for (var i:int = 0; i < enemies.length; i++) {
			var enemyVo:EnemyVO = enemies[i]
			var dx:Number = position.x - enemyVo.position.x;
			var dy:Number = position.y - enemyVo.position.y;
			var distPow:int = dx * dx + dy * dy;
			if (distPow < rangePowered) {
				if (enemyVo.curentMoney > 0) {
					if (enemyVo.curentMoney > ammount) {
						totalMoneyRemoved += ammount;
						enemyVo.curentMoney -= ammount;
					} else {
						totalMoneyRemoved += enemyVo.curentMoney;
						enemyVo.curentMoney = 0;
					}
				}
			}
		}
		return totalMoneyRemoved;
	}
}
}