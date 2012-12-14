package com.mindscriptact.starlingtest.view.game {
import org.mvcexpress.mvc.Mediator;
import starling.display.Quad;

/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (raima156@yahoo.com)
 */
public class GameMediator extends Mediator {
	
	[Inject]
	public var view:Game;
	
	//[Inject]
	//public var myProxy:MyProxy;
	
	override public function onRegister():void {
		var quadTest:Quad = new Quad(200, 200);
		quadTest.setVertexColor(0, 0x000000);
		quadTest.setVertexColor(1, 0x00FF00);
		quadTest.setVertexColor(2, 0xFF0000);
		quadTest.setVertexColor(3, 0x0000FF);
		view.addChild(quadTest);
	}
	
	override public function onRemove():void {
	
	}

}
}