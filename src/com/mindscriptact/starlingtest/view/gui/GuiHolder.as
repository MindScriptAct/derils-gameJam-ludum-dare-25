package com.mindscriptact.starlingtest.view.gui {
import com.mindscriptact.starlingtest.constants.GameConstants;
import flash.display.Shape;
import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;
import flash.text.TextFormatAlign;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class GuiHolder extends Sprite {
	
	private var bankProgressBar:Shape;
	private var bankProgressDone:Shape;
	
	private var bankText:TextField;
	private var cashText:TextField;
	private var cashNeedAmmount:Shape;
	private var capitalistFarmat24:TextFormat;
	private var stageText:TextField;
	private var capitalistFarmat24_left:TextFormat;
	private var capitalistFarmat10:TextFormat;
	private var capitalistFarmat36:TextFormat;
	private var totalCashText:TextField;
	public var nextStageLabel:TextField;
	;
	
	public function GuiHolder() {
		
		this.mouseChildren = false;
		this.mouseEnabled = false;
		
		capitalistFarmat24 = new TextFormat('myBoldVerdana', 24, 0xFFFFFF, true, null, null, null, null, TextFormatAlign.CENTER);
		capitalistFarmat24_left = new TextFormat('myBoldVerdana', 24, 0xFFFFFF, true, null, null, null, null, TextFormatAlign.LEFT);
		capitalistFarmat10 = new TextFormat('myBoldVerdana', 14, 0x0000FF, true, null, null, null, null, TextFormatAlign.CENTER);
		capitalistFarmat36 = new TextFormat('myBoldVerdana', 36, 0xFFFFFF, true, null, null, null, null, TextFormatAlign.LEFT);
		
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
		
		bankText = new TextField();
		this.addChild(bankText);
		bankText.text = "Press [SPACE] to bank!";
		bankText.embedFonts = true;
		bankText.mouseEnabled = false;
		
		bankText.x = bankProgressDone.x;
		bankText.y = bankProgressDone.y;
		bankText.width = bankProgressDone.width;
		bankText.height = bankProgressDone.height;
		bankText.visible = false;
		
		bankText.setTextFormat(capitalistFarmat10);
		
		//----------------------------------
		//     cash
		//----------------------------------
		
		var cashLabel:TextField = new TextField();
		this.addChild(cashLabel);
		cashLabel.text = "Cash:";
		cashLabel.autoSize = TextFieldAutoSize.RIGHT;
		cashLabel.embedFonts = true;
		cashLabel.mouseEnabled = false;
		cashLabel.x = 600 - 70;
		cashLabel.y = 8;
		
		cashLabel.setTextFormat(capitalistFarmat24);
		//
		
		cashNeedAmmount = new Shape();
		cashNeedAmmount.graphics.beginFill(0xFF8000);
		//cashNeedAmmount.graphics.lineStyle(0.1, 0xC0C0C0);
		cashNeedAmmount.graphics.drawRect(0, 0, 200, 40);
		cashNeedAmmount.graphics.endFill();
		this.addChild(cashNeedAmmount);
		cashNeedAmmount.x = 610 - 70;
		cashNeedAmmount.y = 5
		
		var cashNeedAmmountBorder:Shape = new Shape();
		//cashNeedAmmount.graphics.beginFill(0xFF8000);
		cashNeedAmmountBorder.graphics.lineStyle(0.1, 0xC0C0C0);
		cashNeedAmmountBorder.graphics.drawRect(0, 0, 200, 40);
		//cashNeedAmmountBorder.graphics.endFill();
		this.addChild(cashNeedAmmountBorder);
		cashNeedAmmountBorder.x = 610 - 70;
		cashNeedAmmountBorder.y = 5
		
		cashText = new TextField();
		this.addChild(cashText);
		cashText.text = "0 $";
		cashText.embedFonts = true;
		cashText.mouseEnabled = false;
		cashText.x = 610 - 70;
		cashText.y = 8;
		cashText.width = 200;
		
		cashText.setTextFormat(capitalistFarmat24);
		
		//----------------------------------
		//     stage
		//----------------------------------
		
		var stageLabel:TextField = new TextField();
		this.addChild(stageLabel);
		stageLabel.text = "Stage:";
		stageLabel.autoSize = TextFieldAutoSize.RIGHT;
		stageLabel.embedFonts = true;
		stageLabel.mouseEnabled = false;
		stageLabel.x = 300 - 30;
		stageLabel.y = 8;
		
		stageLabel.setTextFormat(capitalistFarmat24);
		
		stageText = new TextField();
		this.addChild(stageText);
		stageText.text = "0";
		stageText.embedFonts = true;
		stageText.mouseEnabled = false;
		stageText.x = 310 - 30;
		stageText.y = 8;
		stageText.width = 200;
		
		stageText.setTextFormat(capitalistFarmat24_left);
		
		//----------------------------------
		//     ENTER to advance next stage
		//----------------------------------
		
		nextStageLabel = new TextField();
		this.addChild(nextStageLabel);
		nextStageLabel.text = "Press [ENTER] to go to next stage!";
		nextStageLabel.autoSize = TextFieldAutoSize.LEFT;
		nextStageLabel.embedFonts = true;
		nextStageLabel.mouseEnabled = false;
		nextStageLabel.x = GameConstants.GAME_WIDTH / 2 - 300
		nextStageLabel.y = 200;
		nextStageLabel.alpha = 0.9;
		nextStageLabel.visible = false;
		nextStageLabel.setTextFormat(capitalistFarmat36);
		
		//----------------------------------
		//     tatal score
		//----------------------------------
		
		var totalCashLabel:TextField = new TextField();
		this.addChild(totalCashLabel);
		totalCashLabel.text = "Scored:";
		totalCashLabel.autoSize = TextFieldAutoSize.RIGHT;
		totalCashLabel.embedFonts = true;
		totalCashLabel.mouseEnabled = false;
		totalCashLabel.x = 1030;
		totalCashLabel.y = 8;
		
		totalCashLabel.setTextFormat(capitalistFarmat24);
		
		totalCashText = new TextField();
		this.addChild(totalCashText);
		totalCashText.text = "0 $";
		totalCashText.embedFonts = true;
		totalCashText.mouseEnabled = false;
		totalCashText.x = 1040;
		totalCashText.y = 8;
		totalCashText.width = 200;
		
		totalCashText.setTextFormat(capitalistFarmat24_left);
	}
	
	// TODO do this with messages...
	public function shawBankProgress(progress:Number):void {
		bankProgressBar.visible = true;
		bankProgressBar.scaleX = progress;
		bankProgressDone.visible = false;
		bankText.visible = false;
	}
	
	public function showProgressDone():void {
		bankProgressBar.visible = false;
		bankProgressDone.visible = true;
		bankText.visible = true;
	}
	
	public function showMoney(money:int, neededMoney:int):void {
		cashText.text = "" + money + " $";
		cashText.setTextFormat(capitalistFarmat24);
		//
		cashNeedAmmount.scaleX = money / neededMoney;
	}
	
	public function showStage(stageId:int):void {
		stageText.text = "" + (stageId + 1);
		stageText.setTextFormat(capitalistFarmat24_left);
	}
	
	public function shawScoredMoney(totalScore:int):void {
		totalCashText.text = "" + totalScore + " $";
		totalCashText.setTextFormat(capitalistFarmat24_left);
	}

}
}