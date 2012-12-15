package com.mindscriptact.starlingtest.model.gui {
import flash.utils.getTimer;
import org.mvcexpress.mvc.Proxy;

/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class GuiProxy extends Proxy {
	
	private var bankTime:BankTimeVO = new BankTimeVO();
	
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

}
}