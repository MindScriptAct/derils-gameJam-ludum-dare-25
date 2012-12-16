package com.mindscriptact.starlingtest.view.game {
import com.mindscriptact.starlingtest.messages.DataMessage;
import com.mindscriptact.starlingtest.picLib.PicResources;
import com.mindscriptact.starlingtest.view.game.elements.BanksterImage;
import com.mindscriptact.starlingtest.view.game.elements.BanksterSprite;
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
	
	public var bankster:BanksterSprite;
	
	[Embed(source="/pics/santa.xml",mimeType="application/octet-stream")]
	public const santaAtlasDefinitions:Class;
	
	override public function onRegister():void {
		
		var bg:EasyBackgroundSprite = new EasyBackgroundSprite(PicResources.getTexture(PicResources.DIRT_ID), 3, 2);
		view.addChild(bg);
		
		// TODO mediate...
		gamePlayerHolder = new Sprite();
		view.addChild(gamePlayerHolder);
		
		bankster = new BanksterSprite();
		gamePlayerHolder.addChild(bankster);
		
		processMap.provide(bankster, "bankster_component");
		
		addHandler(DataMessage.ENEMY_ADDED, handleAddEnemy);
	
	}
	
	private function handleAddEnemy(enemyId:int):void {
		var enemy:EnemySprite = new EnemySprite(enemyId);
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
	
	override public function onRemove():void {
	
	}

}
}