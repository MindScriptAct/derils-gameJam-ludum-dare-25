package com.mindscriptact.starlingtest.engine.tasks {
import com.mindscriptact.starlingtest.view.game.elements.BanksterImage;
import flash.geom.Point;
import org.mvcexpress.live.Task;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org)
 */
public class MoveViewElementTask extends Task {
	
	[Inject(name="bankster_Position")]
	public var curentPosition:Point;
	
	[Inject(name="bankster_component")]
	public var bankster:BanksterImage;
	
	override public function run():void {
		// put bankster to correct positio
		bankster.x = curentPosition.x;
		bankster.y = curentPosition.y;
	}

}
}