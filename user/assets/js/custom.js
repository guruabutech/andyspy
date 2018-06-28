$(document).ready(function () {
    $("form.ajax-form").ajaxForm({
        dataType: 'json',
        beforeSubmit: function (formData, jqForm, options) {
            if ($(jqForm).attr("callback"))
                window[$(jqForm).attr("callback")]();
            formData.push({name: "request", required: true, type: "text", value: $(jqForm).attr("name")});
            $(jqForm).find(".notification").html("");
            $(jqForm).find("button[type='submit'],input[type='submit']").attr("disabled", "disabled");
            $(jqForm).find(".notification").html("<div class='text-center'><img style='width: 100px;' src='assets/img/loading.gif'></div>");
        },
        uploadProgress: function (event, position, total, percentComplete) {

        },
        success: function (json, statusText, xhr, $form) {
            onRequestResponse(json);
            if (json.status && !json.keepFormData) $form.trigger("reset");
            if (json.type && json.message) {
                $($form).find(".notification").html("<div class='alert alert-" + json.type + "'><button type='button' class='close' data-dismiss='alert'>×</button><strong>" + json.title + "</strong> " + json.message.replace(/new-line/gi, '<br>') + " </div>");
            }
            $form.find("button[type='submit'],input[type='submit']").removeAttr("disabled");
        },
        error: function (data) {
            console.log(data.responseText);
        }
    });
});

function onRequestResponse(json) {
    if (json.callback) {
        if (json.callbackData) window[json.callback](json.callbackData);
        else window[json.callback]();
    }
    if (json.redirect) setTimeout(function () {
        window.location.href = json.redirect
    }, json.timeBeforeRedirect);
    if (json.type && json.message) {
        var types = {
            "danger": "error",
            "success": "success",
            "warning": "warning"
        };
        swal({
            title: json.title,
            text: json.message,
            type: types[json.type],
            confirmButtonClass: "btn-" + json.type
        });
    }
    return json.status;
}


