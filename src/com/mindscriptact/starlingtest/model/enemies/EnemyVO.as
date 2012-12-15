package com.mindscriptact.starlingtest.model.enemies {
	import flash.geom.Point;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class EnemyVO {
	
	static private var enemyCount:int = 0;
	
	public var id:int = enemyCount++;
	
	public var position:Point
	public var leftSide:Boolean;
	public var moveSpeed:Number;
	
	
	public var totalMoney:int;
	public var curentMoney:int;

}
}