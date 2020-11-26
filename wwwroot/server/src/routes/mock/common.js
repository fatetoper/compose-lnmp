import controllers from '../../controllers'
import { getQueryParameters } from './util'
import Mock from 'better-mock'
import KoaRouter from 'koa-router'
const router = new KoaRouter()

// 请求接口校验中间件
const checkfn = controllers.common.checkRequestUrl;
// console.log('router common works')
/*-----------------------------------------------------------------------------------*/

router.get('/role', (ctx) => {
  const info = (options) => {
    const userInfo = {
      'id': '4291d7da9005377ec9aec4a71ea837f',
      'name': '天野远子',
      'username': 'admin',
      'password': '',
      'avatar': '/avatar2.jpg',
      'status': 1,
      'telephone': '',
      'lastLoginIp': '27.154.74.117',
      'lastLoginTime': 1534837621348,
      'creatorId': 'admin',
      'createTime': 1497160610259,
      'merchantCode': 'TLif2btpzg079h15bk',
      'deleted': 0,
      'roleId': 'admin',
      'role': {}
    }
    // role
    const roleObj = {
      'id': 'admin',
      'name': '管理员',
      'describe': '拥有所有权限',
      'status': 1,
      'creatorId': 'system',
      'createTime': 1497160610259,
      'deleted': 0,
      'permissions': [
        {
        'roleId': 'admin',
        'permissionId': 'dashboard',
        'permissionName': '仪表盘',
        'actions': '[{"action":"add","defaultCheck":false,"describe":"新增"},{"action":"query","defaultCheck":false,"describe":"查询"},{"action":"get","defaultCheck":false,"describe":"详情"},{"action":"update","defaultCheck":false,"describe":"修改"},{"action":"delete","defaultCheck":false,"describe":"删除"}]',
        'actionEntitySet': [{
          'action': 'add',
          'describe': '新增',
          'defaultCheck': false
        }, {
          'action': 'query',
          'describe': '查询',
          'defaultCheck': false
        }, {
          'action': 'get',
          'describe': '详情',
          'defaultCheck': false
        }, {
          'action': 'update',
          'describe': '修改',
          'defaultCheck': false
        }, {
          'action': 'delete',
          'describe': '删除',
          'defaultCheck': false
        }],
        'actionList': null,
        'dataAccess': null
        },
        {
        'roleId': 'admin',
        'permissionId': 'exception',
        'permissionName': '异常页面权限',
        'actions': '[{"action":"add","defaultCheck":false,"describe":"新增"},{"action":"query","defaultCheck":false,"describe":"查询"},{"action":"get","defaultCheck":false,"describe":"详情"},{"action":"update","defaultCheck":false,"describe":"修改"},{"action":"delete","defaultCheck":false,"describe":"删除"}]',
        'actionEntitySet': [{
          'action': 'add',
          'describe': '新增',
          'defaultCheck': false
        }, {
          'action': 'query',
          'describe': '查询',
          'defaultCheck': false
        }, {
          'action': 'get',
          'describe': '详情',
          'defaultCheck': false
        }, {
          'action': 'update',
          'describe': '修改',
          'defaultCheck': false
        }, {
          'action': 'delete',
          'describe': '删除',
          'defaultCheck': false
        }],
        'actionList': null,
        'dataAccess': null
      },
      {
        'roleId': 'admin',
        'permissionId': 'result',
        'permissionName': '结果权限',
        'actions': '[{"action":"add","defaultCheck":false,"describe":"新增"},{"action":"query","defaultCheck":false,"describe":"查询"},{"action":"get","defaultCheck":false,"describe":"详情"},{"action":"update","defaultCheck":false,"describe":"修改"},{"action":"delete","defaultCheck":false,"describe":"删除"}]',
        'actionEntitySet': [{
          'action': 'add',
          'describe': '新增',
          'defaultCheck': false
        }, {
          'action': 'query',
          'describe': '查询',
          'defaultCheck': false
        }, {
          'action': 'get',
          'describe': '详情',
          'defaultCheck': false
        }, {
          'action': 'update',
          'describe': '修改',
          'defaultCheck': false
        }, {
          'action': 'delete',
          'describe': '删除',
          'defaultCheck': false
        }],
        'actionList': null,
        'dataAccess': null
      },
      {
        'roleId': 'admin',
        'permissionId': 'profile',
        'permissionName': '详细页权限',
        'actions': '[{"action":"add","defaultCheck":false,"describe":"新增"},{"action":"query","defaultCheck":false,"describe":"查询"},{"action":"get","defaultCheck":false,"describe":"详情"},{"action":"update","defaultCheck":false,"describe":"修改"},{"action":"delete","defaultCheck":false,"describe":"删除"}]',
        'actionEntitySet': [{
          'action': 'add',
          'describe': '新增',
          'defaultCheck': false
        }, {
          'action': 'query',
          'describe': '查询',
          'defaultCheck': false
        }, {
          'action': 'get',
          'describe': '详情',
          'defaultCheck': false
        }, {
          'action': 'update',
          'describe': '修改',
          'defaultCheck': false
        }, {
          'action': 'delete',
          'describe': '删除',
          'defaultCheck': false
        }],
        'actionList': null,
        'dataAccess': null
      },
      {
        'roleId': 'admin',
        'permissionId': 'table',
        'permissionName': '表格权限',
        'actions': '[{"action":"add","defaultCheck":false,"describe":"新增"},{"action":"import","defaultCheck":false,"describe":"导入"},{"action":"get","defaultCheck":false,"describe":"详情"},{"action":"update","defaultCheck":false,"describe":"修改"}]',
        'actionEntitySet': [{
          'action': 'add',
          'describe': '新增',
          'defaultCheck': false
        }, {
          'action': 'import',
          'describe': '导入',
          'defaultCheck': false
        }, {
          'action': 'get',
          'describe': '详情',
          'defaultCheck': false
        }, {
          'action': 'update',
          'describe': '修改',
          'defaultCheck': false
        }],
        'actionList': null,
        'dataAccess': null
      },
      {
        'roleId': 'admin',
        'permissionId': 'form',
        'permissionName': '表单权限',
        'actions': '[{"action":"add","defaultCheck":false,"describe":"新增"},{"action":"get","defaultCheck":false,"describe":"详情"},{"action":"query","defaultCheck":false,"describe":"查询"},{"action":"update","defaultCheck":false,"describe":"修改"},{"action":"delete","defaultCheck":false,"describe":"删除"}]',
        'actionEntitySet': [{
          'action': 'add',
          'describe': '新增',
          'defaultCheck': false
        }, {
          'action': 'get',
          'describe': '详情',
          'defaultCheck': false
        }, {
          'action': 'query',
          'describe': '查询',
          'defaultCheck': false
        }, {
          'action': 'update',
          'describe': '修改',
          'defaultCheck': false
        }, {
          'action': 'delete',
          'describe': '删除',
          'defaultCheck': false
        }],
        'actionList': null,
        'dataAccess': null
      },
      {
        'roleId': 'admin',
        'permissionId': 'order',
        'permissionName': '订单管理',
        'actions': '[{"action":"add","defaultCheck":false,"describe":"新增"},{"action":"query","defaultCheck":false,"describe":"查询"},{"action":"get","defaultCheck":false,"describe":"详情"},{"action":"update","defaultCheck":false,"describe":"修改"},{"action":"delete","defaultCheck":false,"describe":"删除"}]',
        'actionEntitySet': [{
          'action': 'add',
          'describe': '新增',
          'defaultCheck': false
        }, {
          'action': 'query',
          'describe': '查询',
          'defaultCheck': false
        }, {
          'action': 'get',
          'describe': '详情',
          'defaultCheck': false
        }, {
          'action': 'update',
          'describe': '修改',
          'defaultCheck': false
        }, {
          'action': 'delete',
          'describe': '删除',
          'defaultCheck': false
        }],
        'actionList': null,
        'dataAccess': null
      },
      {
        'roleId': 'admin',
        'permissionId': 'permission',
        'permissionName': '权限管理',
        'actions': '[{"action":"add","defaultCheck":false,"describe":"新增"},{"action":"get","defaultCheck":false,"describe":"详情"},{"action":"update","defaultCheck":false,"describe":"修改"},{"action":"delete","defaultCheck":false,"describe":"删除"}]',
        'actionEntitySet': [{
          'action': 'add',
          'describe': '新增',
          'defaultCheck': false
        }, {
          'action': 'get',
          'describe': '详情',
          'defaultCheck': false
        }, {
          'action': 'update',
          'describe': '修改',
          'defaultCheck': false
        }, {
          'action': 'delete',
          'describe': '删除',
          'defaultCheck': false
        }],
        'actionList': null,
        'dataAccess': null
      },
      {
        'roleId': 'admin',
        'permissionId': 'role',
        'permissionName': '角色管理',
        'actions': '[{"action":"add","defaultCheck":false,"describe":"新增"},{"action":"get","defaultCheck":false,"describe":"详情"},{"action":"update","defaultCheck":false,"describe":"修改"},{"action":"delete","defaultCheck":false,"describe":"删除"}]',
        'actionEntitySet': [{
          'action': 'add',
          'describe': '新增',
          'defaultCheck': false
        }, {
          'action': 'get',
          'describe': '详情',
          'defaultCheck': false
        }, {
          'action': 'update',
          'describe': '修改',
          'defaultCheck': false
        }, {
          'action': 'delete',
          'describe': '删除',
          'defaultCheck': false
        }],
        'actionList': null,
        'dataAccess': null
      },
      {
        'roleId': 'admin',
        'permissionId': 'table',
        'permissionName': '桌子管理',
        'actions': '[{"action":"add","defaultCheck":false,"describe":"新增"},{"action":"get","defaultCheck":false,"describe":"详情"},{"action":"query","defaultCheck":false,"describe":"查询"},{"action":"update","defaultCheck":false,"describe":"修改"},{"action":"delete","defaultCheck":false,"describe":"删除"}]',
        'actionEntitySet': [{
          'action': 'add',
          'describe': '新增',
          'defaultCheck': false
        }, {
          'action': 'get',
          'describe': '详情',
          'defaultCheck': false
        }, {
          'action': 'query',
          'describe': '查询',
          'defaultCheck': false
        }, {
          'action': 'update',
          'describe': '修改',
          'defaultCheck': false
        }, {
          'action': 'delete',
          'describe': '删除',
          'defaultCheck': false
        }],
        'actionList': null,
        'dataAccess': null
      },
      {
        'roleId': 'admin',
        'permissionId': 'user',
        'permissionName': '用户管理',
        'actions': '[{"action":"add","defaultCheck":false,"describe":"新增"},{"action":"import","defaultCheck":false,"describe":"导入"},{"action":"get","defaultCheck":false,"describe":"详情"},{"action":"update","defaultCheck":false,"describe":"修改"},{"action":"delete","defaultCheck":false,"describe":"删除"},{"action":"export","defaultCheck":false,"describe":"导出"}]',
        'actionEntitySet': [{
          'action': 'add',
          'describe': '新增',
          'defaultCheck': false
        }, {
          'action': 'import',
          'describe': '导入',
          'defaultCheck': false
        }, {
          'action': 'get',
          'describe': '详情',
          'defaultCheck': false
        }, {
          'action': 'update',
          'describe': '修改',
          'defaultCheck': false
        }, {
          'action': 'delete',
          'describe': '删除',
          'defaultCheck': false
        }, {
          'action': 'export',
          'describe': '导出',
          'defaultCheck': false
        }],
        'actionList': null,
        'dataAccess': null
      }
    ]
    }

    roleObj.permissions.push({
      'roleId': 'admin',
      'permissionId': 'support',
      'permissionName': '超级模块',
      'actions': '[{"action":"add","defaultCheck":false,"describe":"新增"},{"action":"import","defaultCheck":false,"describe":"导入"},{"action":"get","defaultCheck":false,"describe":"详情"},{"action":"update","defaultCheck":false,"describe":"修改"},{"action":"delete","defaultCheck":false,"describe":"删除"},{"action":"export","defaultCheck":false,"describe":"导出"}]',
      'actionEntitySet': [
        {
        'action': 'add',
        'describe': '新增',
        'defaultCheck': false
        }, {
          'action': 'import',
          'describe': '导入',
          'defaultCheck': false
        }, {
          'action': 'get',
          'describe': '详情',
          'defaultCheck': false
        }, {
          'action': 'update',
          'describe': '修改',
          'defaultCheck': false
        }, {
          'action': 'delete',
          'describe': '删除',
          'defaultCheck': false
        }, {
          'action': 'export',
          'describe': '导出',
          'defaultCheck': false
        }
      ],
      'actionList': null,
      'dataAccess': null
    })
    // 后台页面权限
    roleObj.permissions.push({
      'roleId': 'admin',
      'permissionId': 'content',
      'permissionName': '内容管理',
      'actions': '[{"action":"add","defaultCheck":false,"describe":"新增"},{"action":"query","defaultCheck":false,"describe":"查询"},{"action":"get","defaultCheck":false,"describe":"详情"},{"action":"update","defaultCheck":false,"describe":"修改"},{"action":"delete","defaultCheck":false,"describe":"删除"},{"action":"import","defaultCheck":false,"describe":"导入"},{"action":"export","defaultCheck":false,"describe":"导出"}]',
      'actionEntitySet': [
        {
        'action': 'add',
        'describe': '新增',
        'defaultCheck': false
        }, {
          'action': 'import',
          'describe': '导入',
          'defaultCheck': false
        }, {
          'action': 'get',
          'describe': '详情',
          'defaultCheck': false
        }, {
          'action': 'update',
          'describe': '修改',
          'defaultCheck': false
        }, {
          'action': 'delete',
          'describe': '删除',
          'defaultCheck': false
        }, {
          'action': 'export',
          'describe': '导出',
          'defaultCheck': false
        }
      ],
      'actionList': null,
      'dataAccess': null
    })

    userInfo.role = roleObj
    return userInfo
  }
  ctx.response.body = {result: info()}
})

