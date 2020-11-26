const Router=require('koa-router')
// const static=require('../../libs/contentStatic')
const { upload, body }=require('../../libs/body')
const CaptchaSDK = require('dx-captcha-sdk')
const Qs = require('qs')
const fs = require('fs')
const sendCheck=require('../../libs/sendCheck')
const makeToken=require('../../libs/maketoken')
const makeRandom=require('../../libs/makerandom')
const { getStat, doUnlink, doMkdir }=require('../../libs/fs')
const {UPLOAD, SYSTEM}=require('../../config')

let router=new Router()

// {
//   ok: true, data: [],{}
// }
// {
//   ok: false, msg: '参数有误/数据不存在'
// }

router.use(async (ctx,next)=>{
  try{
    await next()

    if(ctx.body!==undefined){
      ctx.status=200
      ctx.body={ok: true, data: ctx.body}
    }else{
      ctx.status=404
      ctx.body={ok: false, msg: 'data not found:/api/meta.js'}
    }
  }catch(e){
    console.log(e)
    // ctx.body={ok: false, msg: e.message}
    ctx.status=500
    ctx.body={ok: false, msg: 'server error'}
  }
})

router.get('/',async ctx=>{
  ctx.body='<div>嗯呐</div>'
})


// 获取banner	GET	/api/mena/artpro
router.get('/artpro', async ctx=>{
  console.log('ctx.query=>', ctx.query)
  // col.length = 13
  const col =["id","typeid","sortrank","flag","click","title","writer","pubdate",
  "senddate","keywords","notpost","description","weight","color"]
  const pageNo = ctx.query.pageNo, pageSize = ctx.query.pageSize
  const sql = "SELECT ??,??,?? as 'key',??,??,?? as 'tit',??,??,??,??,??,??,??,?? as 'oprater' FROM rc_archives LIMIT ?,?;"
  ctx.body = await ctx.db.query(sql, [...col, (pageNo-1)*pageSize, pageSize*1])
})

// 获取writer	GET	/api/mena/writer
router.get('/writer', async ctx=>{
  
  const sql = "SELECT id as 'key',id as 'value',uname as 'title' FROM rc_admin"
  let writer = await ctx.db.query(sql) // category还不是json需要转化
  writer = JSON.parse(JSON.stringify(writer))
  // console.log('writer=>',writer)
  ctx.body= {
    writer
  }
})

// 获取writer	GET	/api/mena/source
router.get('/source', async ctx=>{
  
  const sql = "SELECT id as 'key',id as 'value',typename as 'title' FROM rc_channeltype"
  let source = await ctx.db.query(sql) // category还不是json需要转化
  source = JSON.parse(JSON.stringify(source))
  // console.log('source=>',source)
  ctx.body= {
    source
  }
})

// 获取editorinfo	GET	/api/mena/editorinfo
router.get('/editorinfo', async ctx=>{

  const treeMaker = (category) => {
    let tree = [], arr = JSON.parse(JSON.stringify(category))
    // 未测试
    const sifter = (arr, refer, condition, newArr) => {
    // 改变原数组的过滤器
    //arr被过滤数组, refer参照对象, condition过滤条件, newArr
      
      if(!newArr) {
        const newArr = [],needReturn = true
      }
      for (let i = arr.length - 1; i >= 0; i--) {
        if(condition) {
          newArr.push(arr.splice(i,1)[0])
        }
      }
      if(needReturn) return newArr

    }
    const rootsMaker = () => {
      for (let i = arr.length - 1; i >= 0; i--) {
        if(arr[i].reid === 0) {
          tree.push(arr.splice(i,1)[0])
        }
      }
    }
    const nodeMaker = (tree, data) => {
      tree.map((i)=>{
        // midArr ==> 每个treeRoot的数据列表
        let midArr = []
        for (let j = data.length - 1; j >= 0; j--) {
          if(data[j].topid === i.key) {
            midArr.push(data.splice(j,1)[0])
          }
        }
        const childMaker = (treeRoot, data)=>{
          // 1.有没有 2.构造child结构 3.加入子项 4.递归
          const hasChild = (treeRoot, data) => {
            let has = false
            const child = []
            for(let i = data.length - 1; i >= 0; i--) {
              if(data[i].reid === treeRoot.key){
                !has && (has = true)
                child.push(data.splice(i,1)[0])
              }
            }
            return has ? child : has
          }
          treeRoot.children = hasChild(treeRoot, data)
          if(treeRoot.children) {
            treeRoot.children.map((i)=>{
              childMaker(i, data)
            })
          }
          // console.log('childMaker=>', treeRoot)
          // return treeRoot
        }
        childMaker(i, midArr)
        
      })
    }
    rootsMaker()
    nodeMaker(tree, arr)
    return  tree
  }
  // console.log('recol=>', recol(col))
 
  const sql = "SELECT id as 'key',id as 'value',typename as 'title',reid,topid FROM rc_arctype"
  const category = await ctx.db.query(sql) // category还不是json需要转化
  // console.log('tcategory=>',category)
  const tree = treeMaker(category)
  // console.log('treeMaker:',tree)
  ctx.body= {
    tree
  }
})

