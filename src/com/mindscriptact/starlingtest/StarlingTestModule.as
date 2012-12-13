package com.mindscriptact.starlingtest {
import org.mvcexpress.modules.ModuleCore;

/**
 * COMMENT : todo
 * @author rBanevicius
 */
public class StarlingTestModule extends ModuleCore {
	
	static public const NAME:String = "StarlingTestModule";
	
	public function StarlingTestModule() {
		super(StarlingTestModule.NAME);
	}
	
	override protected function onInit():void {
	
	}
	
	public function start(main:Main):void {
		trace("StarlingTestModule.start > main : " + main);
	
	}
	
	override protected function onDispose():void {
	
	}

}
}