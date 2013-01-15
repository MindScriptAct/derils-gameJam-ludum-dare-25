package com.mindscriptact.ludumDare25.constants {

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class GameConstants {
	static public const GAME_WIDTH:int = 1280;
	static public const GAME_HEIGHT:int = 720;
	static public const BANKSTA_SIZE:int = 64;
	static public const ENEMY_SIZE:int = 64;
	
	static public const BANKSTA_MOVE_SPEED:int = 10;
	
	static public const BANK_TIME:int = 2000;
	static public const BANK_RANGE:int = 150;
	static public const BANK_RANGE_POWERED:int = BANK_RANGE * BANK_RANGE;
	static public const BANK_AMMOUNT:int = 10;
	
	static public const ENEMY_MOVE_SPEED_BASE:Number = 2;
	static public const ENEMY_MOVE_SPEED_MODIFIER:Number = 3;
	static public const ENEMY_MOVE_SPEED_ACELERATE:Number = 0.5;
	static public const ENEMY_MOVE_SPEED_CAP:Number = 20;
	
	static public const ENEMY_COINS:int = 3;
	static public const COIN_VALUE:int = 10;
	
	static public const ENEMY_TURN_OCUPY_TIME:int = 2000;
	
	static public const ENTER_KEY_DISABLE_TIME:int = 1500;
	
	static public const BANKING_COST:int = 1;

}
}