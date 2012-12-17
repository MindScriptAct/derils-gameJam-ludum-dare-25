package com.mindscriptact.starlingtest.view.main {
import com.bit101.components.HUISlider;
import com.bit101.components.PushButton;
import com.greensock.TweenMax;
import com.mindscriptact.starlingtest.constants.GameScreens;
import com.mindscriptact.starlingtest.Main;
import com.mindscriptact.starlingtest.messages.DataMessage;
import com.mindscriptact.starlingtest.messages.Message;
import com.mindscriptact.starlingtest.messages.ViewMessage;
import com.mindscriptact.starlingtest.picLib.SoundLib;
import com.mindscriptact.starlingtest.view.gui.GuiHolder;
import flash.events.Event;
import org.mvcexpress.mvc.Mediator;

/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class MainMediator extends Mediator {
	private var antialiasing:HUISlider;
	private var startScreen:StartScreenSPR;
	private var gameOverScreen:GameOverScreenSPR;
	private var startSscreenFirstTime:Boolean = true;
	private var tutorialScreen:StartScreenMC;
	private var soundButton:PushButton;
	
	[Inject]
	public var view:Main;
	
	//[Inject]
	//public var myProxy:MyProxy;
	
	override public function onRegister():void {
		
		soundButton = new PushButton(view, 1220, 0, "SOUND:OFF", handleSoundOn);
		soundButton.width = 60;
		
		var guiHolder:GuiHolder = new GuiHolder();
		view.addChild(guiHolder);
		
		mediatorMap.mediate(guiHolder);
		
		addStartScreen();
		
		addHandler(DataMessage.GUI_SCREEN_CHANGED, handleScreenChange);
		
		addHandler(ViewMessage.START_TUTORIAL, handleStartTutorial);
		
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
	
	public function handleSoundOn(event:Event):void {
		if (SoundLib.enabled) {
			soundButton.label = "SOUND:ON";
		} else {
			soundButton.label = "SOUND:OFF";
		}
		SoundLib.enabled = !SoundLib.enabled;
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
		startScreen = new StartScreenSPR();
		view.addChild(startScreen);
		mediatorMap.mediate(startScreen);
		if (startSscreenFirstTime) {
			startSscreenFirstTime = false;
			tutorialScreen = new StartScreenMC();
			startScreen.tutorialPraleHolder.addChild(tutorialScreen);
		}
	}
	
	private function addGameOverScreen():void {
		gameOverScreen = new GameOverScreenSPR();
		view.addChild(gameOverScreen);
		mediatorMap.mediate(gameOverScreen);
		gameOverScreen.alpha = 0;
		TweenMax.to(gameOverScreen, 3, {alpha: 1});
	}
	
	private function removeStartScreen():void {
		if (startScreen) {
			if (tutorialScreen) {
				tutorialScreen.stop();
				startScreen.tutorialPraleHolder.removeChild(tutorialScreen);
				tutorialScreen = null;
			}
			view.removeChild(startScreen);
			mediatorMap.unmediate(startScreen);
			startScreen = null;
		}
	}
	
	private function handleStartTutorial(blank:Object):void {
		if (startScreen) {
			if (tutorialScreen) {
				tutorialScreen.gotoAndPlay(1);
			} else {
				tutorialScreen = new StartScreenMC();
				startScreen.tutorialPraleHolder.addChild(tutorialScreen);
			}
			
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