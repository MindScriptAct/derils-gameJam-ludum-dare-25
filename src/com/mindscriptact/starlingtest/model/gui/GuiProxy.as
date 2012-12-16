package com.mindscriptact.starlingtest.model.gui {
import com.mindscriptact.starlingtest.messages.DataMessage;
import flash.utils.getTimer;
import org.mvcexpress.mvc.Proxy;

/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class GuiProxy extends Proxy {
	
	private var bankTime:BankTimeVO = new BankTimeVO();
	
	private var currentMoney:int = 0;
	
	private var neededMoney:int;
	
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
		sendMessage(DataMessage.MONEY_CHANGED);
	}

}
}