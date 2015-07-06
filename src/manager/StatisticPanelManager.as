package manager
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class StatisticPanelManager extends EventDispatcher
	{
		public function StatisticPanelManager(target:IEventDispatcher=null)
		{
			super(target);
		}
	}
}