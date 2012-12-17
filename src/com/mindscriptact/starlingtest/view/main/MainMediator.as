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
import flash.events.MouseEvent;
import flash.media.SoundMixer;
import flash.media.SoundTransform;
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
	private var soundControll:SoundControllsMC;
	private var currentPosition:int = 2;
	
	[Inject]
	public var view:Main;
	
	//[Inject]
	//public var myProxy:MyProxy;
	
	override public function onRegister():void {
		
		soundControll = new SoundControllsMC();
		view.addChild(soundControll);
		soundControll.x = 1190;
		setSound(currentPosition);
		
		soundControll.sndBtn0.addEventListener(MouseEvent.CLICK, handleSetSound0);
		soundControll.sndBtn1.addEventListener(MouseEvent.CLICK, handleSetSound1);
		soundControll.sndBtn2.addEventListener(MouseEvent.CLICK, handleSetSound2);
		soundControll.sndBtn3.addEventListener(MouseEvent.CLICK, handleSetSound3);
		soundControll.sndBtn4.addEventListener(MouseEvent.CLICK, handleSetSound4);
		
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
		startScreen.soundControlls.gotoAndStop(currentPosition);
		
		startScreen.soundControlls.sndBtn0.addEventListener(MouseEvent.CLICK, handleSetSound0);
		startScreen.soundControlls.sndBtn1.addEventListener(MouseEvent.CLICK, handleSetSound1);
		startScreen.soundControlls.sndBtn2.addEventListener(MouseEvent.CLICK, handleSetSound2);
		startScreen.soundControlls.sndBtn3.addEventListener(MouseEvent.CLICK, handleSetSound3);
		startScreen.soundControlls.sndBtn4.addEventListener(MouseEvent.CLICK, handleSetSound4);
		
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
			
			startScreen.soundControlls.sndBtn0.removeEventListener(MouseEvent.CLICK, handleSetSound0);
			startScreen.soundControlls.sndBtn1.removeEventListener(MouseEvent.CLICK, handleSetSound1);
			startScreen.soundControlls.sndBtn2.removeEventListener(MouseEvent.CLICK, handleSetSound2);
			startScreen.soundControlls.sndBtn3.removeEventListener(MouseEvent.CLICK, handleSetSound3);
			startScreen.soundControlls.sndBtn4.removeEventListener(MouseEvent.CLICK, handleSetSound4);
			
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
	
	private function handleSetSound0(event:Event):void {
		setSound(1)
	}
	
	private function handleSetSound1(event:Event):void {
		setSound(2)
	}
	
	private function handleSetSound2(event:Event):void {
		setSound(3)
	}
	
	private function handleSetSound3(event:Event):void {
		setSound(4)
	}
	
	private function handleSetSound4(event:Event):void {
		setSound(5)
	}
	
	private function setSound(currentPosition:int):void {
		this.currentPosition = currentPosition;
		soundControll.gotoAndStop(currentPosition);
		if (startScreen) {
			startScreen.soundControlls.gotoAndStop(currentPosition);
		}
		var saundTransform:SoundTransform = SoundMixer.soundTransform;
		saundTransform.volume = (currentPosition - 1) * 0.5;
		SoundMixer.soundTransform = saundTransform;
	}

}
}