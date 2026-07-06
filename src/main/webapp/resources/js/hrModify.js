$(function() {
    $('#textarea').keyup(function (e){
        var textarea = $(this).val();
        $(this).height(((textarea.split('\n').length + 1) * 1.5) + 'em');
        $('#textareaCnt').html(textarea.length + '/2000');
    });
    $('#textarea').keyup();
});
