在MacOS下将xls中学号列拷贝至文本文件后将产生的符号
可采用vim将的符号替换为回车
vim命令模式下敲入：
	:%s///g
键盘：
	:%s/Ctrl-v Ctrl-m/Ctrl-v Enter/g
