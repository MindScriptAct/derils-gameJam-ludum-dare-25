package com.mindscriptact.starlingtest.model.enemies.params {

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class EnemySpawnParamsVo {
	public var id:int;
	public var enemyType:int;
	public var totalCoins:int;
	public var rightDirId:int;
	
	public function EnemySpawnParamsVo(id:int, enemyType:int, totalCoins:int, rightDirId:int) {
		this.id = id;
		this.enemyType = enemyType;
		this.totalCoins = totalCoins;
		this.rightDirId = rightDirId;
	
	}

}
}