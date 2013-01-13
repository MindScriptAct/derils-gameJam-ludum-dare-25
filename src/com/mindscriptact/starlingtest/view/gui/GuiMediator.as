package com.mindscriptact.starlingtest.view.gui {
import com.mindscriptact.starlingtest.messages.DataMessage;
import com.mindscriptact.starlingtest.messages.Message;
import com.mindscriptact.starlingtest.model.gui.GuiProxy;
import org.mvcexpress.mvc.Mediator;

/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class GuiMediator extends Mediator {
	
	[Inject]
	public var view:GuiHolder;
	
	[Inject]
	public var guiProxy:GuiProxy;
	
	override public function onRegister():void {
		provide(view, "gui_view");
		
		addHandler(DataMessage.MONEY_CHANGED, handleMoneyChange);
		addHandler(DataMessage.SCORED_MONEY_CHANGED, handleScoredMoneyChange);
		addHandler(DataMessage.GUI_STAGE_CHANGED, handleStageChange);
		
		addHandler(Message.SHOW_STAGE_DONE, handleShowStageDone);
		addHandler(Message.HIDE_STAGE_DONE, handleHideStageDone);
	}
	
	private function handleScoredMoneyChange(blank:Object):void {
		view.shawScoredMoney(guiProxy.getTotalScore());
	}
	
	private function handleHideStageDone(blank:Object):void {
		view.nextStageLabel.visible = false;
	}
	
	private function handleShowStageDone(blank:Object):void {
		view.nextStageLabel.visible = true;
	}
	
	override public function onRemove():void {
	
	}
	
	private function handleMoneyChange(blank:Object):void {
		view.showMoney(guiProxy.getMoney(), guiProxy.getNeededMoney());
	}
	
	private function handleStageChange(stageId:int):void {
		view.showStage(stageId);
	}
}
}