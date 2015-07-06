package manager
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class UIController extends EventDispatcher
	{
		public function UIController(target:IEventDispatcher=null)
		{
			super(target);
		}
	}
}