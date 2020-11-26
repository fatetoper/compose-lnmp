import KoaRouter from 'koa-router'
import controllers from '../../controllers'

const router = new KoaRouter()

// 请求接口校验中间件
const checkfn = controllers.common.checkRequestUrl;


/*---------------------------------------目录相关---------------------------------------------*/

//获得所有目录
router.post('/getCatalogList', checkfn, controllers.catalog.getCatalogList)

//新建 | 编辑 目录 
router.post('/editCatalog', checkfn, controllers.catalog.editCatalog)

//删除目录 
router.post('/deleteCatalog', checkfn, controllers.catalog.deleteCatalog)

// 查询项目下所有的一级类目
router.post('/getNavCatalogList', checkfn, controllers.catalog.getNavCatalogList)


module.exports=router.routes();
