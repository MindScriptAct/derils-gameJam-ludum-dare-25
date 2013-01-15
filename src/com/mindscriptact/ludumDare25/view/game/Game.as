package com.mindscriptact.ludumDare25.view.game {
import starling.display.Quad;
import starling.display.Sprite;
import starling.events.Event;

/**
 * COMMENT
 * @author rBanevicius
 */
public class Game extends Sprite {
	
	public function Game() {
		addEventListener(Event.ADDED_TO_STAGE, handleAddedToStage);
	}
	
	private function handleAddedToStage(event:Event):void {
		removeEventListener(Event.ADDED_TO_STAGE, handleAddedToStage);
		
		
		
		//quadTest.scaleX = 5;
		//quadTest.scaleY = 5;
	}

}
}