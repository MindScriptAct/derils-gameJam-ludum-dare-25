package com.mindscriptact.starlingtest.view.game.elements {
import com.mindscriptact.starlingtest.constants.GameConstants;
import com.mindscriptact.starlingUtils.easyShapes.EasyCircleImage;
import starling.display.Sprite;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class BanksterSprite extends Sprite {
	
	public function BanksterSprite() {
		this.addChild(new BanksterImage());
		
		
		this.addChild(new EasyCircleImage(GameConstants.BANK_RANGE, -1, 0x88FFFF, 0.1));
	}

}
}