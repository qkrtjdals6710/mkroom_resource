var reviewJs=(function(){

//리뷰 목록 조회
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
	
//게시글에 대한 리뷰 평점 조회
	function getReviewAvg(comment,callback,error){
		var questName=comment.questName;
		var branchLocation=comment.branchLocation;
		$.ajax({
			type:"get",
			url:"/mkroom/reviews/"+questName+"/"+branchLocation+"/avg",
			dataType:"text",
			success: function(avg){
				if(callback){
					callback(avg);
				}
			},
			error: function(xhr,status,err){
				if(error){
					error(err);
				}
			}
		});
	}	//getReviewAvg
	
//리뷰 등록
	function registerReview(comment,callback,error){
		var questName=comment.questName;
		var branchLocation=comment.branchLocation;
		$.ajax({
			type:"post",
			url:"/mkroom/reviews/"+questName+"/"+branchLocation+"/new",
			data: JSON.stringify(comment),
			dataType: "text",
			contentType:"application/json;charset=utf-8",
			beforeSend: function(xhr) {
                xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
             },
			success:function(result,status,xhr){
				if(callback){
					callback(result);
				}
			}
		});
	}	//registerReview
	
//특정 리뷰 조회
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
	
//리뷰 수정
	function modifyReview(comment,callback,error){
		var questName=comment.questName;
		var branchLocation=comment.branchLocation;
		var rno=comment.rno;
		$.ajax({
			type:"put",
			url:"/mkroom/reviews/"+questName+"/"+branchLocation+"/"+rno,
			data: JSON.stringify(comment),
			contentType:"application/json;charset=utf-8",
			dataType:"text",
			beforeSend: function(xhr) {
                xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
             },
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
	
//리뷰 실삭제
	function removeReview(comment, callback, error){
		var rwriter=comment.rwriter;
		var rno=comment.rno;
		$.ajax({
			type:"delete",
			url:"/mkroom/reviews/"+rno+"/del",
			data: JSON.stringify(rno),
			contentType:"application/json;charset=utf-8",
			beforeSend: function(xhr) {
                xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
             },
			success:function(removeresult){
				if(callback){
					callback(removeresult);
					debugger;
				}
			},
			error: function(xhr,status,err){
				if(error){
					error(err);
					debugger;
				}
			}
		});
	}	//removeReview
	
	return{
		getReviewList:getReviewList,
		getReviewAvg:getReviewAvg,
		registerReview:registerReview,
		getCmtReview:getCmtReview,
		modifyReview:modifyReview,
		removeReview:removeReview
	};
})();
		