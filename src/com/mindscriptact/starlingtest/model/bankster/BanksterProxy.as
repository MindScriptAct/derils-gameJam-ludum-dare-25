package com.mindscriptact.starlingtest.model.bankster {
import flash.geom.Point;
import org.mvcexpress.mvc.Proxy;

/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class BanksterProxy extends Proxy {
	
	[Provide(name="bankster_Position")]
	public var curentPosition:Point = new Point();
	
	public function BanksterProxy() {
	}
	
	override protected function onRegister():void {
	
	}
	
	override protected function onRemove():void {
	
	}
	
	public function teleportBankster(xPos:int, yPos:int):void {
		curentPosition.x = xPos;
		curentPosition.y = yPos;
	}
}
}