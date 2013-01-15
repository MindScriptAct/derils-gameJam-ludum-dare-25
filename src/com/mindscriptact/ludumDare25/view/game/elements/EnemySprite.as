package com.mindscriptact.ludumDare25.view.game.elements {
import com.mindscriptact.ludumDare25.constants.EnemyTypes;
import com.mindscriptact.ludumDare25.picLib.PicResources;
import starling.display.Image;
import starling.display.Sprite;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class EnemySprite extends Sprite {
	private var enemyImage:Image;
	
	public var enemyId:int;
	
	public function EnemySprite(enemyId:int, enemyType:int) {
		this.enemyId = enemyId;
		createEnemyPic(enemyType);
	
	}
	
	public function changeType(enemyType:int):void {
		if (enemyImage) {
			enemyImage.dispose();
			this.removeChild(enemyImage);
			enemyImage = null;
		}
		createEnemyPic(enemyType);
	}
	
	private function createEnemyPic(enemyType:int):void {
		switch (enemyType) {
			case EnemyTypes.COMMONER: 
				enemyImage = new Image(PicResources.getTexture(PicResources.ENEMY_COMONER_ID));
				break;
			case EnemyTypes.ANGRY_COMMONER: 
				enemyImage = new Image(PicResources.getTexture(PicResources.ENEMY_ANGRY_COMONER_ID));
				break;
			case EnemyTypes.OCCUPYER: 
				enemyImage = new Image(PicResources.getTexture(PicResources.ENEMY_OCCUPYER_ID));
				break;
			default: 
				throw Error("not suported enemy type:" + enemyType);
		}
		
		this.addChild(enemyImage);
		enemyImage.pivotX = enemyImage.width >> 1;
		enemyImage.pivotY = enemyImage.height >> 1;
	
	}
	
	override public function dispose():void {
		this.removeChild(enemyImage);
		enemyImage.dispose();
		enemyImage = null;
		super.dispose();
	}

}
}