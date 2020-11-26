/*
 * @Author: fatetoper
 * @Date: 2019-07-19 08:59:46
 * @LastEditors: Please set LastEditors
 * @LastEditTime: 2020-11-17 20:14:39
 * @Modultype: Component
 * @Usage: import/global/prototype
 * @Description: Do not edit
 * @FilePath: \node\libs\body.js
 */
const body=require('koa-better-body');
const convert=require('koa-convert');
const {UPLOAD}=require('../config');

module.exports={
  post(){
    return convert(body({
      multipart: false,
      buffer: false
    }));
  },
  upload(options){
    options=options||{};
    options.uploadDir = options.uploadDir ? UPLOAD.DIR + '\\' + options.uploadDir : UPLOAD.DIR;
    options.maxFileSize = options.maxFileSize||20*1024*1024;
    // console.log('upload==>options',options)
    return [
      async (ctx,next)=>{
        try{
          await next();
        }catch(e){
          if(e.message.startsWith('maxFileSize exceeded')){
            if(options.sizeExceed){
              await options.sizeExceed(ctx);
            }else{
              ctx.body='文件过大';
            }
          }else{
            if(options.error){
              await options.error(ctx, e);
            }else{
              throw e;
            }
          }
        }
      },
      convert(body({
        uploadDir: options.uploadDir,
        maxFileSize: options.maxFileSize,
      })),
    ];
  }
};
