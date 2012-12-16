package com.mindscriptact.starlingtest.controller.setup{
import com.mindscriptact.starlingtest.Main;
import com.mindscriptact.starlingtest.view.game.Game;
import com.mindscriptact.starlingtest.view.game.GameMediator;
import com.mindscriptact.starlingtest.view.gui.GuiHolder;
import com.mindscriptact.starlingtest.view.gui.GuiMediator;
import com.mindscriptact.starlingtest.view.main.MainMediator;
import com.mindscriptact.starlingtest.view.main.screens.GameOverScreen;
import com.mindscriptact.starlingtest.view.main.screens.GameOverScreenMediator;
import com.mindscriptact.starlingtest.view.main.screens.StartScreen;
import com.mindscriptact.starlingtest.view.main.screens.StartScreenMediator;
import com.mindscriptact.starlingtest.view.starling.StarlingMediator;
import org.mvcexpress.mvc.Command;
import starling.core.Starling;
	
/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class SetUpViewCommand extends Command {
	
	
	public function execute(blank:Object):void {
		
		
		Starling, StarlingMediator;
		
		mediatorMap.map(Main, MainMediator);
		mediatorMap.map(StartScreenSPR, StartScreenMediator);
		mediatorMap.map(GameOverScreenSPR, GameOverScreenMediator);
		
		mediatorMap.map(Game, GameMediator);
		
		mediatorMap.map(GuiHolder, GuiMediator);
		
		
		
	}
	
}
}