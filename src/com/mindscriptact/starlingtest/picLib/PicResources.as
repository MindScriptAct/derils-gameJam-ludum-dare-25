package com.mindscriptact.starlingtest.picLib {
import flash.display.Bitmap;
import flash.utils.Dictionary;
import starling.textures.Texture;

/**
 * COMMENT
 * @author rBanevicius
 */
public class PicResources {
	
	static public const DIRT_ID:int = 1;
	
	static private var instance:PicResources;
	static private var textureCash:Dictionary = new Dictionary();
	
	/** Embed Image */
	[Embed(source="/pics/dirt.png",mimeType="image/png")]
	static private var dirtClass:Class;

	
	static public function getBitmap(id:int):Texture {
		if (!instance) {
			instance = new PicResources();
		}
		if (!textureCash[id]) {
			textureCash[id] = Texture.fromBitmap(instance.getPicture(id));
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