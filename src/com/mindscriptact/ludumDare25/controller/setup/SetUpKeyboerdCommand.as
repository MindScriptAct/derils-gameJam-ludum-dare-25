package com.mindscriptact.ludumDare25.controller.setup {
import com.mindscriptact.ludumDare25.messages.Message;
import com.mindscriptact.ludumDare25.model.keyboard.KeyboardProxy;
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
		
		keyboardProxy.registerMessageSendOnPress(Keyboard.ENTER, Message.ENTER_PRESS);
		keyboardProxy.registerMessageSendOnPress(Keyboard.CONTROL, Message.ENTER_PRESS);
		keyboardProxy.registerMessageSendOnPress(Keyboard.ALTERNATE, Message.ENTER_PRESS);
		keyboardProxy.registerMessageSendOnPress(Keyboard.SHIFT, Message.ENTER_PRESS);
	}

}
}