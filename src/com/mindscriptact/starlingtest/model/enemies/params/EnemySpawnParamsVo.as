package com.mindscriptact.starlingtest.model.enemies.params {

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class EnemySpawnParamsVo {
	public var totalCoins:int;
	public var enemyType:int;
	public var id:int;
	
	public function EnemySpawnParamsVo(id:int, enemyType:int, totalCoins:int) {
		this.enemyType = enemyType;
		this.id = id;
		this.totalCoins = totalCoins;
		
	}
	
}
}