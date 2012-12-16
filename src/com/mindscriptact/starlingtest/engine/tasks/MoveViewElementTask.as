package com.mindscriptact.starlingtest.engine.tasks {
import com.mindscriptact.starlingtest.constants.GameConstants;
import com.mindscriptact.starlingtest.model.enemies.EnemyVO;
import com.mindscriptact.starlingtest.view.game.elements.BankActionReadyImage;
import com.mindscriptact.starlingtest.view.game.elements.BanksterImage;
import com.mindscriptact.starlingtest.view.game.elements.EnemySprite;
import flash.geom.Point;
import org.mvcexpress.live.Task;
import starling.display.Image;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class MoveViewElementTask extends Task {
	
	[Inject(name="bankster_Position")]
	public var curentPosition:Point;
	
	[Inject(name="bankster_component")]
	public var bankster:Image;
	
	[Inject(name="bankster_ready_component")]
	public var banksterReady:BankActionReadyImage;
	
	[Inject(name="enemies_data")]
	public var enemies:Vector.<EnemyVO>
	
	[Inject(name="enemie_components")]
	public var enemyImages:Vector.<EnemySprite>
	
	[Inject(name="enemie_bar_components")]
	public var enemyBarImages:Vector.<Image>;
	
	[Inject(name="enemie_bar_image_components")]
	public var enemyBarBorderImages:Vector.<Image>;
	
	override public function run():void {
		// put bankster to correct positio
		bankster.x = curentPosition.x;
		bankster.y = curentPosition.y;
		
		banksterReady.x = curentPosition.x;
		banksterReady.y = curentPosition.y;
		
		for (var i:int = 0; i < enemies.length; i++) {
			enemyImages[i].x = enemies[i].position.x;
			enemyImages[i].y = enemies[i].position.y;
			
			enemyBarImages[i].x = enemies[i].position.x - 25;
			enemyBarImages[i].y = enemies[i].position.y - GameConstants.ENEMY_SIZE + 10;
			
			enemyBarImages[i].scaleX = enemies[i].moneyPerc;
			
			enemyBarBorderImages[i].x = enemies[i].position.x - 25;
			enemyBarBorderImages[i].y = enemies[i].position.y - GameConstants.ENEMY_SIZE + 10;
			
		}
	}

}
}