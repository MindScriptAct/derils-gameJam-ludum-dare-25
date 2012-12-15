package com.mindscriptact.starlingtest.engine.tasks {
import com.mindscriptact.starlingtest.model.gui.BankTimeVO;
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
		}
	}

}
}