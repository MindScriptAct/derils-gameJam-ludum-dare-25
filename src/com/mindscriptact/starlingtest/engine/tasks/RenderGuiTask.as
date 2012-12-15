package com.mindscriptact.starlingtest.engine.tasks {
import com.mindscriptact.starlingtest.model.gui.BankTimeVO;
import com.mindscriptact.starlingtest.view.gui.GuiHolder;
import org.mvcexpress.live.Task;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class RenderGuiTask extends Task {
	
	[Inject(name="gui_view")]
	public var gui:GuiHolder;
	
	[Inject(name="gui_bank_timer")]
	public var bankTime:BankTimeVO;
	
	override public function run():void {
		if (bankTime.timePassed < bankTime.totalTime) {
			gui.shawBankProgress(bankTime.timePassed / bankTime.totalTime);
		} else {
			gui.showProgressDone();
		}
	}

}
}