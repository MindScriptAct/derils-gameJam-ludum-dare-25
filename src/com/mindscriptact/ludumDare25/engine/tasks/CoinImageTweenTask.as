package com.mindscriptact.ludumDare25.engine.tasks {
import com.mindscriptact.ludumDare25.messages.Message;
import com.mindscriptact.ludumDare25.model.bankster.BanksterDataVO;
import com.mindscriptact.ludumDare25.view.game.elements.SingleCoinImage;
import org.mvcexpress.live.Task;

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