package com.mindscriptact.starlingtest.engine.tasks {
import com.mindscriptact.starlingtest.model.enemies.EnemyVO;
import com.mindscriptact.starlingtest.view.game.elements.BanksterImage;
import com.mindscriptact.starlingtest.view.game.elements.EnemyImage;
import flash.geom.Point;
import org.mvcexpress.live.Task;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class MoveViewElementTask extends Task {
	
	[Inject(name="bankster_Position")]
	public var curentPosition:Point;
	
	[Inject(name="bankster_component")]
	public var bankster:BanksterImage;
	
	[Inject(name="enemies_data")]
	public var enemies:Vector.<EnemyVO>
	
	[Inject(name="enemie_components")]
	public var enemyImages:Vector.<EnemyImage>
	
	override public function run():void {
		// put bankster to correct positio
		bankster.x = curentPosition.x;
		bankster.y = curentPosition.y;
		
		for (var i:int = 0; i < enemies.length; i++) {
			enemyImages[i].x = enemies[i].position.x;
			enemyImages[i].y = enemies[i].position.y;
		}
	}

}
}