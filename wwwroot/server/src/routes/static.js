/*
 * @Author: your name
 * @Date: 2020-11-15 14:34:35
 * @LastEditTime: 2020-11-15 15:30:23
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \mockserver\src\routes\static.js
 */
const staticConfig=require('koa-static');
const {STATIC}=require('../config');

module.exports=function (router){
  //图片
  router.all(/\.(jpg|png|gif|tiff|ico)$/i, staticConfig(STATIC.PATH, {
    maxage: 20*86400*1000
  }));
  //js
  router.all(/\.jsx?$/i, staticConfig(STATIC.PATH, {
    maxage: 3*86400*1000
  }));
  //css
  router.all(/\.css$/i, staticConfig(STATIC.PATH, {
    maxage: 7*86400*1000
  }));
  //网页
  router.all(/\.(html|htm|shtml)$/i, staticConfig(STATIC.PATH, {
    maxage: 1*86400*1000
  }));

  router.all('*', staticConfig(STATIC.PATH, {
    maxage: 20*86400*1000
  }));

};
