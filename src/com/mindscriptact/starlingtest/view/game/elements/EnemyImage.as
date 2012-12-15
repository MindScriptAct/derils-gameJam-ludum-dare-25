package com.mindscriptact.starlingtest.view.game.elements {
import com.mindscriptact.starlingUtils.easyShapes.EasySquareImage;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class EnemyImage extends EasySquareImage {

	public var enemyId:int;
	
	public function EnemyImage(enemyId:int) {
		super(64, 0xFFFF00, -1, 0);
		this.enemyId = enemyId;
		
	}

}
}