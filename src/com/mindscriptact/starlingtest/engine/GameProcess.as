package com.mindscriptact.starlingtest.engine {
import com.mindscriptact.starlingtest.engine.tasks.CalculateBankTimerTask;
import com.mindscriptact.starlingtest.engine.tasks.CalculateEnemyTimerTask;
import com.mindscriptact.starlingtest.engine.tasks.CoinImageTweenTask;
import com.mindscriptact.starlingtest.engine.tasks.ColideWithEnemies;
import com.mindscriptact.starlingtest.engine.tasks.HeadTask;
import com.mindscriptact.starlingtest.engine.tasks.MoveBanksterTask;
import com.mindscriptact.starlingtest.engine.tasks.MoveEnemiesTask;
import com.mindscriptact.starlingtest.engine.tasks.MoveViewElementTask;
import com.mindscriptact.starlingtest.engine.tasks.RenderGuiTask;
import com.mindscriptact.starlingtest.messages.Message;
import org.mvcexpress.live.Process;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class GameProcess extends Process {
	
	override protected function onRegister():void {
		
		this.addTask(HeadTask);
		
		this.addTask(CalculateBankTimerTask);
		this.addTask(CalculateEnemyTimerTask);
		
		this.addTask(MoveBanksterTask);
		this.addTask(MoveEnemiesTask);
		
		this.addTask(CoinImageTweenTask);
		this.addTask(MoveViewElementTask);
		
		this.addTask(ColideWithEnemies);
		
		this.addTask(RenderGuiTask);
		
		addHandler(Message.START_GAME, handleStartGame);
		addHandler(Message.GAME_OVER, handleGameOver);
	}
	
	private function handleGameOver(blank:Object):void {
		this.stopProcess();
	}
	
	private function handleStartGame(blank:Object):void {
		this.startProcess();
	}

}
}