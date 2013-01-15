package com.mindscriptact.ludumDare25.controller.game {
import com.mindscriptact.ludumDare25.constants.GameConstants;
import com.mindscriptact.ludumDare25.messages.Message;
import com.mindscriptact.ludumDare25.model.bankster.BanksterProxy;
import com.mindscriptact.ludumDare25.model.config.GameConfig;
import com.mindscriptact.ludumDare25.model.config.StageConfigVO;
import com.mindscriptact.ludumDare25.model.enemies.EnemyProxy;
import com.mindscriptact.ludumDare25.model.gui.GuiProxy;
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