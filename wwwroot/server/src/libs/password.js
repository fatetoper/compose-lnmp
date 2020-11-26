const md5=require('./md5');
const {md5_key}=require('../config');

module.exports=function (data){
  return md5(md5(data)+md5_key);
};
