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
	static public const ENEMY_MONEY_BAR_ID:int = elementCount++;
	static public const ENEMY_MONEY_BORDER_ID:int = elementCount++;
	
	static public const ENEMY_COMONER_ID:int = elementCount++;
	static public const ENEMY_OCCUPYER_ID:int = elementCount++;
	
	static private var instance:PicResources;
	static private var textureCash:Dictionary = new Dictionary();
	
	/** Embed Image */
	[Embed(source="/pics/dirt.png",mimeType="image/png")]
	static private var dirtClass:Class;
	
	static public function getTexture(id:int):Texture {
		if (!instance) {
			instance = new PicResources();
		}
		if (!textureCash[id]) {
			// generate texture
			switch (id) {
				case ENEMY_COMONER_ID: 
					textureCash[id] = EasyTextureGenerator.rectangle(64, 64, 0xFFFF00, -1, 0);
					break;
				case ENEMY_OCCUPYER_ID: 
					textureCash[id] = EasyTextureGenerator.rectangle(64, 64, 0xFF0000, -1, 0);
					break;
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
				pic = new dirtClass();
				break;
			default: 
		}
		return pic;
	}
}
}