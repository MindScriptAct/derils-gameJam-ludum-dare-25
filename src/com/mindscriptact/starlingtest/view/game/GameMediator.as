package com.mindscriptact.starlingtest.view.game {
import com.greensock.loading.CSSLoader;
import com.mindscriptact.starlingtest.constants.EnemyTypes;
import com.mindscriptact.starlingtest.messages.DataMessage;
import com.mindscriptact.starlingtest.messages.Message;
import com.mindscriptact.starlingtest.messages.ViewMessage;
import com.mindscriptact.starlingtest.model.enemies.params.EnemySpawnParamsVo;
import com.mindscriptact.starlingtest.picLib.PicResources;
import com.mindscriptact.starlingtest.view.game.elements.BankActionReadyImage;
import com.mindscriptact.starlingtest.view.game.elements.CoinSprite;
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
	public var enemyCoinImages:Vector.<CoinSprite> = new Vector.<CoinSprite>();
	
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
		addHandler(DataMessage.ENEMY_COIN_CHANGE, handleCoinEnemy);
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
					enemyCoinImages[i].visible = false;
				}
				break;
			}
		}
	}
	
	public function handleCoinEnemy(enemySpownVo:EnemySpawnParamsVo):void {
		for (var i:int = 0; i < enemyCoinImages.length; i++) {
			if (enemyCoinImages[i].enemyId == enemySpownVo.id) {
				enemyCoinImages[i].changeAmmount(enemySpownVo.totalCoins);
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
		
		var enemyCoins:CoinSprite = new CoinSprite(enemySpawnVo.id, enemySpawnVo.totalCoins);
		gamePlayerHolder.addChild(enemyCoins);
		enemyCoinImages.push(enemyCoins);
		enemyCoins.x = -200;
	
	}
	
	private function handleRemoveAllEnemies(blank:Object):void {
		//TODO: add Pooling
		while (enemyImages.length) {
			var enemyImage:EnemySprite = enemyImages.pop();
			gamePlayerHolder.removeChild(enemyImage);
			enemyImage.dispose();
		}
		while (enemyCoinImages.length) {
			var tempImage:CoinSprite = enemyCoinImages.pop();
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