router.get('/userlist', (ctx) => {
  const data = (options) => {
    const userlist = {
      'id': '4291d7da9005377ec9aec4a71ea837f',
      'name': '天野远子',
      'username': 'admin',
      'password': '',
      'avatar': '/avatar2.jpg',
      'status': 1,
      'telephone': '',
      'lastLoginIp': '27.154.74.117',
      'lastLoginTime': 1534837621348,
      'creatorId': 'admin',
      'createTime': 1497160610259,
      'merchantCode': 'TLif2btpzg079h15bk',
      'deleted': 0,
      'roleId': 'admin',
      'role': {}
    }
    return userlist
  }
  ctx.response.body = {result: data()}
})

// 分页器api
router.get('/serverList', (ctx) => {
  const data = (options) => {
    return  (() => {
      const parameters = getQueryParameters(options)
      const totalCount = Mock.mock('@integer(100, 999)')
      const result = [],
            pageNo = parseInt(parameters.pageNo),
            pageSize = parseInt(parameters.pageSize),
            totalPage = Math.ceil(totalCount / pageSize),
            key = (pageNo - 1) * pageSize,
            itemNo = (pageNo >= totalPage ? (totalCount % pageSize) : pageSize) + 1
      for (let i = 1; i < itemNo; i++) {
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
