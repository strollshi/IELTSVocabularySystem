package util
{
    public class HtmlUtil {

        public static function fontBr(_arg1:String, _arg2:String, _arg3:int=12):String{
            return ((font(_arg1, _arg2, _arg3) + "\n"));
        }
        public static function font(_arg1:String, _arg2:String, _arg3:int=22,arg4:String = 'simhei'):String{
            return ((((((("<font color='" + _arg2) + "'face='" + arg4 + "' size='") + _arg3) + "'>") + _arg1) + "</font>"));
        }
        public static function font2(_arg1:String, _arg2:uint, _arg3:int=12):String{
            return (font(_arg1, ("#" + _arg2.toString(16))));
        }
        public static function font3(_arg1:String, _arg2:String):String{
            return ((((("<font color='" + _arg2) + "'>") + _arg1) + "</font>"));
        }
        public static function br(_arg1:String):String{
            return ((("<br>" + _arg1) + "</br>"));
        }
        public static function bold(_arg1:String):String{
            return ((("<b>" + _arg1) + "</b>"));
        }
        public static function link(_arg1:String, _arg2:String="", _arg3:Boolean=false):String{
            if (_arg3){
                return ((((("<u><a href='event:" + _arg2) + "'><FONT COLOR='#FFFFFF'>") + _arg1) + "</FONT></a></u>"));//下划线标签
            };
            return ((((("<a href='event:" + _arg2) + "'><FONT COLOR='#FFFFFF'>") + _arg1) + "</FONT></a>"));
        }
        public static function filterHtml(_arg1:String):String{
            var _local2:String = _arg1.replace(/\<\/?[^\<\>]+\>/gmi, "");
            return (_local2);
        }

    }
}//package com.utils
