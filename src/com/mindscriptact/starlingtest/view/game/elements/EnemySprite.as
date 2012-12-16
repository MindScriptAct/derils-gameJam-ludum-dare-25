package com.mindscriptact.starlingtest.view.game.elements {
import com.mindscriptact.starlingtest.constants.EnemyTypes;
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
	private var enemyImage:Image;
	
	public var enemyId:int;
	
	public function EnemySprite(enemyId:int, enemyType:int) {
		this.enemyId = enemyId;
		createEnemyPic(enemyType);
	
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
	
	public function changeType(enemyType:int):void {
		if (enemyImage) {
			this.removeChild(enemyImage);
		}
		createEnemyPic(enemyType);
	}
	
	private function createEnemyPic(enemyType:int):void {
		switch (enemyType) {
			case EnemyTypes.COMMONER: 
				enemyImage = new Image(PicResources.getTexture(PicResources.ENEMY_COMONER_ID));
				break;
			case EnemyTypes.OCCUPYER: 
				enemyImage = new Image(PicResources.getTexture(PicResources.ENEMY_OCCUPYER_ID));
				break;
			default: 
				throw Error("not suported enemy type:" + enemyType);
		}
		
		this.addChild(enemyImage);
		enemyImage.pivotX = enemyImage.width >> 1;
		enemyImage.pivotY = enemyImage.height >> 1;
	
	}

	//public function showMoneyPerc(perc:Number):void {
	//moneyRect.scaleX = perc;
	//}

}
}