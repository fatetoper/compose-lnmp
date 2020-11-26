(async ()=>{
  $('.sendButton').click(async function (){
    let form=new FormData($('#form1')[0]);

    let {ok}=await $.ajax({
      url: '/api/msg',
      method: 'post',
      data: form,
      processData: false,
      contentType: false
    });

    if(ok){
      alert('留言成功，我们会尽快于您取得联系');
    }else{
      alert('留言提交失败，请稍后重试');
    }
  });
})();
