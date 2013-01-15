package com.mindscriptact.ludumDare25.picLib {
import flash.media.SoundMixer;
import flash.media.SoundTransform;
import flash.utils.Dictionary;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class SoundLib {
	
	static public const FX1:String = "fx1";
	static public const FX2:String = "fx2";
	static public const FX3:String = "fx3";
	static public const FX4:String = "fx4";
	static public const FX5:String = "fx5";
	
	static public const FINISH1:String = "finish1";
	static public const FINISH2:String = "finish2";
	static public const FINISH3:String = "finish3";
	static public const FINISH4:String = "finish4";
	
	static public var enabled:Boolean = true;
	
	static private var instance:SoundLib;
	
	public var soundLib:Dictionary = new Dictionary();
	
	public function SoundLib() {
		soundLib[SoundLib.FX1] = new ef1wav();
		soundLib[SoundLib.FX2] = new ef2wav();
		soundLib[SoundLib.FX3] = new ef3wav();
		soundLib[SoundLib.FX4] = new ef4wav();
		soundLib[SoundLib.FX5] = new ef5wav();
		
		soundLib[SoundLib.FINISH1] = new finish1wav();
		soundLib[SoundLib.FINISH2] = new finish2wav();
		soundLib[SoundLib.FINISH3] = new finish3wav();
		soundLib[SoundLib.FINISH4] = new finish4wav();
	}
	
	static public function getInstance():SoundLib {
		if (!instance) {
			instance = new SoundLib();
		}
		return instance;
	}
	
	// TODO : FIX>>>!!!
	
	static public function playRandomeEfect():void {
		if (SoundLib.enabled) {
			var index:int = Math.floor(Math.random() * 5);
			switch (index) {
				case 0: 
					instance.soundLib[SoundLib.FX1].play();
					break;
				case 1: 
					instance.soundLib[SoundLib.FX2].play();
					break;
				case 2: 
					instance.soundLib[SoundLib.FX3].play();
					break;
				case 3: 
					instance.soundLib[SoundLib.FX4].play();
					break;
				case 4: 
					instance.soundLib[SoundLib.FX5].play();
					break;
				default: 
			}
		}
	}
	
	static public function playRandomeFinisher():void {
		if (SoundLib.enabled) {
			var index:int = Math.floor(Math.random() * 4);
			switch (index) {
				case 0: 
					instance.soundLib[SoundLib.FINISH1].play();
					break;
				case 1: 
					instance.soundLib[SoundLib.FINISH2].play();
					break;
				case 2: 
					instance.soundLib[SoundLib.FINISH3].play();
					break;
				case 3: 
					instance.soundLib[SoundLib.FINISH4].play();
					break;
				default: 
			}
		}
	}
}
}