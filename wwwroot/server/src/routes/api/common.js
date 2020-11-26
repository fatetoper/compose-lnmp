import KoaRouter from 'koa-router'
import controllers from '../../controllers'

const router = new KoaRouter()

// 请求接口校验中间件
const checkfn = controllers.common.checkRequestUrl;

/*---------------------------------------common 相关---------------------------------------------*/

// 获得左侧列表
router.post('/getNavCommonTwoCatalog', checkfn, controllers.common.getNavCommonTwoCatalog)


module.exports=router.routes();
