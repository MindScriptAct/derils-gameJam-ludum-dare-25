package com.mindscriptact.ludumDare25.view.game.elements {
import com.mindscriptact.ludumDare25.picLib.PicResources;
import starling.display.Image;
import starling.display.Sprite;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class CoinSprite extends Sprite {
	private var coinImage:Image;
	
	public var enemyId:int;
	
	public function CoinSprite(enemyId:int, ammount:int) {
		this.enemyId = enemyId;
		createCoinPic(ammount);
	}
	
	public function changeAmmount(ammount:int):void {
		if (coinImage) {
			coinImage.dispose();
			this.removeChild(coinImage);
			coinImage = null;
		}
		createCoinPic(ammount);
	}
	
	private function createCoinPic(ammount:int):void {
		switch (ammount) {
			case 0: 
				coinImage = null;
				// show nothing
				break;
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
		if (coinImage) {
			this.addChild(coinImage);
			coinImage.pivotX = coinImage.width >> 1;
			coinImage.pivotY = coinImage.height >> 1;
		}
	
	}
	
	override public function dispose():void {
		if (coinImage) {
			this.removeChild(coinImage);
			coinImage.dispose();
			coinImage = null;
		}
		super.dispose();
	}

}
}