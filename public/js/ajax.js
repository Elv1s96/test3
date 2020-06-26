$(document).ready(function () {
    $("#btn").click(
        function () {
            console.log('test123321');
            sendAjaxForm('alert', 'ajax_form', "/filter-by");
            return false;
        }
    );
});

function sendAjaxForm(alert, ajax_form, url) {
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
    $.ajax({

        url: url,
        type: "POST",
        dataType: "html",
        data: $("#" + ajax_form).serialize(),
        success: function (response) {
            console.log(response => response_message);
            result = $.parseJSON(response);
            if (result.response_message === 'Данные успешно отправлены') {
                $('#alert').html(
                    "<div class='container'><div class='alert alert-success'>"
                    + result.response_message +
                    "</div></div>"
                );
            } else {
                $('#alert').html(
                    "<div class='container'><div class='alert alert-danger'>"
                    + result.response_message +
                    "</div></div>"
                );
            }
        },
        error: function (response) {
            $('#alert').html(
                "<div class='container'><div class='alert alert-danger'>Ошибка. Данные не отправлены</div></div>"
            );
        }
    });
}
