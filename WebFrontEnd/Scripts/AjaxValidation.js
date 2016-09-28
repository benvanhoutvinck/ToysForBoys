function SendPost(actionPath) {
    $.ajax({
        url: actionPath,
        type: 'POST',
        dataType: 'json',
        data:
        {
            Text: $('#CustomerViewModel_email').val(),
           
        },
        success: function (data) {
            alert('success');
        },
        error: function () {
            alert('error');
        }
    });
}