package com.util
{	
	
	import flash.display.LoaderInfo;
	import flash.errors.IOError;
	import flash.events.NetStatusEvent;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.net.SharedObject;
	import flash.net.SharedObjectFlushStatus;
	import flash.utils.ByteArray;

	/**
	 *SharedObject 本地缓存类，按存储格存储数据
	 * @author eric.yin
	 * 
	 */	
	public class LocalCache
	{
		private var mySo:SharedObject;
		private static var _instance:LocalCache;
		private var refused:Boolean;

		private var flushStatus:String;
		public static var Size:int=1000000;
		public function LocalCache()
		{
			try
			{
				mySo = SharedObject.getLocal("Cache1002", "/");
			} 
			catch(error:Error) 
			{
				trace("Cache1002->  ", error.getStackTrace());
			}
						
			//mySo.clear();
			
			refused=false;
		}
		/**
		 *获取单例 
		 * @return LocalCache
		 * 
		 */		
		public static function getInstance():LocalCache
		{
			if(!_instance){
				_instance=new LocalCache;
			}
			return _instance;
		}
		/**
		 * 
		 * @param nodeName 存储格名
		 * @param obj 数据对象
		 * 
		 */		
		public function saveData(nodeName:String,obj:Object):void{
			if(refused) return;
			mySo.data[nodeName]=obj;
			flushIn();

		}
		
		/**
		 *本地缓存资源 
		 * @param url 资源路径
		 * @param version 版本
		 * @param data 数据
		 * 
		 */		
		public function saveResourceByUrl(url:String,version:String,data:*=null):void{
			if(refused) return;
			if(checkResource(url,version)) return;
			if(data==null){
				delete mySo.data["resource_"+url];
				return;
			}
			if(data is LoaderInfo){
				var info:LoaderInfo=data as LoaderInfo;
				var bta:ByteArray=info.bytes;
				mySo.data["resource_"+url]=new Object;
				mySo.data["resource_"+url].data=bta;
				mySo.data["resource_"+url].version=version;
			}else if(data is ByteArray){
				mySo.data["resource_"+url]=new Object();
				mySo.data["resource_"+url].data=data;
				mySo.data["resource_"+url].version=version;
			}
			
			flushIn();
			//mySo.data["resourcecache"]
		}
		/**
		 *检查资源是否已经保存 
		 * @param url 资源路径
		 * @param version 资源版本
		 * @return 
		 * 
		 */		
		public function checkResource(url:String,version:String):Boolean{
			var resources:Object=mySo.data["resource_"+url];
			if(resources&&version==resources.version&&(resources.data is ByteArray)){
				return true;
			}else{
				return false;
			}
		}
		/**
		 *获取已保存的资源 
		 * @param url 资源路径
		 * @param version 资源版本
		 * @return 
		 * 
		 */		
		public function getResourceByUrl(url:String,version:String):ByteArray{
			if(checkResource(url,version)){
				var _version:String=mySo.data["resource_"+url].version;
				if(_version==version){
					var bta:ByteArray=mySo.data["resource_"+url].data;
					//BitmapUtil.toDisplayObject(bta,callBack);
					return bta;
				}
			}
			return null;
		}
		
		private function flushIn():void{
			if(refused||flushStatus==SharedObjectFlushStatus.PENDING) return;			
			try {
				flushStatus = mySo.flush(Size);
			} catch (error:Error) {
				trace(LocalCache,"Error...Could not write SharedObject to disk");				
			}
			if (flushStatus != null) {
				switch (flushStatus) {
					case SharedObjectFlushStatus.PENDING:
						//output.appendText("Requesting permission to save object...\n");
						mySo.addEventListener(NetStatusEvent.NET_STATUS, onFlushStatus);
						break;
					case SharedObjectFlushStatus.FLUSHED:
//						Logger.debug(LocalCache,"FLUSHED:"+mySo.size);
						refused=false;
						break;
				}
			}
		}
		
		
		protected function onFlushStatus(event:NetStatusEvent):void
		{
			// TODO Auto-generated method stub
			switch (event.info.code) {
				case "SharedObject.Flush.Success":
					trace(LocalCache,"FLUSHED Success:"+mySo.size);
					refused=false;
					break;
				case "SharedObject.Flush.Failed":
					trace(LocalCache,"User denied permission -- value not saved.");
					refused=true;
					break;
			}			
			mySo.removeEventListener(NetStatusEvent.NET_STATUS, onFlushStatus);
		}
		/**
		 *取数据 
		 * @param nodeName 存储格名
		 * @return 
		 * 
		 */		
		public function getData(nodeName:String):Object{
			//mySo.clear();
			return mySo.data[nodeName];
		}
		/**
		 *删除数据 
		 * @param nodeName 存储格名
		 * 
		 */		
		public function clear(nodeName:String):void{
			mySo.data[nodeName]=null;
			delete mySo.data[nodeName];
		}

	}
}