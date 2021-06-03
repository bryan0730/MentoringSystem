/**
 * 
 */
     $("input:radio[name=authorities]").click(function(){
        
        if($("input:radio[name=authorities]:checked").val()=='ROLE_MENTO'){
            $("#memberMajor").css("display", "none");
            $("#memberSchool").css("display", "none");
            $("#memberAddmission").css("display", "none");
            $("#memberTrack").css("display", "none");
        }else{
            $("#memberMajor").css("display", "inline-block");
            $("#memberSchool").css("display", "inline-block");
            $("#memberAddmission").css("display", "inline-block");
            $("#memberTrack").css("display", "inline-block");                   
        }
    });