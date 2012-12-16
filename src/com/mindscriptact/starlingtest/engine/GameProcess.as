package com.mindscriptact.starlingtest.engine {
import com.mindscriptact.starlingtest.engine.tasks.CalculateBankTimerTask;
import com.mindscriptact.starlingtest.engine.tasks.CalculateEnemyTimerTask;
import com.mindscriptact.starlingtest.engine.tasks.ColideWithEnemies;
import com.mindscriptact.starlingtest.engine.tasks.HeadTask;
import com.mindscriptact.starlingtest.engine.tasks.MoveBanksterTask;
import com.mindscriptact.starlingtest.engine.tasks.MoveEnemiesTask;
import com.mindscriptact.starlingtest.engine.tasks.MoveViewElementTask;
import com.mindscriptact.starlingtest.engine.tasks.RenderGuiTask;
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
		
		var calculateBankTimerTask:Task = this.mapTask(CalculateBankTimerTask);
		var calculateEnemyTimerTask:Task = this.mapTask(CalculateEnemyTimerTask);
		
		var moveBanksterTask:Task = this.mapTask(MoveBanksterTask);
		var moveEnemiesTask:Task = this.mapTask(MoveEnemiesTask);

		
		
		
		var movecViewElements:Task = this.mapTask(MoveViewElementTask);
		
		
		var colideWithEnemies:Task = this.mapTask(ColideWithEnemies);
		
		var renderGuiTask:Task = this.mapTask(RenderGuiTask);
		
		
		
		
		this.addTask(headTask);
		
		this.addTask(calculateBankTimerTask);
		this.addTask(calculateEnemyTimerTask);
		
		this.addTask(moveBanksterTask);
		this.addTask(moveEnemiesTask);
		
		this.addTask(movecViewElements);
		
		this.addTask(colideWithEnemies);
		
		this.addTask(renderGuiTask);
		
		
		addHandler(Message.START_GAME, handleStartGame);
		addHandler(Message.GAME_OVER, handleGameOver);
	}
	
	private function handleGameOver(blank:Object):void {
		this.stopProcess();
	}
	
	private function handleStartGame(level:int):void {
		this.startProcess();
	}
	


}
}