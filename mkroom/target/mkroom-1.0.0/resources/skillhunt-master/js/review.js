var reviewJs=(function(){

//댓글 목록 조회
	function getReviewList(pagingParams,callback,error){
		var questName=pagingParams.questName;
		var branchLocation=pagingParams.branchLocation;
		var page=pagingParams.page||1;
	
		$.ajax({
			type:"get",
			url:"/mkroom/reviews/"+questName+"/"+branchLocation+"/page/"+page,
			dataType:"json",
			success: function(reviewCreatorDTO){
				if(callback){
					callback(reviewCreatorDTO);
				}
			},
			error: function(xhr,status,err){
				if(error){
					error(err);
				}
			}
		});	
	}	//getReviewList
	
//댓글 등록
	function registerReview(comment,callback,error){
		var questName=comment.questName;
		var branchLocation=comment.branchLocation;
		console.log("post url: "+"/mkroom/reviews/"+questName+"/"+branchLocation+"/new");
		$.ajax({
			type:"post",
			url:"/mkroom/reviews/"+questName+"/"+branchLocation+"/new",
			data: JSON.stringify(comment),
			dataType: "json",
			contentType:"application/json;charset=utf-8",
			beforeSend: function(xhr) {
                xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
             },
			success:function(result){
				if(callback){
					callback(result);
				}
			},
			error: function(xhr, status,err) {
				if(error){error(err);}
				debugger;
			}
		});
	}	//registerReview
	
//특정 댓글 조회
	function getCmtReview(bnorno,callback,error){
		var questName=bnorno.questName;
		var branchLocation=bnorno.branchLocation;
		var rno=bnorno.rno;
		
		$.ajax({
			type:"get",
			url:"/mkroom/reviews/"+questName+"/"+branchLocation+"/"+rno,
			dataType:"json",
			success: function(reply){
				if(callback){callback(reply);}
			},
			error: function(xhr,status,err){
				if(error){error(err);}
			}
		});
	} //getCmtReview
	
//댓글/대댓글 수정
	function modifyReview(comment,callback,error){
		var questName=comment.questName;
		var branchLocation=comment.branchLocation;
		var rno=comment.rno;
		var ratingStar=comment.ratingStar;
		$.ajax({
			type:"put",
			url:"/mkroom/reviews/"+questName+"/"+branchLocation+"/"+rno,
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
	}	//modifyReview
	
//댓글 실삭제
	function removeReview(comment, callback, error){
		var bno=comment.bno;
		var branchLocation=comment.branchLocation;
		var rwriter=comment.rwriter;
		$.ajax({
			type:"delete",
			url:"/mkroom/replies/"+questName+"/"+branchLocation+"/"+rno,
			data: JSON.stringify({questName:questName, branchLocation:branchLocation, rno:rno, rwriter:rwriter}),
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
	}	//removeReview
	
	return{
		getReviewList:getReviewList,
		registerReview:registerReview,
		getCmtReview:getCmtReview,
		modifyReview:modifyReview,
		removeReview:removeReview
	};
})();
		