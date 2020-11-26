/*
 * @Author: your name
 * @Date: 2020-07-14 11:21:37
 * @LastEditTime: 2020-11-17 20:57:21
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \mockserver\src\routes\api\index.js
 */
import KoaRouter from 'koa-router'


const router = new KoaRouter()
router.use('/project', require('./project'));
router.use('/catalog', require('./catalog'));
router.use('/api', require('./api'));
router.use('/common', require('./common'));
router.use('/user', require('./user'));
router.use('/temp', require('./temp'));
router.use('/mena', require('./mena'));
module.exports = router.routes();