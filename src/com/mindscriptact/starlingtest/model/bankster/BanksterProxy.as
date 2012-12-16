package com.mindscriptact.starlingtest.model.bankster {
import flash.geom.Point;
import org.mvcexpress.mvc.Proxy;

/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class BanksterProxy extends Proxy {
	
	private var curentPosition:Point = new Point();
	
	public function BanksterProxy() {
	}
	
	override protected function onRegister():void {
		processMap.provide(curentPosition, "bankster_Position");
	}
	
	override protected function onRemove():void {
	
	}
	
	public function teleportBankster(xPos:int, yPos:int):void {
		curentPosition.x = xPos;
		curentPosition.y = yPos;
	}
	
	public function getCurrentPosition():Point {
		return new Point(curentPosition.x, curentPosition.y);
	}
}
}