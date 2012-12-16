package com.mindscriptact.starlingtest.controller.controlls {
import com.mindscriptact.starlingtest.constants.EnemyTypes;
import com.mindscriptact.starlingtest.constants.GameConstants;
import com.mindscriptact.starlingtest.messages.Message;
import com.mindscriptact.starlingtest.model.bankster.BanksterProxy;
import com.mindscriptact.starlingtest.model.enemies.EnemyProxy;
import com.mindscriptact.starlingtest.model.enemies.EnemyVO;
import com.mindscriptact.starlingtest.model.enemies.params.EnemySpawnParamsVo;
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
	
	public function execute(keyCode:uint):void {
		if (guiProxy.bankReady()) {
			guiProxy.resetBankTimer();
			
			var banksterPosition:Point = banksterProxy.getCurrentPosition();
			
			var collectedMoney:int;
			var enemiesInRange:Vector.<EnemyVO> = enemyProxy.getEnemiesInRange(banksterPosition, GameConstants.BANK_RANGE_POWERED);
			
			for (var i:int = 0; i < enemiesInRange.length; i++) {
				var enemyVo:EnemyVO = enemiesInRange[i];
				if (enemyVo.curentMoney > 0) {
					if (enemyVo.curentMoney > GameConstants.BANK_AMMOUNT) {
						collectedMoney += GameConstants.BANK_AMMOUNT;
						enemyVo.curentMoney -= GameConstants.BANK_AMMOUNT;
					} else {
						collectedMoney += enemyVo.curentMoney;
						enemyVo.curentMoney = 0;
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
			guiProxy.addMoney(collectedMoney);
			if (guiProxy.isNeededMoneyCollected()) {
				sendMessage(Message.SHOW_STAGE_DONE);
			}
		}
	}

}
}