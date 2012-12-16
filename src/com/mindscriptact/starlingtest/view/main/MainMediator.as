package com.mindscriptact.starlingtest.view.main {
import com.bit101.components.HUISlider;
import com.bit101.components.PushButton;
import com.greensock.TweenMax;
import com.mindscriptact.starlingtest.constants.GameScreens;
import com.mindscriptact.starlingtest.Main;
import com.mindscriptact.starlingtest.messages.DataMessage;
import com.mindscriptact.starlingtest.messages.Message;
import com.mindscriptact.starlingtest.view.gui.GuiHolder;
import com.mindscriptact.starlingtest.view.main.screens.GameOverScreen;
import com.mindscriptact.starlingtest.view.main.screens.StartScreen;
import flash.events.Event;
import org.mvcexpress.mvc.Mediator;

/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class MainMediator extends Mediator {
	private var antialiasing:HUISlider;
	private var startScreen:StartScreen;
	private var gameOverScreen:GameOverScreen;
	
	[Inject]
	public var view:Main;
	
	//[Inject]
	//public var myProxy:MyProxy;
	
	override public function onRegister():void {
		
		var guiHolder:GuiHolder = new GuiHolder();
		view.addChild(guiHolder);
		
		mediatorMap.mediate(guiHolder);
		
		addStartScreen();
		
		addHandler(DataMessage.GUI_SCREEN_CHANGED, handleScreenChange);
		
		CONFIG::debug {
			antialiasing = new HUISlider(view, 1300, 550, "Antialiasing", handleValueChange);
			antialiasing.value = 1;
			antialiasing.minimum = 0;
			antialiasing.maximum = 16;
			antialiasing.labelPrecision = 0;
			
			var startButton:PushButton = new PushButton(view, 1300, 580, "START", handleStartGame);
			var addCommanButton:PushButton = new PushButton(view, 1400, 580, "ADD COMMONER", handleAddCommoner);
		}
	
	}
	
	public function handleScreenChange(screenId:String):void {
		removeStartScreen();
		removeGameOverScreen();
		
		if (screenId == GameScreens.START_SCREEN) {
			addStartScreen();
		} else if (screenId == GameScreens.GAMEOVER_SCREEN) {
			addGameOverScreen()
		}
	}
	
	private function addStartScreen():void {
		startScreen = new StartScreen();
		view.addChild(startScreen);
		mediatorMap.mediate(startScreen);
	}
	
	private function addGameOverScreen():void {
		gameOverScreen = new GameOverScreen();
		view.addChild(gameOverScreen);
		mediatorMap.mediate(gameOverScreen);
		gameOverScreen.alpha = 0;
		TweenMax.to(gameOverScreen, 3, {alpha: 1});
	}
	
	private function removeStartScreen():void {
		if (startScreen) {
			view.removeChild(startScreen);
			mediatorMap.unmediate(startScreen);
			startScreen = null;
		}
	}
	
	private function removeGameOverScreen():void {
		if (gameOverScreen) {
			view.removeChild(gameOverScreen);
			mediatorMap.unmediate(gameOverScreen);
			gameOverScreen = null;
		}
	}
	
	public function handleAddCommoner(event:Event):void {
		sendMessage(Message.ADD_COMMONER, 1);
	}
	
	private function handleStartGame(event:Event):void {
		sendMessage(Message.START_GAME);
	}
	
	private function handleValueChange(event:Event):void {
		//trace("StarlingTestModule.handleValueChange > event : " + event, antialiasing.value);
		sendMessage(Message.STARLING_ANTIALIASING_CHANGE, Math.floor(antialiasing.value));
	}
	
	override public function onRemove():void {
	
	}

}
}