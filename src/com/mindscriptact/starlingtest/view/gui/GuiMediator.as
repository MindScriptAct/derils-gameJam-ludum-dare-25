package com.mindscriptact.starlingtest.view.gui{
import org.mvcexpress.mvc.Mediator;

/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class GuiMediator extends Mediator {
	
	[Inject]
	public var view:GuiHolder;
	
	//[Inject]
	//public var myProxy:MyProxy;
	
	override public function onRegister():void {
		processMap.provide(view, "gui_view");
	}
	
	override public function onRemove():void {
		
	}
	
}
}