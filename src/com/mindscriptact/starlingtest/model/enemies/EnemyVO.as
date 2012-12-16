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
	
	private var _totalMoney:int;
	private var _curentMoney:int;
	public var moneyPerc:Number;
	public var timeRemaining:int;
	public var lastTimer:uint;
	
	public function get totalMoney():int {
		return _totalMoney;
	}
	
	public function set totalMoney(value:int):void {
		_totalMoney = value;
		moneyPerc = _curentMoney / _totalMoney;
	}
	
	public function get curentMoney():int {
		return _curentMoney;
	}
	
	public function set curentMoney(value:int):void {
		_curentMoney = value;
		moneyPerc = _curentMoney / _totalMoney;
	}

}
}