/*
 * @Author: your name
 * @Date: 2020-11-14 16:19:46
 * @LastEditTime: 2020-11-15 14:29:55
 * @LastEditors: your name
 * @Description: In User Settings Edit
 * @FilePath: \mockserver\src\libs\network.js
 */
const os=require('os');

let arr=[];
let json=os.networkInterfaces();
for(let name in json){
  if(name.startsWith('VMware'))continue;

  json[name].forEach(item=>{
    if(item.family=='IPv4'){
      arr.push(item.address);
    }
  });
}

export default arr;
