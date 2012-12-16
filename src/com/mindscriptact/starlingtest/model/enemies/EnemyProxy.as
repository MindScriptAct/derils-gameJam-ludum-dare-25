package com.mindscriptact.starlingtest.model.enemies {
import com.mindscriptact.starlingtest.messages.DataMessage;
import com.mindscriptact.starlingtest.model.enemies.params.EnemySpawnParamsVo;
import flash.geom.Point;
import flash.utils.getTimer;
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
	
	public function addEnemy(enemyType:int, position:Point, goRight:Boolean, goDown:Boolean, moveSpeed:Number, totalMoney:int):void {
		trace("EnemyProxy.addEnemy");
		
		var enemy:EnemyVO = new EnemyVO();
		enemy.enemyType = enemyType;
		enemy.position = position;
		enemy.goRight = goRight;
		enemy.goDown = goDown;
		enemy.moveSpeed = moveSpeed;
		
		enemy.totalMoney = totalMoney;
		enemy.curentMoney = totalMoney;
		
		enemies.push(enemy);
		
		sendMessage(DataMessage.ENEMY_ADDED, new EnemySpawnParamsVo(enemy.id, enemyType));
	}
	
	override protected function onRegister():void {
	
	}
	
	override protected function onRemove():void {
	
	}
	
	public function getEnemiesInRange(position:Point, rangePowered:int):Vector.<EnemyVO> {
		var enemiesInRange:Vector.<EnemyVO> = new Vector.<EnemyVO>();
		for (var i:int = 0; i < enemies.length; i++) {
			var enemyVo:EnemyVO = enemies[i]
			var dx:Number = position.x - enemyVo.position.x;
			var dy:Number = position.y - enemyVo.position.y;
			var distPow:int = dx * dx + dy * dy;
			if (distPow < rangePowered) {
				enemiesInRange.push(enemyVo);
			}
		}
		return enemiesInRange;
	}
	
	public function changeEnemyType(id:int, newEnemyType:int, goDown:Boolean):void {
		for (var i:int = 0; i < enemies.length; i++) {
			if (enemies[i].id == id) {
				enemies[i].enemyType = newEnemyType;
				enemies[i].goDown = goDown;
				sendMessage(DataMessage.ENEMY_TYPE_CHANGE, new EnemySpawnParamsVo(id, newEnemyType));
				break;
			}
		}
	}
	
	public function setTypeChangeTimer(id:int, changeTime:int):void {
		for (var i:int = 0; i < enemies.length; i++) {
			if (enemies[i].id == id) {
				enemies[i].timeRemaining = changeTime;
				enemies[i].lastTimer = getTimer();
			}
		}
	}
	
	public function removeAll():void {
		while (enemies.length) {
			var enemyVo:EnemyVO = enemies.pop();
			enemyVo.position = null;
		}
		sendMessage(DataMessage.REMOVE_ALL_ENEMIES);
	}
}
}