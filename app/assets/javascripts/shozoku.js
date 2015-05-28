// init search table
$(function() {
    oTable = $('#shozokumaster').DataTable({
        "pagingType": "simple_numbers"
        , "oLanguage": {
            "sUrl": "../../assets/resource/dataTable_ja.txt"
        },
        "aoColumnDefs": [
            { "bSortable": false, "aTargets": [ 2,3,4 ]},

            {
                "targets": [2,3,4],
                "width": '15px'
            }
        ],
        "columnDefs": [ {
            "targets"  : 'no-sort',
            "orderable": false
        }]

    });
});