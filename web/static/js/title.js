$('#btn-login').click(function(){

});
function search(type,value) {
    $.ajax({
        type: "GET",
        url: "/web_war_exploded/search",
        dataType: "json",
        data:{
            type: type,
            value: value
        },
        success: function (data) {

        },
        error: function (e) {
            alert("发送验证码失败");
        }
    });
}