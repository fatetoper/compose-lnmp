(async ()=>{
  let {ok, data}=await $.ajax({
    url: `/api/car/${id}`,
    dataType: 'json'
  });

  data.images=data.images.split(',');

  $('#title').html(data.title);
  $('#top_img').attr('src', `/upload/${data.images[0]}`);
  $('.price').html('￥'+data.price);

  data.features.split(',').forEach(str=>{
    let [key,value]=str.split('|');

    // if(!key || !value){
    //   return;
    // }

    $(`<li><strong>${key}</strong> <span>${value||''}</span></li>`).appendTo('.specs');

    $(`<p>${key}：${value||''}</p>`).appendTo('#features');
  });

  data.description.split('\n').forEach(str=>{
    $(`<p>${str}</p>`).appendTo('#description');
  });

  data.images.forEach(img=>{
    $(`<img src="/upload/${img}" alt=""/>`).appendTo('#images');
  });
})();
