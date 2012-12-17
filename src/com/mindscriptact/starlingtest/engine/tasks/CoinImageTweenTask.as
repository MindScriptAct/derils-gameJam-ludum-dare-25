package com.mindscriptact.starlingtest.engine.tasks {
import com.mindscriptact.starlingtest.messages.Message;
import com.mindscriptact.starlingtest.model.bankster.BanksterDataVO;
import com.mindscriptact.starlingtest.view.game.elements.SingleCoinImage;
import flash.geom.Point;
import org.mvcexpress.live.Task;
import starling.display.Image;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class CoinImageTweenTask extends Task {
	
	[Inject(name="bankster_Position")]
	public var curentPosition:BanksterDataVO;
	
	[Inject(name="coin_items_components")]
	public var coinItemImages:Vector.<SingleCoinImage>;
	
	override public function run():void {
		for (var i:int = 0; i < coinItemImages.length; i++) {
			var coin:SingleCoinImage = coinItemImages[i];
			
			var difX:Number = coin.x - curentPosition.x;
			var difY:Number = coin.y - curentPosition.y;
			
			if (difX * difX < 900 && difY * difY < 900) {
				sendPostMessage(Message.REMOVE_COIN_ITEM, coin);
			} else {
				coin.x -= difX * coin.acelecation;
				coin.y -= difY * coin.acelecation;
				
				coin.acelecation += 0.01;
			}
			
		}
	}

}
}