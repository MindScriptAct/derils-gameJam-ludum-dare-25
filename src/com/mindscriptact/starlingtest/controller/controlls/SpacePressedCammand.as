package com.mindscriptact.starlingtest.controller.controlls {
import com.mindscriptact.starlingtest.model.gui.GuiProxy;
import org.mvcexpress.mvc.PooledCommand;

/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class SpacePressedCammand extends PooledCommand {
	
	[Inject]
	public var guiProxy:GuiProxy;
	
	public function execute(blank:Object):void {
		if (guiProxy.bankReady()) {
			guiProxy.resetBankTimer()
		}
	}

}
}