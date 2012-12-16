package com.mindscriptact.starlingtest.engine.tasks {
import com.mindscriptact.starlingtest.model.enemies.EnemyVO;
import com.mindscriptact.starlingtest.model.gui.BankTimeVO;
import org.mvcexpress.live.Task;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class ColideWithEnemies extends Task {
	
	[Inject(name="gui_bank_timer")]
	public var bankTime:BankTimeVO;
	
	[Inject(name="enemies_data")]
	public var enemies:Vector.<EnemyVO>
	
	override public function run():void {
	
	}

}
}