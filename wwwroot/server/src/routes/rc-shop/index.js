/*
 * @Author: your name
 * @Date: 2020-07-14 11:21:37
 * @LastEditTime: 2020-12-12 02:20:17
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \mockserver\src\routes\api\index.js
 */
import KoaRouter from 'koa-router'


const router = new KoaRouter()
router.use('/v1', require('./v1'));
module.exports = router.routes();