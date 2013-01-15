package com.mindscriptact.ludumDare25.engine.tasks {
import com.mindscriptact.ludumDare25.messages.Message;
import com.mindscriptact.ludumDare25.model.gui.BankTimeVO;
import flash.utils.getTimer;
import org.mvcexpress.live.Task;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class CalculateBankTimerTask extends Task {
	
	[Inject(name="gui_bank_timer")]
	public var bankTime:BankTimeVO;
	
	override public function run():void {
		if (bankTime.timePassed < bankTime.totalTime) {
			//trace( "timePassed : " + bankTime.timePassed );
			var timer:uint = getTimer();
			bankTime.timePassed += timer - bankTime.lastTimer;
			bankTime.lastTimer = timer;
			if (bankTime.timePassed >= bankTime.totalTime) {
				sendPostMessage(Message.SHOW_BANKSTER_READY_RANGE);
			}
		}
	}

}
}