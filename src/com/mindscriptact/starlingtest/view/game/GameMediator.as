package com.mindscriptact.starlingtest.view.game {
import com.mindscriptact.starlingtest.picLib.PicResources;
import com.mindscriptact.starlingtest.view.game.elements.CroshareImage;
import com.mindscriptact.starlingUtils.easyShapes.EasyCircleImage;
import com.mindscriptact.starlingUtils.easyShapes.EasyShapeImage;
import com.mindscriptact.starlingUtils.easyShapes.EasySquareImage;
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
 * @author Raimundas Banevicius (raima156@yahoo.com)
 */
public class GameMediator extends Mediator {
	
	[Inject]
	public var view:Game;
	
	//[Inject]
	//public var myProxy:MyProxy;
	
	[Embed(source="/pics/santa.png")]
	private const santaAtlasBitmap:Class;
	private var mMovie:MovieClip;
	
	[Embed(source="/pics/santa.xml",mimeType="application/octet-stream")]
	public const santaAtlasDefinitions:Class;
	
	override public function onRegister():void {
		//var quadTest:Quad = new Quad(200, 200);
		//quadTest.setVertexColor(0, 0x000000);
		//quadTest.setVertexColor(1, 0x00FF00);
		//quadTest.setVertexColor(2, 0xFF0000);
		//quadTest.setVertexColor(3, 0x0000FF);
		//view.addChild(quadTest);
		
		var image1:Image = new Image(PicResources.getBitmap(PicResources.DIRT_ID));
		view.addChild(image1);
		var image2:Image = new Image(PicResources.getBitmap(PicResources.DIRT_ID));
		image2.x = image2.width;
		view.addChild(image2);
		var image3:Image = new Image(PicResources.getBitmap(PicResources.DIRT_ID));
		image3.y = image3.height;
		view.addChild(image3);
		var image4:Image = new Image(PicResources.getBitmap(PicResources.DIRT_ID));
		image4.x = image4.width;
		image4.y = image4.height;
		view.addChild(image4);
		
		var santaBD:Bitmap = new santaAtlasBitmap();
		var texture:Texture = Texture.fromBitmap(santaBD);
		
		var xml:XML = XML(new santaAtlasDefinitions());
		
		var sTextureAtlas:TextureAtlas = new TextureAtlas(texture, xml);
		
		var santaFrames:Vector.<Texture> = sTextureAtlas.getTextures("santa_");
		
		for (var i:int = 0; i < 50; i++) {
			
			mMovie = new MovieClip(santaFrames, 8);
			mMovie.x = Math.floor(Math.random() * 500);
			mMovie.y = Math.floor(Math.random() * 500);
			
			view.addChild(mMovie);
			mMovie.loop = true;
			mMovie.play();
			mMovie.currentFrame = Math.floor(Math.random() * mMovie.numFrames)
			
			Starling.juggler.add(mMovie);
		}
		
		mMovie.currentFrame = 5;
		
		view.addEventListener(TouchEvent.TOUCH, handleTouch);
	
	}
	
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
	
	override public function onRemove():void {
	
	}

}
}