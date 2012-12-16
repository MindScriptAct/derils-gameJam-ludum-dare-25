package com.mindscriptact.starlingtest.view.gui {
import com.mindscriptact.starlingtest.messages.DataMessage;
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
		processMap.provide(view, "gui_view");
		
		addHandler(DataMessage.MONEY_CHANGED, handleMoneyChange);
		addHandler(DataMessage.GUI_STAGE_CHANGED, handleStageChange);
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