// 获取artclo信息	GET	/api/mena/artclo
router.get('/artclo', async ctx=>{
  const col = {
    'id':'ID',
    'typeid':'类目',
    'tit': '文章标题',
    'senddate': '更新时间',
    'click': '点击',
    'pubdate': 'HTML',
    'notpost': '权限',
    'writer': '发布人',
    'oprater': '操作'
  }
  const slots = {
    'oprater': { customRender: 'oprater' },
    'typeid': { customRender: 'typeid' },
    'tit': { customRender: 'tit' },
    'pubdate': { customRender: 'pubdate' },
    'senddate': { customRender: 'senddate' },
    'notpost': { customRender: 'notpost' }
  }
 
  const recol = (col)=>{
    let recol = []
    let keys = Object.keys(col)
    keys.map((item)=>{
      if(slots[item]){
        recol.push({
          title: col[item] || 'erro',
          dataIndex: item,
          scopedSlots: slots[item]
        })
      }else{
        recol.push({
          title: col[item] || 'erro',
          dataIndex: item
        })
      }
      
    })
    return recol
  }
  
  // console.log('recol=>', recol(col))
  const sql = "SELECT COUNT(*) FROM rc_archives"
  const totle = await ctx.db.query(sql)
  const sql1 = "SELECT id,typename,reid,topid FROM rc_arctype"
  const category = await ctx.db.query(sql1) // category还不是json需要转化

  ctx.body= {
    col:recol(col),
    totle:totle[0]['COUNT(*)'],
    category
  }
})




// 获取一个新的filename	GET	/api/mena/newfilename
router.get('/dirname', async ctx=>{
  let dirname = 'm25p3'
  const baseurl = UPLOAD.TMP.split('\\')[1]
  const host = SYSTEM.HOST + ':' + SYSTEM.PROT
  console.log('@baseurl=>', baseurl)
  ctx.body= {
    dirname,
    baseurl,
    host
  }
})

// 获取一个文件夹内的图片数据	GET	/api/mena/images
// {
//   uid: '-1',
//   name: 'image.png',
//   status: 'done',
//   url: 'http://localhost:8081/upload/def/jkjgkEfvpUPVyRjUImniVslZfWPnJuuZ.png'
// }
router.get('/images/:dirname', async ctx=>{
  const dirname = ctx.params.dirname
  const baseUrl = 'http://' + SYSTEM.HOST + ':' + SYSTEM.PROT
  const sql = `SELECT aid AS uid,title AS name,CONCAT('${baseUrl}',url)AS url,uptime,'done' AS status  FROM rc_uploads WHERE arcpath = '${dirname}'`
  try {
    const res = await ctx.db.query(sql)
    // console.log(res)
    if (res) {
      ctx.body = res
    }
  } catch (e) {
    console.log(e)
    ctx.body = {
      error: "文件路径错误"
    }
  }
})

