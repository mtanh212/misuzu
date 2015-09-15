// init search table
$(function() {
    oTable = $('#jobmaster').DataTable({
        "pagingType": "full_numbers"
        , "oLanguage": {
            "sUrl": "../../assets/resource/dataTable_ja.txt"
        }
        ,"aoColumnDefs": [
            { "bSortable": false, "aTargets": [ 6,7,8 ]},
            {
                "targets": [6,7,8],
                "width": '15px'
            }
        ],
        "columnDefs": [ {
            "targets"  : 'no-sort',
            "orderable": false
        }]
    });
});


$(function(){
    //date_goto.showTodayButton(true);
    $('#jobmaster_開始日').datetimepicker({
        format: 'YYYY/MM/DD'
        ,showTodayButton: true
    });

    $('#jobmaster_終了日').datetimepicker({
        format: 'YYYY/MM/DD'
        ,showTodayButton: true

    });

    $("#jobmaster_開始日").on("dp.change", function (e) {
        $('#jobmaster_終了日').data("DateTimePicker").minDate(e.date);
    });

    $("#jobmaster_終了日").on("dp.change", function (e) {
        $('#jobmaster_開始日').data("DateTimePicker").maxDate(e.date);
    });

});