package com.mindscriptact.ludumDare25.controller.setup {
import com.mindscriptact.ludumDare25.Main;
import com.mindscriptact.ludumDare25.view.game.Game;
import com.mindscriptact.ludumDare25.view.game.GameMediator;
import com.mindscriptact.ludumDare25.view.gui.GuiHolder;
import com.mindscriptact.ludumDare25.view.gui.GuiMediator;
import com.mindscriptact.ludumDare25.view.main.MainMediator;
import com.mindscriptact.ludumDare25.view.main.screens.GameOverScreenMediator;
import com.mindscriptact.ludumDare25.view.main.screens.StartScreenMediator;
import com.mindscriptact.ludumDare25.view.starling.StarlingMediator;
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