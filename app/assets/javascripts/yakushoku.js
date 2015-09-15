//bind table
$(function(){
    oTable = $('#yakushoku_table').DataTable({
        "pagingType": "full_numbers",
        //"scrollX": true,
        //"scrollCollapse": true,
        "oLanguage":{
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