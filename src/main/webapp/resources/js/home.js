$(document).ready(function(){
    (function(){
        if(history.state ===''){
            return;
        }
        var msg=$("#msg").val();
        if(msg!=''){
            alert(msg);
            history.replaceState('',null,null); 
        }
    })();
})