// 上传img获取URL	POST	/api/mena/img
let pathUpload
router.post('/imgupload',
...upload({
  uploadDir: pathUpload,
  maxFileSize: 5*1024*1024
}), 
async (ctx, next) => {
  /*
  * 读取路径信息 + 按路径移到图片文件 + 生产新相对路径ctx.imgPath + 标志操作状态ctx.renameStatus
  * @param {string} filepath 路径
  */
  try {
    const file = ctx.request.fields.file[0]
    const tmpDir = 'tmp'
    pathUpload = ctx.request.fields.dirname

    const renamePath = UPLOAD.TMP.replace(tmpDir, pathUpload)
    ctx.renamePath = renamePath
    ctx.renameDir = renamePath + '\\' + file.name
    console.log('@3=================@renameDir=>', ctx.renameDir)
    ctx.imgPath = pathUpload + '/' + file.name
    console.log('@4=================@renameDir=>', ctx.imgPath)
   
    let isExists = await getStat(renamePath)
    if (!isExists) {
      ctx.renamePathStatus = await doMkdir(renamePath)
    } else if (isExists && !isExists.isDirectory()) {
      const deLink = await doUnlink(renamePath)
      if (deLink) {
        ctx.renamePathStatus = await doMkdir(renamePath)
      } 
      else throw `Can not build path ${renamePath}`
    } else ctx.renamePathStatus = true

    if (ctx.renamePathStatus) {
      fs.renameSync(file.path, ctx.renameDir)
      ctx.renameStatus = true
    }
    await next()
  } catch (e) { throw e }
}, 
async (ctx, next) => {
  // 存入数据库，返回url
  const img = {}
  console.log('@8=================@ctx.request.fields', ctx.request.fields)
  if (ctx.renameStatus) {
    const baseUrl = renamePath => {
      const arr = renamePath.split('\\')
      const length = arr.length
      return arr[length - 2]
    }
    // ctx.url = '/' + baseUrl(ctx.renamePath) + '/' + ctx.imgPath
    ctx.url = '/' + ctx.imgPath
    const { file:[{ size: upSize, name:upName , type: upType }], dirname: arcPath, arcid: arcId } = ctx.request.fields
    const time = Math.round(new Date().getTime()/1000).toString()
    const imgInfo = {
      arcid: arcId || 0,
      width: 0,
      height:0,
      title: upName,
      mediatype: 1,
      uptime: time,
      playtime: 0
    }
    let sql = `INSERT INTO rc_uploads(arcid,arcpath,title,url,mediatype,width,height,filesize,uptime,playtime) `
    sql+= `VALUES(${imgInfo.arcid},"${arcPath}","${imgInfo.title}","${ctx.url}",${imgInfo.mediatype},"${imgInfo.width}","${imgInfo.height}",${upSize},${time},${imgInfo.playtime});`
    console.log(sql)
    try {
      const res = await ctx.db.query(sql) 
      console.log('/imgupload', res)
      if (res) {
        ctx.body = {
          url: ctx.url
        }
      }
    } catch (e) {
      console.log(e)
      ctx.body = {
        error: "上传失败"
      }
    }
  }
  
  await next()
})



/* router.options('/login',async ctx=>{
  console.log("===========================options==============================")
  console.log("set options: status")
  ctx.status=200
  ctx.set('Access-Control-Allow-Origin','*')
  ctx.set('Access-Control-Allow-Headers','*')
  ctx.set('Access-Control-Allow-Methods','*')

}) */


