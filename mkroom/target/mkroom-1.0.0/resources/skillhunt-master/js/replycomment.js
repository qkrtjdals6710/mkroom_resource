var replyJs=(function(){

//댓글 목록 조회
	function getReplyList(pagingParams,callback,error){
		var bno=pagingParams.bno;
		var page=pagingParams.page||1;
		
		console.log("bno: "+bno);
		console.log("page: "+page);
	
		$.ajax({
			type:"get",
			url:"/mkroom/replies/"+bno+"/page/"+page,
			dataType:"json",
			success: function(eventReplyCreatorDTO){
				if(callback){
					callback(eventReplyCreatorDTO);
				}
			},
			error: function(xhr,status,err){
				if(error){
					error(err);
				}
			}
		});	
	}	//getReplyList
	
//댓글 등록
	function registerReply(comment,callback,error){
		var bno=comment.bno;
		
		$.ajax({
			type:"post",
			url:"/mkroom/replies/"+bno+"/new",
			data: JSON.stringify(comment),
			contentType:"application/json;charset=utf-8",
			dataType:"text",
			success:function(result,status,xhr){
				if(callback){
					callback(result);
				}
			},
			error: function(xhr,status,err){
				if(error){
					error(err);
				}
			}
		});
	}	//registerReply
	
//대댓글 등록
	function registerRereply(reply, callback, error){
		var bno=reply.bno;
		var prno=reply.prno;
		
		$.ajax({
			type: "post",
			url: "/mkroom/replies/"+bno+"/"+prno+"/new",
			data: JSON.stringify(reply),
			contentType:"application/json;charset=utf-8",
			dataType:"text",
			success:function(result,status,xhr){
				if(callback){
					callback(result);
				}
			},
			error: function(xhr,status,err){
				if(error){
					error(err);
				}
			}
		});
	}	//registerRereply
	
//특정 댓글/대댓글 조회
	function getCmtReply(bnorno,callback,error){
		var bno=bnorno.bno;
		var rno=bnorno.rno;
		
		$.ajax({
			type:"get",
			url:"/mkroom/replies/"+bno+"/"+rno,
			dataType:"json",
			success: function(reply){
				if(callback){callback(reply);}
			},
			error: function(xhr,status,err){
				if(error){error(err);}
			}
		});
	} //getCmtReply
	
//댓글/대댓글 수정
	function modifyReply(comment,callback,error){
		var bno=comment.bno;
		var rno=comment.rno;
		$.ajax({
			type:"put",
			url:"/mkroom/replies/"+bno+"/"+rno,
			data: JSON.stringify(comment),
			contentType:"application/json;charset=utf-8",
			dataType:"text",
			success:function(result,status,xhr){
				if(callback){
					callback(result);
				}
			},
			error: function(xhr,status,err){
				if(error){
					error(err);
				}
			}
		});
	}	//modifyReply
	
//댓글 실삭제
	function removeReply(comment, callback, error){
		var bno=comment.bno;
		var rno=comment.rno;
		var rwriter=comment.rwriter;
		$.ajax({
			type:"delete",
			url:"/mkroom/replies/"+bno+"/"+rno,
			data: JSON.stringify({bno:bno, rno:rno, rwriter:rwriter}),
			contentType:"application/json;charset=utf-8",
			success:function(removeresult){
				if(callback){
					callback(removeresult);
				}
			},
			error: function(xhr,status,err){
				if(error){
					error(err);
				}
			}
		});
	}	//removeReply
	
	return{
		getReplyList:getReplyList,
		registerReply:registerReply,
		registerRereply:registerRereply,
		getCmtReply:getCmtReply,
		modifyReply:modifyReply,
		removeReply:removeReply
	};
})();
		