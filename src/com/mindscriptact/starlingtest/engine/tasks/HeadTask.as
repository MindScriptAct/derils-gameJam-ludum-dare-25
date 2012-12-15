package com.mindscriptact.starlingtest.engine.tasks {
	import org.mvcexpress.live.Task;
	

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class HeadTask extends Task {
	
	override public function run():void {
		trace( "HeadTask.run" );
	}
	
}
}