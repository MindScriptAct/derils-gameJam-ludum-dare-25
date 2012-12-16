package com.mindscriptact.starlingtest.view.game.elements {
import com.mindscriptact.starlingtest.constants.EnemyTypes;
import com.mindscriptact.starlingtest.picLib.PicResources;
import starling.display.Image;
import starling.display.Sprite;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class CoinSprite extends Sprite {
	private var coinImage:Image;
	
	public var ammount:int;
	
	public function CoinSprite(enemyId:int, ammount:int) {
		this.ammount = enemyId;
		createCoinPic(ammount);
	
	}
	
	public function changeType(enemyType:int):void {
		if (coinImage) {
			coinImage.dispose();
			this.removeChild(coinImage);
			coinImage = null;
		}
		createCoinPic(enemyType);
	}
	
	private function createCoinPic(ammount:int):void {
		switch (ammount) {
			case 1: 
				coinImage = new Image(PicResources.getTexture(PicResources.COIN_1_ID));
				break;
			case 2: 
				coinImage = new Image(PicResources.getTexture(PicResources.COIN_2_ID));
				break;
			case 3: 
				coinImage = new Image(PicResources.getTexture(PicResources.COIN_3_ID));
				break;
			default: 
				throw Error("not suported enemy type:" + ammount);
		}
		
		this.addChild(coinImage);
		coinImage.pivotX = coinImage.width >> 1;
		coinImage.pivotY = coinImage.height >> 1;
	
	}
	
	override public function dispose():void {
		this.removeChild(coinImage);
		coinImage.dispose();
		coinImage = null;
		super.dispose();
	}

}
}