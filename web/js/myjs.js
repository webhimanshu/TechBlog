//function doLike(pid, uid)
//                {
//                    
//                    console.log(pid+" "+uid);
//                    const d={
//                        uid:uid,
//                        pid:pid,
//                        operation:"Like",
//                    }
//                 $.ajax({
//                     url:"LikeServlet",
//                     data:d,
//                     success: function (data, textStatus, jqXHR) {
//                   console.log(data);
//        },
//        error: function (jqXHR, textStatus, errorThrown) {
//            console.log(data);
//        }
//                 });
//                    
//                }
//                 
////                    $.ajax({
////                        url:"LikeServlet",
////                        data:d,
////                        success: function (data, textStatus, jqXHR) {
////                        console.log(data);
////                        if(data.trim()=='true')
////                        {
////                            let c=$(".like-counter").html();
////                            console.log(c);
////                            c++;
////                            $('.like-counter').html(c);
////                        }
////                        
////                    },
////                    error: function (jqXHR, textStatus, errorThrown) {
////                        console.log(data);
////                    }
////                    });
//                
//        