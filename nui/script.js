$(function() {
    window.addEventListener('message', function(event) {
        var data = event.data;

        if (data.type === "ui") {

            $("#reminder-title").text(data.title);
            $("#reminder-message").text(data.message);
            $("#reminder-closekey").text(data.closeKey);
            $("#reminder-closetext").text(data.closeText);

            if (data.status) {
                $("#reminder").fadeIn(500);
            } else {
                $("#reminder").fadeOut(500);
            }
        }
    });

    // ESC key closes UI
    document.onkeyup = function(data) {
        if (data.which == 27) {
            $.post('https://reminder-system/close', JSON.stringify({}));
        }
    };
});
