package com.mindscriptact.starlingtest.controller.setup{
import com.mindscriptact.starlingtest.messages.Message;
import com.mindscriptact.starlingtest.model.keyboard.KeyboardProxy;
import flash.ui.Keyboard;
import org.mvcexpress.mvc.Command;
	
/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class SetUpKeyboerdCommand extends Command {
	
	[Inject]
	public var keyboardProxy:KeyboardProxy;
	
	public function execute(blank:Object):void {
		keyboardProxy.registerMessageSendOnPress(Keyboard.SPACE, Message.SPACE_PRESS);
	}
	
}
}