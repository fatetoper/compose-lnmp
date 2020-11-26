/*
 * @Author: your name
 * @Date: 2020-07-14 11:21:37
 * @LastEditTime: 2020-11-19 23:28:47
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \mockserver\src\routes\index.js
 */
import KoaRouter from 'koa-router'
import controllers from '../controllers'
import url from 'url'
import {
	util
} from '../tool'
const router = new KoaRouter()
const staticConfig = require('./static');

// 请求接口校验中间件
console.log('controllers:', 'router works')
const checkfn = controllers.common.checkRequestUrl;
const userLogin = controllers.common.checkIsUserLogin;

router.post('/auth/2step-code', async ctx=>{
  ctx.body='2333';
})

router.use('/api', require('./api'));
router.use('/mock', require('./mock'));
staticConfig(router);

/*---------------------------------------处理所有接口---------------------------------------------*/
// 所有请求返回
// router.all('*', async function(ctx) {
// 	let arr = ctx.request.url.split('/');
// 	let projectName = arr[1];
// 	let apiUrl = arr.slice(2).join('/');
// 	let apiParam = apiUrl.split('?').slice(1)
// 		  apiUrl = apiUrl.split('?')[0];
// 	//controllers的结构不对
// 	//需要考虑404
// 	let result = await controllers.api.getAllApiForProName(ctx, projectName,apiUrl);
// 			result = result[0]
// 	// res需要是mock表达式
// 	console.log('router.all:',apiUrl)
// 	let res = result.restype===1?JSON.parse(result.response):result.response
// 	// 解析res得到数据resultStr
// 	let resultStr
// 	ctx.body = util.result({
// 		data: resultStr
// 	});
// })

// console.log('router==>', router)
module.exports = router