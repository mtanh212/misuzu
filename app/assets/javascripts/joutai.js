// init search table
$(function() {
    oTable = $('#joutaimaster').DataTable({
        "pagingType": "full_numbers"
        , "oLanguage": {
            "sUrl": "../../assets/resource/dataTable_ja.txt"
        }
        ,"aoColumnDefs": [
            { "bSortable": false, "aTargets": [ 8,9,10 ]},
            {
                "targets": [8,9,10],
                "width": '15px'
            }
        ],
        "columnDefs": [ {
            "targets"  : 'no-sort',
            "orderable": false
        }]
    });
});

//colorpicker
$(function(){
    $('#joutaimaster_色').colorpicker();
});