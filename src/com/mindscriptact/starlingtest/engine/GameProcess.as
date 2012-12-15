package com.mindscriptact.starlingtest.engine {
import com.mindscriptact.starlingtest.engine.tasks.HeadTask;
import com.mindscriptact.starlingtest.engine.tasks.MoveBanksterTask;
import com.mindscriptact.starlingtest.engine.tasks.MoveViewElementTask;
import com.mindscriptact.starlingtest.messages.Message;
import org.mvcexpress.live.Process;
import org.mvcexpress.live.Task;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class GameProcess extends Process {
	
	override public function onRegister():void {
		
		var headTask:Task = this.mapTask(HeadTask);
		
		
		var moveBanksterTask:Task = this.mapTask(MoveBanksterTask);
		
		
		
		var movecViewElements:Task = this.mapTask(MoveViewElementTask);
		
		
		
		this.addTask(headTask);
		
		this.addTask(moveBanksterTask);
		
		
		this.addTask(movecViewElements);
		
		
		
		
		addHandler(Message.START_GAME, handleStartGame);
	}
	
	private function handleStartGame(level:int):void {
		this.startProcess();
	}
	


}
}