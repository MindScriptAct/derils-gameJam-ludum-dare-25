package com.mindscriptact.ludumDare25.engine {
import com.mindscriptact.ludumDare25.engine.tasks.CalculateBankTimerTask;
import com.mindscriptact.ludumDare25.engine.tasks.CalculateEnemyTimerTask;
import com.mindscriptact.ludumDare25.engine.tasks.CoinImageTweenTask;
import com.mindscriptact.ludumDare25.engine.tasks.ColideWithEnemies;
import com.mindscriptact.ludumDare25.engine.tasks.HeadTask;
import com.mindscriptact.ludumDare25.engine.tasks.MoveBanksterTask;
import com.mindscriptact.ludumDare25.engine.tasks.MoveEnemiesTask;
import com.mindscriptact.ludumDare25.engine.tasks.MoveViewElementTask;
import com.mindscriptact.ludumDare25.engine.tasks.RenderGuiTask;
import com.mindscriptact.ludumDare25.messages.Message;
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