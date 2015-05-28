// init search table
$(function() {
    oTable = $('#shainmaster').DataTable({
        "pagingType": "simple_numbers"
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