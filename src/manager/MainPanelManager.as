package manager
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class MainPanelManager extends EventDispatcher
	{
		public function MainPanelManager(target:IEventDispatcher=null)
		{
			super(target);
		}
	}
}