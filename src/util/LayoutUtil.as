
package util{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Stage;
	
	public class LayoutUtil {
		/**
		 * 垂直布局
		 * @param _parent 父容器
		 * @param _space 垂直间隔
		 * @param _x 第一个的位置
		 */		
		public static function layoutVectical(_parent:DisplayObjectContainer, _space:Number=0, _x:Number=0):void{
			var _displayObject:DisplayObject;
			if (!_parent){
				return;
			};
			var _local4:int = _parent.numChildren;
			if (_local4 == 0){
				return;
			};
			var _local5:int = _x;//第一个的座标。
			var _local6:int;
			while (_local6 < _local4) {//遍历
				_displayObject = _parent.getChildAt(_local6);
				_displayObject.y = _local5;
				_local5 = ((_displayObject.height + _displayObject.y) + _space);//_arg2   每个间的间隔。
				_local6++;
			};
		}
		/**
		 * 水平布局
		 * @param _parent 布局父容器
		 * @param _space 水平距离
		 * @param _x  第一个的x位置。。  
		 */		
		public static function layoutHorizontal(_parent:DisplayObjectContainer, _space:Number=0, _x:int=0):void{
			var _displayObject:DisplayObject;
			if (!_parent){
				return;
			};
			var _numChildren:int = _parent.numChildren;
			if (_numChildren == 0){
				return;
			};
			var _local5:int = _x;
			var _num:int;
			while (_num < _numChildren) {
				_displayObject = _parent.getChildAt(_num);
				_displayObject.x = _local5;
				_local5 = ((_displayObject.width + _displayObject.x) + _space);
				_num++;
			};
		}
		/**
		 * 格子布局
		 * @param _arg1 要布局的父容器
		 * @param _arg2 列数
		 * @param _arg3 X间的空隙
		 * @param _arg4 Y间的空隙
		 * 
		 */		
		public static function layoutGrid(_arg1:DisplayObjectContainer, _arg2:int, _arg3:Number, _arg4:Number):void{
			var _local6:int;//遍历用。
			var _display:DisplayObject;
			var _local8:int;
			var _local9:int;
			if (!_arg1){
				return;
			};
			var _local5:int = _arg1.numChildren;
			if (_local5 == 0){
				return;
			};
			while (_local6 < _local5) {
				_display = _arg1.getChildAt(_local6);
				_local8 = (_local6 / _arg2);//坚行
				_local9 = (_local6 % _arg2);//坚行多出来的。

				_display.x = ((_local9 * _display.width) + (_local9 * _arg3));
				_display.y = ((_local8 * _display.height) + (_local8 * _arg4));
				_local6++;
			};
		}
		
		/**
		 * 从右到左格子布局
		 * @param _arg1 要布局的父容器
		 * @param _arg2 列数
		 * @param _arg3 X间的空隙
		 * @param _arg4 Y间的空隙
		 * 
		 */		
		public static function layoutRightGrid(_arg1:DisplayObjectContainer, _arg2:int, _arg3:Number, _arg4:Number):void{
			var _local6:int;//历遍用。
			var _local7:DisplayObject;
			var _local8:int;
			var _local9:int;
			if (!_arg1){
				return;
			};
			var _local5:int = _arg1.numChildren;
			if (_local5 == 0){
				return;
			};
			var num:int=_arg2;
			while (_local6 < _local5) {
				_local7 = _arg1.getChildAt(_local6);
				_local8 = (_local6 / _arg2);//坚行
				num=num-1;
				_local9 =num ;//坚行多出来的。
				if(num==0)
				{
					num=_arg2;
				}
				_local7.x = ((_local9 * _local7.width) + (_local9 * _arg3));
				_local7.y = ((_local8 * _local7.height) + (_local8 * _arg4));
				_local6++;
			};
		}
		
		/**
		 * 右垂直排列格子布局
		 * @param _arg1 要布局的父容器
		 * @param _arg2 列数
		 * @param _arg3 X间的空隙
		 * @param _arg4 Y间的空隙
		 * 
		 */		
		public static function layoutRightVecticalGrid(_arg1:DisplayObjectContainer, _arg2:int, _arg3:Number, _arg4:Number):void{
			var _local6:int;//历遍用。
			var _local7:DisplayObject;
			var _local8:int;
			var _local9:int;
			if (!_arg1){
				return;
			};
			var _local5:int = _arg1.numChildren;
			if (_local5 == 0){
				return;
			};
			while (_local6 < _local5) {
				_local7 = _arg1.getChildAt(_local6);
				_local8 =(_local6 % _arg2);//坚行多出来的
				_local9 =  (_local6 / _arg2);//坚行
				_local7.x = ((_local9 * _local7.width) + (_local9 * _arg3));
				_local7.y = ((_local8 * _local7.height) + (_local8 * _arg4));
				_local6++;
			};
		}
		/**
		 *左垂直排列格子布局
		 * @param _arg1
		 * @param _arg2
		 * @param _arg3
		 * @param _arg4
		 * 
		 */		
		public static function layoutVecticalGrid(_arg1:DisplayObjectContainer, _arg2:int, _arg3:Number, _arg4:Number):void{
			var _local6:int;//历遍用。
			var _local7:DisplayObject;
			var _local8:int;
			var _local9:int;
			if (!_arg1){
				return;
			};
			var _local5:int = _arg1.numChildren;
			var _local4:int=_arg1.numChildren;
			if (_local5 == 0){
				return;
			};
			while (_local6 < _local5) {
				
				_local7 = _arg1.getChildAt(_local6);
 
				if(_local4 % _arg2==0)
				{
					_local8 = (_local4 / _arg2)-1;//坚行
				}else
				{
					_local8 = (_local4 / _arg2);
				}
				
				if(_local4 % _arg2==0)
				{
					_local9 = (_local4 % _arg2);
				}else if(_local4 % _arg2==1)
				{
					_local9 = (_local4 % _arg2)+1;
				}else 
				{
					_local9 = (_local4 % _arg2)-1;
				}
				_local7.x =((_local8 * _local7.width) + (_local8 * _arg4)) ;
				_local7.y =((_local9 * _local7.height) + (_local9 * _arg3)) ;
				_local6++;
				_local4--;
			
			};
		}
		/**
		 * 
		 * @param son
		 * @param parent  可以是stage
		 * @param XSign
		 * @param YSign
		 * 
		 */		
		public static function layoutMiddle(son:DisplayObjectContainer,parent:DisplayObjectContainer,XSign:Boolean=true,YSign:Boolean=true):void{
			if (!son||!parent){
				return;
			}
			var width:Number=parent.width;
			var height:Number=parent.height;
			if(parent is Stage){ 
				width= Stage(parent).stageWidth;
				height=Stage(parent).stageHeight;
			}
			if(XSign){
				son.x=(width-son.width)/2;
			}
			if(YSign){
				son.y=(parent.height-son.height)/2;
			}
		}
		
		/**
		 * 对数组元素进行  
		 * @param _displayObjetArray 需要布局的
		 * @param _space 水平距离
		 * @param _x  第一个的x位置。。  
		 */		
		public static function layoutArray(_displayObjetArray:Array,_spaceX:int=0,_spaceY:int=0, _x:int=0, _y:int=0):void{
			var _displayObject:DisplayObject;
			var _length:int = _displayObjetArray.length;
			if (_length == 0){
				return;
			};
			for(var i:int=0;i<_length;i++){
				_displayObject = _displayObjetArray[i];
				_displayObject.x = _x+ _spaceX*i;
				_displayObject.y = _y+ _spaceY*i;
			}
		}
		
		
	}
}
