// init search table
$(function() {
    oTable = $('#holiday_table').DataTable({
        "pagingType": "full_numbers"
        , "oLanguage": {
            "sUrl": "../../assets/resource/dataTable_ja.txt"
        }
        ,"aoColumnDefs": [
            { "bSortable": false, "aTargets": [ 3,4,5 ]},
            {
                "targets": [3,4,5],
                "width": '15px'
            }
        ],
        "columnDefs": [ {
            "targets"  : 'no-sort',
            "orderable": false
        }]
    });
});

//init datetimepicker
$(function(){
    $('#jpt_holiday_mst_event_date').datetimepicker({
        format: 'YYYY/MM/DD',
        widgetPositioning: {
            horizontal: 'left'
        },
        showTodayButton: true

    });
});