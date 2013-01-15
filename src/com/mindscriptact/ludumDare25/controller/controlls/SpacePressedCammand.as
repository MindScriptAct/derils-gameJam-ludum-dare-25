package com.mindscriptact.ludumDare25.controller.controlls {
import com.mindscriptact.ludumDare25.constants.EnemyTypes;
import com.mindscriptact.ludumDare25.constants.GameConstants;
import com.mindscriptact.ludumDare25.messages.Message;
import com.mindscriptact.ludumDare25.model.bankster.BanksterProxy;
import com.mindscriptact.ludumDare25.model.enemies.EnemyProxy;
import com.mindscriptact.ludumDare25.model.enemies.EnemyVO;
import com.mindscriptact.ludumDare25.model.gui.GuiProxy;
import com.mindscriptact.ludumDare25.picLib.SoundLib;
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
	
	public function execute(keyCode:uint):void {
		if (guiProxy.bankReady()) {
			guiProxy.resetBankTimer();
			
			SoundLib.playRandomeEfect();
			
			var banksterPosition:Point = banksterProxy.getCurrentPosition();
			
			var collectedMoney:int;
			var enemiesInRange:Vector.<EnemyVO> = enemyProxy.getEnemiesInRange(banksterPosition, GameConstants.BANK_RANGE_POWERED);
			
			for (var i:int = 0; i < enemiesInRange.length; i++) {
				var enemyVo:EnemyVO = enemiesInRange[i];
				if (enemyVo.curentCoins > 0) {
					
					collectedMoney += GameConstants.COIN_VALUE;
					
					enemyProxy.removeCoin(enemyVo.id);
					
					if (enemyVo.curentCoins == 0) {
						if (enemyVo.enemyType == EnemyTypes.COMMONER) {
							var goDownInt:int = 0;
							if (banksterPosition.y < enemyVo.position.y) {
								goDownInt = 1;
							} else {
								goDownInt = -1
							}
							enemyProxy.changeEnemyType(enemyVo.id, EnemyTypes.ANGRY_COMMONER, goDownInt);
							enemyProxy.setTypeChangeTimer(enemyVo.id, GameConstants.ENEMY_TURN_OCUPY_TIME);
						}
					}
				}
			}
			guiProxy.addMoney(collectedMoney - GameConstants.BANKING_COST);
			if (guiProxy.isNeededMoneyCollected()) {
				sendMessage(Message.SHOW_STAGE_DONE);
			}
		}
	}

}
}