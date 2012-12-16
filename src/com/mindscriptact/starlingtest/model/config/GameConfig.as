package com.mindscriptact.starlingtest.model.config {
import com.mindscriptact.starlingtest.constants.GameConstants;
import flash.utils.Dictionary;
import org.mvcexpress.mvc.Proxy;

/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class GameConfig extends Proxy {
	
	private var stageConfigRegistry:Dictionary = new Dictionary();
	
	public function GameConfig() {
		
		stageConfigRegistry[0] = new StageConfigVO(100, 5);
		stageConfigRegistry[1] = new StageConfigVO(200, 10);
		stageConfigRegistry[2] = new StageConfigVO(350, 15);
		stageConfigRegistry[3] = new StageConfigVO(500, 20);
	}
	
	public function getStageConfig(stageId:int):StageConfigVO {
		if (!stageConfigRegistry[stageId]) {
			generateStageConfig(stageId);
		}
		return stageConfigRegistry[stageId];
	}
	
	private function generateStageConfig(stageId:int):void {
		stageConfigRegistry[stageId] = new StageConfigVO(GameConstants.ENEMY_MENEY * (((stageId - 1) * 10) - 5), (stageId - 1) * 10);
	}
	
	override protected function onRegister():void {
	
	}
	
	override protected function onRemove():void {
	
	}

}
}