router.post('/checkNum/', async ctx=>{
  let aw = Qs.parse(ctx.request.fields.data).data
  let kw = JSON.parse(aw)
  console.log("ctx.request.fields.data.data :",kw)
  let sql = `SELECT * FROM you_usrs where tel = ${kw.tel};`
  let result =await ctx.db.query(sql)
  console.log("result.length:",result.length)
  if(result.length){
    ctx.body={ok:true}
  }else{
    // 注册临时用户  最好用个存储函数
    let sql = `INSERT INTO you_usrs(tel) VALUES(${kw.tel});`
    let result =await ctx.db.query(sql)
    console.log(result)
    if(result.affectedRows&&result.affectedRows!==0){
      ctx.body={ok:true,errorText:'注册用户成功'}
    }else{
      ctx.body={ok:false,errorText:'注册用户失败，请重试'}
    }
    
  }
  // 发送验证码
  let makeAndSend= async (tel)=>{
    // 生成验证码
    let random = makeRandom(6)
    console.log("makeRandom(6):",random)
    // 生成token
    let tok = makeToken()
    console.log("tok:",tok)
    // 存入session
    ctx.session[`${tok}`]=random
    console.log("ctx.session.tok:",ctx.session[`${tok}`])
    // 发送验证码
    let res =await sendCheck(tel,random,true)
    // 如果发送成功,存入cookie
    if(res){
      ctx.cookies.set('cnt',tok,{maxAge:10*60*1000})
    }
  }
  // 检查token和验证码
  let checkToken = ctx.cookies.get('cnt',{maxAge:10*60*1000})
  if(checkToken){
    // 查询验证码，重新发送
    let res =ctx.session[checkToken]
    if(res!==undefined){
      console.log("cnt 仍在有效期")
      sendCheck(res)
    }else{
      makeAndSend(kw.tel)
    }
  }else{
    makeAndSend(kw.tel)
  }
    
})
// 登录	POST /api/you/login
// ajax+跨域，cookie只能自己处理，浏览器不会帮你
router.post('/login/', async ctx=>{
  console.log("===========================post==============================")
  let result = {},
      check = false,
      tok = ctx.cookies.get('cnt'),
      resCheck= ctx.session[`${tok}`]
  let kw = ctx.cookies.get('_dx_uzZo5y')
  let reqData = Qs.parse(ctx.request.fields.data).data
      reqData = JSON.parse(reqData)
  let  checkNum = reqData.captch,
       tel = reqData.tel
  console.log("ctx.session.tok:",ctx.session[`${tok}`])
  console.log("reqData:",reqData)
  console.log("tok:",tok)
  console.log("checkNum:",checkNum)
  console.log("kw:",kw)

  // 验证图片
  const sdk = new CaptchaSDK('da7fbbcecea237308fae9e331c9351dd', '043feb6b2e934505eb4b25aa7fbef885')
  sdk.setCaptchaUrl('http://39.149.1.41')
  await sdk.verifyToken(kw,1*1000).then(() => {
    console.log('验证成功,this=',this)
    check = true
  }).catch(err => {
    console.log('验证失败')
  }) 
  if(check){
    // 验证验证码
    console.log("check:",check)
    if(resCheck&&checkNum==resCheck){
      // 生成新token
      let token = makeToken()
      // 生成用户数据--最好用存储过程
      let usrData = 'abcd'
      // 设置cookie，session,删除tok
      ctx.session[token]=usrData
      console.log("token:",token)
      delete ctx.session[`${tok}`]
      ctx.cookies.set('token',token,{maxAge:10*60*1000})
      // 返回成功
      result = {
        result:true,
        data:{
          token,
          maxAge: 10*60*1000
        }
      }
    }else{
      result = {result:false,errorText:'登录失败,验证码无效'}
    }
  }else{
    result = {result:false,errorText:'登录失败,您是人吗'}
  }

  ctx.body={
    ...result
  };
})


// 获取nav	GET	/api/you/nav
router.get('/nav/', async ctx=>{
  // console.log("ctx.url:",ctx.url)
  let index = ctx.request.url.replace('/api/mena/nav/?index=','')
  console.log("index:",index)
  // console.log("ctx.url.match(/^\/api\/you/i):",ctx.url.startsWith('/api/you'));
  let sql = `SELECT * FROM you_nav where indexP=${index};`
  let result =await ctx.db.query(sql)
  // console.log(result)

  ctx.body=result
})

// 获取banner	GET	/api/you/banner
router.get('/banner', async ctx=>{
  ctx.body=await ctx.db.query("SELECT name,picUrl,targetUrl FROM you_banner;");
  
});

// 获取相关搜索	GET	/api/you/searchautocomplete
router.get('/searchautocomplete/', async ctx=>{

  let kw = ctx.request.url.replace('/api/mena/searchautocomplete/?kw=','')
 
  let kwLike = `'%${kw}%'`
  console.log("kwLike:",kwLike)
  let sql = `SELECT * FROM you_sword where word like ${kwLike};`
  let result =await ctx.db.query(sql)
  // console.log(result)
  ctx.body=result
})


module.exports=router.routes()
