package com.mindscriptact.starlingtest.model.config {

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class StageConfigVO {
	
	public var commonEnemyCount:int;
	public var neededMoney:int;
	
	public function StageConfigVO(neededMoney:int, commonEnemyCount:int) {
		this.neededMoney = neededMoney;
		this.commonEnemyCount = commonEnemyCount;
	}

}
}