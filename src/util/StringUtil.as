package util
{
	
	import flash.utils.ByteArray;
	
	import mx.utils.StringUtil;
	
	public class StringUtil
	{
		public function StringUtil()
		{
		}
		public static function getStringCut(words:String,maxSize:int,replace:String="..."):String{
			if(getStringBytesLength(words,"gb2312")<=maxSize*2){
				return words;
			}
			var strArr:Array=words.split("");
			var len:int=strArr.length;
			var reStr:String="";
			for(var i:int=0;i<len;i++){
				reStr+=strArr[i];
				if(getStringBytesLength(reStr,"gb2312")>=maxSize*2){
					return reStr.slice(0,-1)+"...";
				}
			}
			return reStr;
			/*var wordLen:int=getStringBytesLength(words,"gb2312");
			words.
			if(words.length>maxSize){
			var str:String=words.slice(0,maxSize);
			return str+replace;
			}else{
			return words;
			}*/
		}
		/**
		 * 获取字符串的字节数
		 * @param str
		 * @param charSet
		 * @return 
		 * 
		 */		
		public static function getStringBytesLength(str:String,charSet:String):int  
		{  
			
			var bytes:ByteArray = new ByteArray();  
			
			bytes.writeMultiByte(str, charSet);  
			
			bytes.position = 0;  
			
			return bytes.length;  
			
		}  
		public static function getString(str:String,...vars):String{
			return mx.utils.StringUtil.substitute(str,vars);
		}
		
		/**
		 * 去掉字符串的空格 
		 * @param str
		 * @return 
		 * 
		 */		
		public static function trim(str:String):String
		{
			if (str == null) return '';
			
			var startIndex:int = 0;
			while (isWhitespace(str.charAt(startIndex)))
				++startIndex;
			
			var endIndex:int = str.length - 1;
			while (isWhitespace(str.charAt(endIndex)))
				--endIndex;
			
			if (endIndex >= startIndex)
				return str.slice(startIndex, endIndex + 1);
			else
				return "";
		}
		public static function isWhitespace(character:String):Boolean
		{
			switch (character)
			{
				case " ":
				case "\t":
				case "\r":
				case "\n":
				case "\f":
					return true;
					
				default:
					return false;
			}
		}
	}
}