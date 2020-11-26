import KoaRouter from 'koa-router'
import controllers from '../../../controllers'
import Mock from 'better-mock'

const router = new KoaRouter()

// 请求接口校验中间件
const checkfn = controllers.common.checkRequestUrl;
// console.log('router mock-page works')
/*-----------------------------------------------------------------------------------*/



router.get('/radar', (ctx) => {
  const data = (options) => {
    console.log('radar', options)
    const radar = [
      {
        item: '引用',
        '个人': 70,
        '团队': 30,
        '部门': 40
      },
      {
        item: '口碑',
        '个人': 60,
        '团队': 70,
        '部门': 40
      },
      {
        item: '产量',
        '个人': 50,
        '团队': 60,
        '部门': 40
      },
      {
        item: '贡献',
        '个人': 40,
        '团队': 50,
        '部门': 40
      },
      {
        item: '热度',
        '个人': 60,
        '团队': 70,
        '部门': 40
      },
      {
        item: '引用',
        '个人': 70,
        '团队': 50,
        '部门': 40
      }
    ]
    return radar
  }
  ctx.response.body = {result: data()}
})

// 分页器api
router.get('/serverList', (ctx) => {
  const data = (options) => {
    return  (() => {
      const parameters = getQueryParameters(options)
      const totalCount = Mock.mock('@integer(100, 999)') // 需要sql获取或者mock生成?????
      const result = [],
            pageNo = parseInt(parameters.pageNo),
            pageSize = parseInt(parameters.pageSize),
            totalPage = Math.ceil(totalCount / pageSize),
            key = (pageNo - 1) * pageSize,
            next = (pageNo >= totalPage ? (totalCount % pageSize) : pageSize) + 1
      for (let i = 1; i < next; i++) {
        const tmpKey = key + i
        result.push({
          key: tmpKey,
          id: tmpKey,
          no: 'No ' + tmpKey,
          description: '这是一段描述',
          callNo: Mock.mock('@integer(1, 999)'),
          status: Mock.mock('@integer(0, 3)'),
          updatedAt: Mock.mock('@datetime'),
          editable: false
        })
      }
      return {
        pageSize: pageSize,
        pageNo: pageNo,
        totalCount: totalCount,
        totalPage: totalPage,
        data: result
      }
    })()
  }
  ctx.response.body = {result: data(ctx)} // ?????? 需要测试调整
})





module.exports=router.routes();
