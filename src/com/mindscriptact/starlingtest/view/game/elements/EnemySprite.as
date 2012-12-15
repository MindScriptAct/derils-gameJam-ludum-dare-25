package com.mindscriptact.starlingtest.view.game.elements {
import com.mindscriptact.starlingtest.constants.GameConstants;
import com.mindscriptact.starlingUtils.easyShapes.EasyRectangeImage;
import starling.display.Image;
import starling.display.Sprite;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class EnemySprite extends Sprite {
	private var moneyRect:EasyRectangeImage;
	
	public var enemyId:int;
	
	public function EnemySprite(enemyId:int) {
		var squareImage:EasyRectangeImage = new EasyRectangeImage(64, 64, 0xFFFF00, -1, 0, true);
		this.addChild(squareImage);
		this.enemyId = enemyId;
		
		moneyRect = new EasyRectangeImage(50, 10, 0xFFD700, -1, 0);
		this.addChild(moneyRect);
		moneyRect.x = -25;
		moneyRect.y = -GameConstants.ENEMY_SIZE + 10;
		
		var moneyRectFrame:EasyRectangeImage = new EasyRectangeImage(50, 10, -1, 0xFFFFFF, 2);
		this.addChild(moneyRectFrame);
		moneyRectFrame.x = -25;
		moneyRectFrame.y = -GameConstants.ENEMY_SIZE + 10;
	
	}
	
	public function showMoneyPerc(perc:Number):void {
		moneyRect.scaleX = perc;
	}

}
}