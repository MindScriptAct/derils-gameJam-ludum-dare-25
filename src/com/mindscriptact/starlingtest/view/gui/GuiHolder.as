package com.mindscriptact.starlingtest.view.gui {
import com.mindscriptact.starlingtest.constants.GameConstants;
import flash.display.Shape;
import flash.display.Sprite;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class GuiHolder extends Sprite {
	
	private var bankProgressBar:Shape;
	private var bankProgressDone:Shape;
	
	public function GuiHolder() {
		
		//var bankProgressBg:Shape = new Shape();
		//bankProgressBg.graphics.beginFill(0xFFFFFF, 0.1);
		//bankProgressBg.graphics.drawRect(0, 0, 200, 20);
		//bankProgressBg.graphics.endFill();
		//this.addChild(bankProgressBg);
		//bankProgressBg.x = Math.floor(GameConstants.GAME_WIDTH / 2 - bankProgressBg.width / 2);
		//bankProgressBg.y = GameConstants.GAME_HEIGHT - 50;
		//
		
		
		bankProgressBar = new Shape();
		bankProgressBar.graphics.beginFill(0xFF8000, 0.6);
		bankProgressBar.graphics.drawRect(-100, 0, 200, 20);
		bankProgressBar.graphics.endFill();
		this.addChild(bankProgressBar);
		bankProgressBar.x = Math.floor(GameConstants.GAME_WIDTH / 2 - bankProgressBar.width / 2) + 100;
		bankProgressBar.y = GameConstants.GAME_HEIGHT - 50;		
		bankProgressBar.visible = false;
		
		
		
		bankProgressDone = new Shape();
		bankProgressDone.graphics.beginFill(0x28FF28);
		bankProgressDone.graphics.drawRect(0, 0, 200, 20);
		bankProgressDone.graphics.endFill();
		this.addChild(bankProgressDone);
		bankProgressDone.x = Math.floor(GameConstants.GAME_WIDTH / 2 - bankProgressDone.width / 2);
		bankProgressDone.y = GameConstants.GAME_HEIGHT - 50;		
		bankProgressDone.visible = false;
		
		
		var bankProgressBorder:Shape = new Shape();
		bankProgressBorder.graphics.lineStyle(0.1, 0xC0C0C0);
		bankProgressBorder.graphics.drawRect(0, 0, 200, 20);
		this.addChild(bankProgressBorder);
		bankProgressBorder.x = Math.floor(GameConstants.GAME_WIDTH / 2 - bankProgressBorder.width / 2);
		bankProgressBorder.y = GameConstants.GAME_HEIGHT - 50;		
		
	}
	
	
	// TODO do this with messages...
	public function shawBankProgress(progress:Number):void {
		bankProgressBar.visible = true;
		bankProgressBar.scaleX = progress;
		
		bankProgressDone.visible = false;
	}
	
	public function showProgressDone():void {
		bankProgressBar.visible = false;
		bankProgressDone.visible = true;
	}
	
	
	
	

}
}