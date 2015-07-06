package manager
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class EventCommander extends EventDispatcher
	{
		public function EventCommander(target:IEventDispatcher=null)
		{
			super(target);
		}
	}
}