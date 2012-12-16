package com.mindscriptact.starlingtest.controller.controlls {
import com.mindscriptact.starlingtest.constants.GameConstants;
import com.mindscriptact.starlingtest.model.bankster.BanksterProxy;
import com.mindscriptact.starlingtest.model.enemies.EnemyProxy;
import com.mindscriptact.starlingtest.model.enemies.EnemyVO;
import com.mindscriptact.starlingtest.model.gui.GuiProxy;
import flash.geom.Point;
import org.mvcexpress.mvc.PooledCommand;

/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class SpacePressedCammand extends PooledCommand {
	
	[Inject]
	public var guiProxy:GuiProxy;
	
	[Inject]
	public var enemyProxy:EnemyProxy;
	
	[Inject]
	public var banksterProxy:BanksterProxy;
	
	
	public function execute(blank:Object):void {
		if (guiProxy.bankReady()) {
			guiProxy.resetBankTimer();
			
			
			var banksterPosition:Point = banksterProxy.getCurrentPosition();
			
			var money:int = enemyProxy.removeMoneyInRangeOfPoint(banksterPosition, GameConstants.BANK_RANGE_POWERED, GameConstants.BANK_AMMOUNT);
			
			guiProxy.addMoney(money);
			
		}
	}

}
}