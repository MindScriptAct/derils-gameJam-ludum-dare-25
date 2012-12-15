package com.mindscriptact.starlingtest.view.game {
import com.mindscriptact.starlingtest.constants.GameConstants;
import com.mindscriptact.starlingtest.messages.Message;
import com.mindscriptact.starlingtest.picLib.PicResources;
import com.mindscriptact.starlingtest.view.game.elements.BanksterImage;
import com.mindscriptact.starlingtest.view.game.elements.CroshareImage;
import com.mindscriptact.starlingUtils.easyShapes.EasyCircleImage;
import com.mindscriptact.starlingUtils.easyShapes.EasyShapeImage;
import com.mindscriptact.starlingUtils.easyShapes.EasySquareImage;
import com.mindscriptact.starlingUtils.easySprites.EasyBackgroundSprite;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.IBitmapDrawable;
import flash.display.Shape;
import flash.events.EventPhase;
import flash.geom.Point;
import org.mvcexpress.mvc.Mediator;
import starling.core.Starling;
import starling.display.Image;
import starling.display.MovieClip;
import starling.display.Quad;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;
import starling.textures.Texture;
import starling.textures.TextureAtlas;

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
	
	[Provide(name="bankster")]
	public var bankster:BanksterImage;
	
	[Embed(source="/pics/santa.xml",mimeType="application/octet-stream")]
	public const santaAtlasDefinitions:Class;
	
	override public function onRegister():void {
		
		var bg:EasyBackgroundSprite = new EasyBackgroundSprite(PicResources.getBitmap(PicResources.DIRT_ID), 3, 2);
		view.addChild(bg);
		
		bankster = new BanksterImage();
		view.addChild(bankster);
	
		
		addHandler(Message.START_GAME, handleStartGame);
		
		//var santaBD:Bitmap = new santaAtlasBitmap();
		//var texture:Texture = Texture.fromBitmap(santaBD);
		//
		//var xml:XML = XML(new santaAtlasDefinitions());
		//
		//var sTextureAtlas:TextureAtlas = new TextureAtlas(texture, xml);
		//
		//var santaFrames:Vector.<Texture> = sTextureAtlas.getTextures("santa_");
		//
		//for (var i:int = 0; i < 50; i++) {
		//
		//mMovie = new MovieClip(santaFrames, 8);
		//mMovie.x = Math.floor(Math.random() * 500);
		//mMovie.y = Math.floor(Math.random() * 500);
		//
		//view.addChild(mMovie);
		//mMovie.loop = true;
		//mMovie.play();
		//mMovie.currentFrame = Math.floor(Math.random() * mMovie.numFrames)
		//
		//Starling.juggler.add(mMovie);
		//}
		//
		//mMovie.currentFrame = 5;
	
		//view.addEventListener(TouchEvent.TOUCH, handleTouch);
	
	}
	
	private function handleStartGame(level:int):void {
		bankster.x = GameConstants.GAME_WIDTH >> 1;
		bankster.y = GameConstants.GAME_HEIGHT >> 1;
	}
	
	/*
	   private function handleTouch(event:TouchEvent):void {
	   //trace("GameMediator.handleTouch > event : " + event);
	
	   var touch:Touch = event.getTouch(view.stage);
	   if (touch) {
	
	   var position:Point = touch.getLocation(view);
	   //trace("------------------- position : " + position, event.target, event.timestamp);
	   //trace("phase : " + touch.phase);
	   switch (touch.phase) {
	   case TouchPhase.BEGAN:
	   //mMovie.currentFrame++;
	   // press down
	   break;
	   case TouchPhase.ENDED:
	   // press up
	   addTestObject(position);
	   break;
	   case TouchPhase.MOVED:
	   // press + move
	   break;
	   case TouchPhase.HOVER:
	   // move mous witohut press
	   break;
	   case TouchPhase.STATIONARY:
	   // press + move + stop ??????
	   break;
	   default:
	   trace("Not handled.");
	   }
	
	   }
	   }
	
	   private function addTestObject(position:Point):void {
	   //var quadTest:Quad = new Quad(10, 10, 0xFFFF00);
	   //quadTest.x = position.x - 5;
	   //quadTest.y = position.y - 5;
	   //view.addChild(quadTest);
	
	   //
	   var myImage:Image = new CroshareImage();
	   //var myImage:Image = new EasyCircleImage(10);
	   //var myImage:Image = new EasySquareImage(10);
	
	   myImage.x = position.x;
	   myImage.y = position.y;
	   view.addChild(myImage);
	
	   }
	 //*/
	override public function onRemove():void {
	
	}

}
}