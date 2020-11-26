/*
 * @Author: your name
 * @Date: 2020-11-19 01:37:59
 * @LastEditTime: 2020-11-26 11:47:24
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \mockserver\src\config.js
 */
import path from 'path'

// 系统配置
export let SYSTEM = {
	//允许调用接口的域名，用来检测防盗链
	ORIGIN: '*',
	// HTTP服务器端口号
	PROT: 8080,
	// 分页条数
	PAGESIZE: 10,
	HOST: 'localhost',
	MD5_KEY: 'SDfdfg5aO*&$O%ohlkuIYIUOR$LUI$HR(&*FHULI$HRGSDLKJFHSDILUY$*OOY$IUHILUFH*O$&TIGRgrdrgd大概多少风格士大夫敢死队风格让他如果士大夫敢死队发)',
}

export let DB = {
	// 服务器地址
	HOST: 'mysql',
	// 数据库端口号     
	PROT: 3306,
	// 数据库用户名              
	USER: 'user',
	// 数据库密码    
	PASSWORD: 'root', 
	// 数据库名称    
	DATABASE: 'mock_server',
	// 默认"api_"
	PREFIX: 'mock_'
}

export let NODEMAILER = {
	// SMTP服务提供商域名
	HOST: '163',
	// 用户名/用户邮箱
	USER: 'xxx@163.com',
	// 邮箱密码
	PASSWORD: '132456',
}

export let REDIS = {
	HOST: 'redis',
	PORT: 6379,
	PASS: '',
}

export let UPLOAD = {
	DIR: path.resolve(__dirname, 'static'),
	TMP: path.resolve(__dirname, 'static\\tmp'),  
}

export let SESSION = {
	MAXAGE: 86400*1000,
	key_count: 1024,
	key_len: 1024,
	key_path: path.resolve(__dirname, '.keys'),
	token_len: 32,
}

export let STATIC = {
	PATH: path.resolve(__dirname, 'static'),
}

export let ERRORS = {
	404: path.resolve(__dirname, 'errors/404.html'),
	500: path.resolve(__dirname, 'errors/500.html'),
}

export let token_len = 64