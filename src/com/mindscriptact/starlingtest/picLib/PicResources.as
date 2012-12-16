package com.mindscriptact.starlingtest.picLib {
import com.mindscriptact.starlingUtils.easyTextures.EasyTextureGenerator;
import flash.display.Bitmap;
import flash.utils.Dictionary;
import starling.textures.Texture;

/**
 * COMMENT
 * @author rBanevicius
 */
public class PicResources {
	
	static private var elementCount:int = 0;
	
	static public const DIRT_ID:int = elementCount++;
	
	static public const BANKSTER_ID:int = elementCount++;
	
	static public const ENEMY_MONEY_BAR_ID:int = elementCount++;
	static public const ENEMY_MONEY_BORDER_ID:int = elementCount++;
	
	static public const ENEMY_COMONER_ID:int = elementCount++;
	static public const ENEMY_ANGRY_COMONER_ID:int = elementCount++;
	static public const ENEMY_OCCUPYER_ID:int = elementCount++;
	
	static public const BEGGER_ID:int = elementCount++;
	static public const RIVAL_ID:int = elementCount++;
	
	static private var instance:PicResources;
	static private var textureCash:Dictionary = new Dictionary();
	
	/** Embed Image */
	[Embed(source="/pics/grass.png",mimeType="image/png")]
	static private var DirtClass:Class;
	
	[Embed(source="/pics/bankster.png",mimeType="image/png")]
	static private var BanksterClass:Class;
	
	[Embed(source="/pics/middleClass.png",mimeType="image/png")]
	static private var MiddleClsClass:Class;
	
	[Embed(source="/pics/angry.png",mimeType="image/png")]
	static private var AngryMidleClsClass:Class;
	
	[Embed(source="/pics/occupy.png",mimeType="image/png")]
	static private var OccupyClass:Class;
	
	[Embed(source="/pics/begger.png",mimeType="image/png")]
	static private var BeggerClass:Class;
	
	[Embed(source="/pics/rivalBanker.png",mimeType="image/png")]
	static private var RivalBankerClass:Class;
	
	static public function getTexture(id:int):Texture {
		if (!instance) {
			instance = new PicResources();
		}
		if (!textureCash[id]) {
			// generate texture
			switch (id) {
				//case ENEMY_COMONER_ID: 
				//textureCash[id] = EasyTextureGenerator.rectangle(64, 64, 0xFFFF00, -1, 0);
				//break;
				//case ENEMY_ANGRY_COMONER_ID: 
				//textureCash[id] = EasyTextureGenerator.rectangle(64, 64, 0xFF8000, -1, 0);
				//break;
				//case ENEMY_OCCUPYER_ID: 
				//textureCash[id] = EasyTextureGenerator.rectangle(64, 64, 0xFF0000, -1, 0);
				//break;
				
				case ENEMY_MONEY_BAR_ID: 
					textureCash[id] = EasyTextureGenerator.rectangle(50, 10, 0xFFD700, -1, 0);
					break;
				case ENEMY_MONEY_BORDER_ID: 
					textureCash[id] = EasyTextureGenerator.rectangle(50, 10, -1, 0xFFFFFF, 2);
					break;
				default: 
			}
			// use picture
			if (!textureCash[id]) {
				textureCash[id] = Texture.fromBitmap(instance.getPicture(id));
				if (!textureCash[id]) {
					throw Error("Resource is not mapped.. :" + id);
				}
				
			}
		}
		return textureCash[id];
	}
	
	public function getPicture(id:int):Bitmap {
		var pic:Bitmap;
		switch (id) {
			case DIRT_ID: 
				pic = new DirtClass();
				break;
			case BANKSTER_ID: 
				pic = new BanksterClass();
				break;
			case ENEMY_COMONER_ID: 
				pic = new MiddleClsClass();
				break;
			case ENEMY_ANGRY_COMONER_ID: 
				pic = new AngryMidleClsClass();
				break;
			case ENEMY_OCCUPYER_ID: 
				pic = new OccupyClass();
				break;
			case BEGGER_ID: 
				pic = new BeggerClass();
				break;
			case RIVAL_ID: 
				pic = new RivalBankerClass();
				break;
			default: 
		}
		return pic;
	}
}
}