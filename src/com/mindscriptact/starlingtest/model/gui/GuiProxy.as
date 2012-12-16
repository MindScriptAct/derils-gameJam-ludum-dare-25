package com.mindscriptact.starlingtest.model.gui {
import com.mindscriptact.starlingtest.constants.GameScreens;
import com.mindscriptact.starlingtest.messages.DataMessage;
import com.mindscriptact.starlingtest.messages.Message;
import flash.utils.getTimer;
import org.mvcexpress.mvc.Proxy;

/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class GuiProxy extends Proxy {
	
	private var screenId:String = GameScreens.START_SCREEN;
	
	private var stageId:int;
	
	private var bankTime:BankTimeVO = new BankTimeVO();
	
	private var currentMoney:int = 0;
	
	private var neededMoney:int;
	private var totalCollectedMoney:int;
	
	public function GuiProxy() {
	
	}
	
	override protected function onRegister():void {
		processMap.provide(bankTime, "gui_bank_timer");
	}
	
	override protected function onRemove():void {
	
	}
	
	public function resetBankTimer():void {
		bankTime.timePassed = 0;
		bankTime.lastTimer = getTimer();
		sendMessage(Message.HIDE_BANKSTER_READY_RANGE);
	}
	
	public function resetTotalMoney():void {
		this.totalCollectedMoney = 0
	}
	
	public function setBankTotalTime(time:int):void {
		bankTime.totalTime = time;
	}
	
	public function bankReady():Boolean {
		return (bankTime.timePassed >= bankTime.totalTime);
	}
	
	public function setMoney(number:int):void {
		currentMoney = 0;
		sendMessage(DataMessage.MONEY_CHANGED);
	}
	
	public function setNeededMoney(neededMoney:int):void {
		this.neededMoney = neededMoney;
		sendMessage(DataMessage.MONEY_CHANGED);
	}
	
	public function getMoney():int {
		return currentMoney;
	}
	
	public function getNeededMoney():int {
		return neededMoney;
	}
	
	public function addMoney(money:int):void {
		this.currentMoney += money
		this.totalCollectedMoney += money;
		sendMessage(DataMessage.MONEY_CHANGED);
	}
	
	public function getScreenId():String {
		return screenId;
	}
	
	public function setScreenId(newScreenId:String):void {
		this.screenId = newScreenId;
		sendMessage(DataMessage.GUI_SCREEN_CHANGED, this.screenId);
	}
	
	public function getStageId():int {
		return stageId;
	}
	
	public function setStageId(value:int):void {
		this.stageId = value;
		sendMessage(DataMessage.GUI_STAGE_CHANGED, stageId);
	}
	
	public function isNeededMoneyCollected():Boolean {
		return (currentMoney >= neededMoney);
	}
	
	public function getTotalScore():int {
		return totalCollectedMoney;
	}

}
}