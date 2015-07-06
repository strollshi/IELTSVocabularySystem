package manager
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class LoginManager extends EventDispatcher
	{
		public function LoginManager(target:IEventDispatcher=null)
		{
			super(target);
		}
	}
}