package com.mindscriptact.starlingtest.view.game {
import com.mindscriptact.starlingtest.constants.EnemyTypes;
import com.mindscriptact.starlingtest.messages.DataMessage;
import com.mindscriptact.starlingtest.messages.Message;
import com.mindscriptact.starlingtest.messages.ViewMessage;
import com.mindscriptact.starlingtest.model.enemies.params.EnemySpawnParamsVo;
import com.mindscriptact.starlingtest.picLib.PicResources;
import com.mindscriptact.starlingtest.view.game.elements.BankActionReadyImage;
import com.mindscriptact.starlingtest.view.game.elements.EnemySprite;
import com.mindscriptact.starlingUtils.easySprites.EasyBackgroundSprite;
import org.mvcexpress.mvc.Mediator;
import starling.display.Image;
import starling.display.MovieClip;
import starling.display.Sprite;

/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class GameMediator extends Mediator {
	
	[Inject]
	public var view:Game;
	
	//[Inject]
	//public var myProxy:MyProxy;
	
	[Embed(source="/pics/santa.png")]
	private const santaAtlasBitmap:Class;
	private var mMovie:MovieClip;
	private var gamePlayerHolder:Sprite;
	
	[Provide(name="enemie_components")]
	public var enemyImages:Vector.<EnemySprite> = new Vector.<EnemySprite>();
	[Provide(name="enemie_bar_components")]
	public var enemyBarImages:Vector.<Image> = new Vector.<Image>();
	[Provide(name="enemie_bar_image_components")]
	public var enemyBarBorderImages:Vector.<Image> = new Vector.<Image>();
	
	public var bankster:Image;
	
	private var banksterReady:BankActionReadyImage;
	
	[Embed(source="/pics/santa.xml",mimeType="application/octet-stream")]
	public const santaAtlasDefinitions:Class;
	
	override public function onRegister():void {
		
		var bg:EasyBackgroundSprite = new EasyBackgroundSprite(PicResources.getTexture(PicResources.DIRT_ID), 3, 2);
		view.addChild(bg);
		
		// TODO mediate...
		gamePlayerHolder = new Sprite();
		view.addChild(gamePlayerHolder);
		
		bankster = new Image(PicResources.getTexture(PicResources.BANKSTER_ID));
		gamePlayerHolder.addChild(bankster);
		bankster.pivotX = bankster.width >> 1;
		bankster.pivotY = bankster.height >> 1;
		processMap.provide(bankster, "bankster_component");
		
		banksterReady = new BankActionReadyImage();
		gamePlayerHolder.addChild(banksterReady);
		processMap.provide(banksterReady, "bankster_ready_component");
		banksterReady.visible = false;
		
		addHandler(DataMessage.ENEMY_ADDED, handleAddEnemy);
		addHandler(DataMessage.ENEMY_TYPE_CHANGE, handleChangeEnemy);
		addHandler(DataMessage.REMOVE_ALL_ENEMIES, handleRemoveAllEnemies);
		
		addHandler(Message.SHOW_BANKSTER_READY_RANGE, handleShowBanksterReady);
		addHandler(Message.HIDE_BANKSTER_READY_RANGE, handleHideBanksterReady);
	
		//var enemy:EnemySprite = new EnemySprite(0, EnemyTypes.OCCUPYER);
		//gamePlayerHolder.addChildAt(enemy, 0);
	
	}
	
	public function handleChangeEnemy(enemySpownVo:EnemySpawnParamsVo):void {
		for (var i:int = 0; i < enemyImages.length; i++) {
			if (enemyImages[i].enemyId == enemySpownVo.id) {
				enemyImages[i].changeType(enemySpownVo.enemyType);
				if (enemySpownVo.enemyType == EnemyTypes.OCCUPYER) {
					enemyBarImages[i].visible = false;
					enemyBarBorderImages[i].visible = false;
				}
				break;
			}
		}
	}
	
	private function handleAddEnemy(enemySpawnVo:EnemySpawnParamsVo):void {
		//TODO: add Pooling
		var enemy:EnemySprite = new EnemySprite(enemySpawnVo.id, enemySpawnVo.enemyType);
		gamePlayerHolder.addChildAt(enemy, 0);
		enemy.x = -200;
		enemyImages.push(enemy);
		
		var moneyRect:Image = new Image(PicResources.getTexture(PicResources.ENEMY_MONEY_BAR_ID));
		gamePlayerHolder.addChild(moneyRect);
		enemyBarImages.push(moneyRect);
		moneyRect.x = -200;
		
		var moneyRectBorder:Image = new Image(PicResources.getTexture(PicResources.ENEMY_MONEY_BORDER_ID));
		gamePlayerHolder.addChild(moneyRectBorder);
		enemyBarBorderImages.push(moneyRectBorder);
		moneyRectBorder.x = -200;
	
	}
	
	private function handleRemoveAllEnemies(blank:Object):void {
		//TODO: add Pooling
		while (enemyImages.length) {
			var enemyImage:EnemySprite = enemyImages.pop();
			gamePlayerHolder.removeChild(enemyImage);
			enemyImage.dispose();
		}
		while (enemyBarImages.length) {
			var tempImage:Image = enemyBarImages.pop();
			gamePlayerHolder.removeChild(tempImage);
			tempImage.dispose();
		}
		while (enemyBarBorderImages.length) {
			tempImage = enemyBarBorderImages.pop();
			gamePlayerHolder.removeChild(tempImage);
			tempImage.dispose();
		}
	}
	
	private function handleShowBanksterReady(blank:Object):void {
		banksterReady.visible = true;
	}
	
	private function handleHideBanksterReady(blank:Object):void {
		banksterReady.visible = false;
	}
	
	override public function onRemove():void {
	
	}

}
}