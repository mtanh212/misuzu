# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  shokairan_table = $('.shokairan-table').DataTable({
    "pagingType": "simple_numbers"
    ,"oLanguage":{
      "sUrl": "../../assets/resource/dataTable_ja.txt"
    },
    columnDefs: [
      { "width": "10%", "targets": 0 },
      { "width": "10%", "targets": 1 },
      { "width": "10%", "targets": 2 },
      { "width": "50%", "targets": 3 }
    ],
    order: [[ 0, 'des' ]]
  })

  kairan_table = $('.kairan-table').DataTable({
    "pagingType": "simple_numbers"
    ,"oLanguage":{
      "sUrl": "../../assets/resource/dataTable_ja.txt"
    },
#    "aoColumnDefs": [
#      { "bSortable": false, "aTargets": [5 ]},
#      {"targets": [3],"width": '30%'},
#      {"targets": [5], "width": '5%'}
#    ],
#    "columnDefs": [
#      {"targets"  : 'no-sort',"orderable": false}
#    ]

#    "columnDefs": [
#      { "width": "30%", "targets": 3 },
#      { "width": "5%", "targets": 4 },
#      {"targets"  : 'no-sort', "orderable": false }
#    ]

    columnDefs: [ {orderable: false, className: 'select-checkbox',targets: 6},
      { "width": "13%", "targets": 0 },
      { "width": "13%", "targets": 1 },
      { "width": "13%", "targets": 1 },
      { "width": "20%", "targets": 2 },
      { "width": "6%", "targets": 4 },
      { "width": "6%", "targets": 5 },
      { "width": "5%", "targets": 6 },
      { "targets": [ 7 ], "visible": false, "searchable": false },
      { "targets": [ 8 ], "visible": false, "searchable": false },
    ],
    select: {
#      style:    'os',
      style:    'multi',
      selector: 'td:last-child'
    },
    order: [[ 0, 'des' ]],
    dom: 'Bfrtip',
    buttons: [
#      'selected',
#      'selectedSingle',
      'selectAll',
      'selectNone'
#      'selectRows',
#      'selectColumns',
#      'selectCells'
    ],
  })

  shain_table = $('.shain-table').DataTable({
    "pagingType": "simple_numbers",
    "oLanguage":{
      "sUrl": "../../assets/resource/dataTable_ja.txt"
    },
#    "aoColumnDefs": [
#      { "bSortable": false, "aTargets": [0]},
#      {
#        "targets": [0],
#        "width": '20%'
#      }
#    ],
#    "columnDefs": [{
#      "targets"  : 'no-sort',
#      "orderable": false
#    }],
    columnDefs: [ {
      orderable: false,
      className: 'select-checkbox',
      targets:   0
    } ],
    select: {
#      style:    'os',
      style:    'multi',
      selector: 'td:first-child'
    },
    order: [[ 1, 'asc' ]],
    dom: 'Bfrtip',
    buttons: [
#      'selected',
#      'selectedSingle',
      'selectAll',
      'selectNone'
#      'selectRows',
#      'selectColumns',
#      'selectCells'
    ],
#    select: true
  })

  $('.datetime').datetimepicker({
    format: 'YYYY/MM/DD HH:mm',
    showTodayButton: true,
    showClear: true,
    sideBySide: true,
    calendarWeeks: true,
    toolbarPlacement: 'top',
    keyBinds: false,
    focusOnShow: false
#    defaultDate: '2016/03/14 09:00'
  })

  $('#kairan').click () ->
    selected_rows = shain_table.rows( { selected: true } ).data()
    shainNo = []
    for row in selected_rows
      shainNo.push(row[1])
    $('#shain').val(shainNo.toString())

  $('#kakunin').click () ->
    selected_rows = kairan_table.rows( { selected: true } ).data()
    kairanNo = []
    for row in selected_rows
      kairanNo.push(row[7])
    $('#checked').val(kairanNo.toString())

