# APPInternalShareClasses
#### 背景
	1. 遇到许多工程师缺少比较规范化的使用FMDB、ASIRequest、公共宏定义处理、类别使用等。
	2. APP内部，许多地方会用到这些公共类。
	3. 尤其是FMDB与ASIRequest使用的很糟糕。  
	4. 分层模式，属于数据访问层的封装。
	
#### 说明
	1. APP Internal Share Classes,包含了FMDB，ASIRequest框架。
	2. 你可以将APP内部公用功能类、宏定义、Model等放到对应的目录下。
	3. 这份文档更大的意义是：指导性作用。

## HttpManager(ASIRequest包装)
	1. 以HTTP网络请求为例，采用面向接口的方式，设计了网络请求层public api。
	2. 开发者只需要按照登陆示例方式，新增协议方法，新增发送网络请求方法、完成与失败方法。
	3. 使用者只需要：
		3.1. 查看在HttpManagerProtocol.h相关接口说明。
		3.2. VC类 conform HttpManagerProtocol协议，并实现感兴趣的方法。
		3.3. VC类发送网络请求
			 [[HttpManager sharedManager] sendLoginHttpRequest:vc requestParam:param callbackParam:callbackParam];
	4. 接口方法将model或者错误信息返回给vc，用于进一步处理。
	
	总结：
		优势：
			各个vc只需要实现自己感兴趣的协议方法。
			消息返回，只会返回给源消息发送者。（这个借鉴了target-action模式）
			消息的发送与返回，逻辑清晰。
			逻辑层与数据访问层均是面向接口设计实现自己的功能，相互
			
		劣势：
			需要新增比较多的协议方法。

## DBManager(FMDB包装)
	1. 这个类并没有真的创建（当前）。
	2. DBManager可以是一个（个人认为应该最好是）APP singleton，处理多线程问题。
	3. 对于多进程间数据库访问问题，可以考虑采用其他方式解决。
  
