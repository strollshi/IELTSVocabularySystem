package data
{
	public class WordData
	{
		public static const SOUND_URL:String = "../sounds/";
		
		public var id:int;
		public var name:String;
		public var desc:String;//xxxxx@xxxx@xxxx
		public var mp3ID:String;//n@m@xxx
		
		public var isNoted:Boolean=false;
		public var isRemembered:Boolean=false;
		
		public var relatives:Vector.<WordData>;
		
		public function WordData()
		{
		}
	}
}