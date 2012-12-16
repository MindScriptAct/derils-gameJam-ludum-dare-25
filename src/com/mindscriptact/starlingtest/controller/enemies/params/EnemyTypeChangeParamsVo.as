package com.mindscriptact.starlingtest.controller.enemies.params {

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class EnemyTypeChangeParamsVo {
	public var enemyType:int;
	public var id:int;
	
	public function EnemyTypeChangeParamsVo(id:int, enemyType:int) {
		this.enemyType = enemyType;
		this.id = id;
	
	}

}
}