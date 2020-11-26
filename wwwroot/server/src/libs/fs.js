/*
 * @Author: fatetoper
 * @Date: 2020-09-06 09:23:22
 * @LastEditors: fatetoper
 * @LastEditTime: 2020-09-06 21:57:51
 * @Modultype: libs
 * @Usage: import/api
 * @Description: Do not edit
 * @FilePath: \node\libs\fs.js
 */
const fs=require('fs')


module.exports= {
  getStat (filePath) {
    return new Promise((resolve, reject) => {
      fs.stat(filePath, (err, stats) => {
        if (err) {
          resolve(false)
        } else {
          resolve(stats)
        }
      })
    })
  },
  doUnlink (filePath) {
    return new Promise((resolve, reject) => {
      fs.unlink(filePath, (err) => {
        if (err) {
          resolve(false)
        } else {
          resolve(true)
        }
      })
    })
  },
  doMkdir (filePath) {
    return new Promise((resolve, reject) => {
      fs.mkdir(filePath, (err) => {
        if (err) {
          console.log(err)
          resolve(false)
        } else {
          resolve(true)
        }
      })
    })
  }
}
