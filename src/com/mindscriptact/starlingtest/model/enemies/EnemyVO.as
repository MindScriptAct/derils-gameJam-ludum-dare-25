package com.mindscriptact.starlingtest.model.enemies {
import flash.geom.Point;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class EnemyVO {
	
	
	
	static private var enemyCount:int = 0;
	
	public var id:int = enemyCount++;
	
	public var enemyType:int;
	
	public var position:Point
	public var goRight:Boolean;
	public var goDown:Boolean;
	public var moveSpeed:Number;
	
	public var curentCoins:int;
	
	public var moneyPerc:Number;
	public var timeRemaining:int;
	public var lastTimer:uint;


}
}