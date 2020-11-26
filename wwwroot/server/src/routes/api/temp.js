import KoaRouter from 'koa-router'
import controllers from '../../controllers'

const router = new KoaRouter()

// 请求接口校验中间件

const userLogin = controllers.common.checkIsUserLogin;
const checkfn = controllers.common.checkRequestUrl;


/*---------------------------------------用户模板---------------------------------------------*/

// 查询所有模板
router.post('/getTempList', checkfn, controllers.temp.getTempList)

// 新增模板
router.post('/addTemp', checkfn, controllers.temp.addTemp)


module.exports=router.routes();
