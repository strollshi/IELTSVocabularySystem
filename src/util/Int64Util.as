package util
{
	import com.netease.protobuf.Int64;

	public class Int64Util
	{
		public function Int64Util()
		{
		}
		
		public static function isEqual(elem1:Int64, elem2:Int64):Boolean
		{
			return (String(elem1) == String(elem2));
		}
		
		public static function indexOfVector(array:Vector.<Int64>, elem:Int64):int
		{
			for (var i:int=0; i<array.length; i++)
			{
				if (String(array[i]) == String(elem))
				{
					return i;
				}
			}
			return -1;
		}
		
		public static function indexOfArray(array:Array, elem:Int64):int
		{
			for (var i:int=0; i<array.length; i++)
			{
				var temp:Int64 = array[i];
				if (String(temp) == String(elem))
				{
					return i;
				}
			}
			return -1;
		}
	}
}