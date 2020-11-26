/*
 * @Author: your name
 * @Date: 2020-07-14 11:21:37
 * @LastEditTime: 2020-11-17 18:49:25
 * @LastEditors: your name
 * @Description: In User Settings Edit
 * @FilePath: \mockserver\src\routes\mock\index.js
 */
import KoaRouter from 'koa-router'
const router = new KoaRouter()

router.use('/common', require('./common'));
router.use('/user', require('./user'));
router.use('/page', require('./page'));
// router.use('', require('./services'));

module.exports = router.routes();