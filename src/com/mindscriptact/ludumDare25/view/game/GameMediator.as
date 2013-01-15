package com.mindscriptact.ludumDare25.view.game {
import com.greensock.TweenMax;
import com.mindscriptact.ludumDare25.constants.EnemyTypes;
import com.mindscriptact.ludumDare25.messages.DataMessage;
import com.mindscriptact.ludumDare25.messages.Message;
import com.mindscriptact.ludumDare25.messages.ViewMessage;
import com.mindscriptact.ludumDare25.model.enemies.params.EnemySpawnParamsVo;
import com.mindscriptact.ludumDare25.picLib.PicResources;
import com.mindscriptact.ludumDare25.view.game.elements.BankActionReadyImage;
import com.mindscriptact.ludumDare25.view.game.elements.CoinSprite;
import com.mindscriptact.ludumDare25.view.game.elements.EnemySprite;
import com.mindscriptact.ludumDare25.view.game.elements.SingleCoinImage;
import com.mindscriptact.starlingUtils.easySprites.EasyBackgroundSprite;
import org.mvcexpress.mvc.Mediator;
import starling.display.BlendMode;
import starling.display.Image;
import starling.display.Sprite;

/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class GameMediator extends Mediator {
	
	[Inject]
	public var view:Game;
	
	//[Embed(source="/pics/santa.png")]
	//private const santaAtlasBitmap:Class;
	//private var mMovie:MovieClip;
	
	private var gamePlayerHolder:Sprite;
	

	public var enemyImages:Vector.<EnemySprite> = new Vector.<EnemySprite>();

	public var enemyCoinImages:Vector.<CoinSprite> = new Vector.<CoinSprite>();

	public var coinItemImages:Vector.<SingleCoinImage> = new Vector.<SingleCoinImage>();
	
	public var bankster:Image;
	
	private var banksterReady:BankActionReadyImage;
	private var gameItemHolder:Sprite;
	
	[Embed(source="/pics/santa.xml",mimeType="application/octet-stream")]
	public const santaAtlasDefinitions:Class;
	
	override public function onRegister():void {
		
		// disable touche for objects.
		view.touchable = false;
		
		var bg:EasyBackgroundSprite = new EasyBackgroundSprite(PicResources.getTexture(PicResources.DIRT_ID), 3, 2);
		bg.blendMode = BlendMode.NONE;
		view.addChild(bg);
		
		// TODO mediate...
		gamePlayerHolder = new Sprite();
		view.addChild(gamePlayerHolder);
		
		gameItemHolder = new Sprite();
		view.addChild(gameItemHolder);
		
		bankster = new Image(PicResources.getTexture(PicResources.BANKSTER_ID));
		gamePlayerHolder.addChild(bankster);
		bankster.pivotX = bankster.width >> 1;
		bankster.pivotY = bankster.height >> 1;
		
		provide(bankster, "bankster_component");
		
		banksterReady = new BankActionReadyImage();
		gamePlayerHolder.addChild(banksterReady);
		
		provide(banksterReady, "bankster_ready_component");
		banksterReady.visible = false;
		
		addHandler(DataMessage.ENEMY_ADDED, handleAddEnemy);
		addHandler(DataMessage.ENEMY_TYPE_CHANGE, handleChangeEnemy);
		addHandler(DataMessage.ENEMY_COIN_CHANGE, handleCoinEnemy);
		addHandler(DataMessage.REMOVE_ALL_ENEMIES, handleRemoveAllEnemies);
		
		addHandler(Message.SHOW_BANKSTER_READY_RANGE, handleShowBanksterReady);
		addHandler(Message.HIDE_BANKSTER_READY_RANGE, handleHideBanksterReady);
		
		addHandler(Message.REMOVE_COIN_ITEM, handleRemoveCoinItem);
		
		//var enemy:EnemySprite = new EnemySprite(0, EnemyTypes.OCCUPYER);
		//gamePlayerHolder.addChildAt(enemy, 0);
		
		provide(enemyImages, "enemie_components");
		provide(enemyCoinImages, "enemie_bar_components");
		provide(coinItemImages, "coin_items_components");
	
	}
	
	private function handleRemoveCoinItem(coinImage:Image):void {
		for (var i:int = 0; i < coinItemImages.length; i++) {
			if (coinItemImages[i] == coinImage) {
				gameItemHolder.removeChild(coinImage);
				coinImage.dispose();
				coinItemImages.splice(i, 1);
				break;
			}
		}
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
				spawnCoin(enemyImages[i].x, enemyImages[i].y);
				break;
			}
		}
	}
	
	private function spawnCoin(x:Number, y:Number):void {
		var coinImage:SingleCoinImage = new SingleCoinImage(PicResources.getTexture(PicResources.COIN_1_ID));
		coinImage.x = x;
		coinImage.y = y;
		gameItemHolder.addChild(coinImage);
		coinItemImages.push(coinImage);
	
	}
	
	private function handleAddEnemy(enemySpawnVo:EnemySpawnParamsVo):void {
		//TODO: add Pooling
		var enemy:EnemySprite = new EnemySprite(enemySpawnVo.id, enemySpawnVo.enemyType);
		gamePlayerHolder.addChildAt(enemy, 0);
		enemy.x = -200;
		enemyImages.push(enemy);
		if (enemySpawnVo.rightDirId != 0) {
			enemy.scaleX = enemySpawnVo.rightDirId;
		}
		
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
		
		for (var i:int = 0; i < coinItemImages.length; i++) {
			gameItemHolder.removeChild(coinItemImages[i]);
			coinItemImages[i].dispose();
			coinItemImages.splice(i, 1);
		}
	}
	
	private function handleShowBanksterReady(blank:Object):void {
		banksterReady.visible = true;
		banksterReady.scaleX = 1;
		banksterReady.scaleY = 1;
	}
	
	private function handleHideBanksterReady(blank:Object):void {
		//banksterReady.visible = false;
		TweenMax.to(banksterReady, 0.5, {scaleX: 0.1, scaleY: 0.1, onComplete: realyHideBanksterReady});
	}
	
	private function realyHideBanksterReady():void {
		banksterReady.visible = false;
	}
	
	override public function onRemove():void {
	
	}

}
}