//章节笔记
$('.list-tabs ul li:first-child').addClass('play-active');
$('.kc-zj').on('click',function(){
	$('.kc-zj').removeClass('play-active');
	$(this).addClass('play-active');
	$('.play-con').css('display','none');
	$('.play-con').eq($(this).index()).css('display','block');
});
//我的笔记和同学笔记
$('.note ul li:first-child').addClass('note-active');
$('.kc-bj').on('click',function(){
	$('.kc-bj').removeClass('note-active');
	$(this).addClass('note-active');
	$('.note-con').css('display','none');
	$('.note-con').eq($(this).index()).css('display','block');
});
//课程详情切换
$('.left-tabs ul li:first-child').addClass('left-active');
$('.left-tabs .kcsm').on('click',function(){
	$('.left-tabs .kcsm').removeClass('left-active');
	$(this).addClass('left-active');
	$('.left-con').css('display','none');
	$('.left-con').eq($(this).index()).css('display','block');
});

//评论点赞
var cid=$("#cid").val();
	
var uid=$("#uid").val();
if(uid==null){
	uid=7;
}
var addzan={
		url:"addzan.action?cid="+cid+"&uid="+uid,
        type: "POST",  
        dataType: 'json',    	
};
var deletezan={
		url:"deleteZan.action?cid="+cid+"&uid="+uid,
        type: "POST",  
        dataType: 'json',
};
$('.pldz').each(function(){
	if($(this).attr('data-btn') == 'true'){
		$(this).css('background-position-x','-152px');
		}else{
		
		$(this).css('background-position-x','-130px');
		}
});
$('.pldz').on('click',function(){
	if($(this).attr('data-btn') == 'false'){
		 $.ajax(addzan); 
		var num = parseInt($(this).next().html());
		$(this).attr('data-btn','true');
		$(this).css('background-position-x','-152px');
		$(this).next().html(num+1);
	}else{
		 $.ajax(deletezan); 
		var num = parseInt($(this).next().html());
		$(this).attr('data-btn','false');
		$(this).css('background-position-x','-130px');
		$(this).next().html(num-1);
	}

});


//视频点赞
var vid=$("#vid").val();

var addzan={
		url:"addzan.action?uid="+uid+"&vid="+vid,
        type: "POST",  
        dataType: 'json',    	
};
var deletezan={
		url:"deleteZanvo.action?uid="+uid+"&vid="+vid,
        type: "POST",  
        dataType: 'json',
};
$('.pldz-vo').each(function(){
	if($(this).attr('data-btn') == 'true'){
		$(this).css('background-position-x','-152px');
		}else{
		
		$(this).css('background-position-x','-130px');
		}
});
$('.pldz-vo').on('click',function(){
	
	if($(this).attr('data-btn') == 'false'){
		
		 $.ajax(addzan); 
		 
		var num = parseInt($(this).next().html());
		$(this).attr('data-btn','true');
		$(this).css('background-position-x','-152px');
		$(this).next().html(num+1);
		
	}else{
		 $.ajax(deletezan); 
		var num = parseInt($(this).next().html());
		$(this).attr('data-btn','false');
		$(this).css('background-position-x','-130px');
		$(this).next().html(num-1);
	}

});


//收藏点赞
var vid=$("#vid").val();

var addzancoll={
		url:"addCollects.action?uid="+uid+"&vid="+vid,
		
        type: "POST",  
        dataType: 'json',    	
};
var deletezancoll={
		url:"deleteCollect.action?uid="+uid+"&vid="+vid,
        type: "POST",  
        dataType: 'json',
};
$('.pldz-coll').each(function(){
	if($(this).attr('data-btn') == 'true'){
		$(this).css('background-position-x','-152px');
		}else{
		
		$(this).css('background-position-x','-130px');
		}
});
$('.pldz-coll').on('click',function(){
	if($(this).attr('data-btn') == 'false'){
		 $.ajax(addzancoll); 
		var num = parseInt($(this).next().html());
		$(this).attr('data-btn','true');
		$(this).css('background-position-x','-152px');
		$(this).next().html(num+1);
		
	}else{
		 $.ajax(deletezancoll); 
		var num = parseInt($(this).next().html());
		$(this).attr('data-btn','false');
		$(this).css('background-position-x','-130px');
		$(this).next().html(num-1);
	}

});