package com.mindscriptact.starlingtest.controller.game {
import com.mindscriptact.starlingtest.constants.GameConstants;
import com.mindscriptact.starlingtest.messages.Message;
import com.mindscriptact.starlingtest.model.bankster.BanksterProxy;
import com.mindscriptact.starlingtest.model.config.GameConfig;
import com.mindscriptact.starlingtest.model.config.StageConfigVO;
import com.mindscriptact.starlingtest.model.enemies.EnemyProxy;
import com.mindscriptact.starlingtest.model.gui.GuiProxy;
import org.mvcexpress.mvc.Command;

/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class StartStageCommand extends Command {
	
	[Inject]
	public var guiProxy:GuiProxy;
	
	[Inject]
	public var banksterProxy:BanksterProxy
	
	[Inject]
	public var gameConfig:GameConfig;
	
	[Inject]
	public var enemyProxy:EnemyProxy;
	
	public function execute(stageId:int):void {
		guiProxy.setStageId(stageId);
		
		enemyProxy.removeAll();
		
		banksterProxy.teleportBankster(GameConstants.GAME_WIDTH >> 1, GameConstants.GAME_HEIGHT >> 1);
		
		guiProxy.resetBankTimer();
		guiProxy.setBankTotalTime(GameConstants.BANK_TIME);
		
		var stageConfigVo:StageConfigVO = gameConfig.getStageConfig(stageId);
		
		//
		guiProxy.setMoney(0);
		guiProxy.setNeededMoney(stageConfigVo.neededMoney);
		
		sendMessage(Message.ADD_COMMONER, stageConfigVo.commonEnemyCount);
		
		sendMessage(Message.HIDE_BANKSTER_READY_RANGE);
		
		sendMessage(Message.HIDE_STAGE_DONE);
	}

}
}