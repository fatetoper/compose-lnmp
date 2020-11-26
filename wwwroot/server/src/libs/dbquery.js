const jsonSql = require('json-sql')();

// 一个柯力化的函数，返回 ctx.db.query(sql), 
// 参数 第一个传入 table ，第二个传入其他 { type, options } ,不同类型分类处理。 
//  table格式： 
//  //  table:string || table:[field,field1,field2...] || table:{field:number,field1:string,field2:array,...}
//  type： insert（新增），select（查询），update（修改），delete（删除）
/*  options: 
        insert:[data,...], 
        select:{},
        update:{},
        delete:{},
*/
let dbquery =async function(table){
  //  是否存在table, string 判断名称
  //  table的结构是否标准, array/object 判断字段及类型 
  //  table格式： 
  //  //  table:string || table:[field,field1,field2...] || table:{field:number,field1:string,field2:array,...}

  return async function(type,options){
    if(type=='insert'){
      const data=options.data;
      // 各种判断
      // 1. data的层数
      // 2. 如果为多层，接收表的元结构（），解析成单层json
      // 3. 
      let sql = jsonSql.build({
        type,
        table,
        values:data
      });

    }else if(type=='select'){
    }else if(type=='update'){
    }else if(type=='delete'){
    }else{
      // throw console.error();
    }
    
    return await ctx.db.query(sql.query,sql.values);
  }
}

module.exports= dbquery;