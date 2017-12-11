$(function () {
    $("#btnsubmit").click(function () {
        fsubmit();
    })
})

function fsubmit() {
    if ($("form").valid()) {
        $("form").submit();
        $("#btnsubmit").attr("disabled", true);
    }
}