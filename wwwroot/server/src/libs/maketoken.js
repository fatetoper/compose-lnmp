/*
 * @Author: your name
 * @Date: 2020-11-14 16:19:46
 * @LastEditTime: 2020-11-24 01:40:05
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \mockserver\src\libs\maketoken.js
 */
import { v4 as uuidv4 } from 'uuid';
const {token_len}=require('../config');

let makeToken =(length)=>{
  let key='';
  let len = length || token_len
  while(key.length<len){
    key+=uuidv4().replace(/\-/g, '');
  }
  return key.substring(0,len);
}

module.exports=makeToken