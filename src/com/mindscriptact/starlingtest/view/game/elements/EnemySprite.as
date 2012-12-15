package com.mindscriptact.starlingtest.view.game.elements {
import com.mindscriptact.starlingtest.constants.GameConstants;
import com.mindscriptact.starlingtest.picLib.PicResources;
import com.mindscriptact.starlingUtils.easyShapes.EasyRectangeImage;
import starling.display.Image;
import starling.display.Sprite;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class EnemySprite extends Sprite {
	private var moneyRect:Image;
	
	public var enemyId:int;
	
	public function EnemySprite(enemyId:int) {
		
		var enemyImage:Image = new Image(PicResources.getTexture(PicResources.ENEMY_ID));
		this.addChild(enemyImage);
		enemyImage.pivotX = enemyImage.width >> 1;
		enemyImage.pivotY = enemyImage.height >> 1;
		this.enemyId = enemyId;
		
		//moneyRect = new Image(PicResources.getTexture(PicResources.ENEMY_MONEY_BAR_ID));
		//this.addChild(moneyRect);
		//moneyRect.x = -25;
		//moneyRect.y = -GameConstants.ENEMY_SIZE + 10;
		//
		//var moneyRectFrame:Image = new Image(PicResources.getTexture(PicResources.ENEMY_MONEY_BORDER_ID));
		//this.addChild(moneyRectFrame);
		//moneyRectFrame.x = -25;
		//moneyRectFrame.y = -GameConstants.ENEMY_SIZE + 10;
	
	}
	
	//public function showMoneyPerc(perc:Number):void {
		//moneyRect.scaleX = perc;
	//}

}
}