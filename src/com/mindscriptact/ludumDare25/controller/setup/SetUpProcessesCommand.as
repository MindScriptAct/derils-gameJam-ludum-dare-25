package com.mindscriptact.ludumDare25.controller.setup {
import com.mindscriptact.ludumDare25.engine.GameProcess;
import org.mvcexpress.mvc.Command;

/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class SetUpProcessesCommand extends Command {
	
	public function execute(blank:Object):void {
		processMap.mapFrameProcess(GameProcess);
		processMap.startProcess(GameProcess);
	}

}
}