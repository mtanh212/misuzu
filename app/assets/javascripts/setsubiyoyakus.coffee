# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  oTable = $('.setsubiyoyaku-table').DataTable({
    "pagingType": "full_numbers",
    "oLanguage":{
      "sUrl": "../../assets/resource/dataTable_ja.txt"
    },
    "columnDefs": [
      { "width": "15%", "targets": 0 },
      { "width": "15%", "targets": 1 },
      { "width": "20%", "targets": 2 },
      { "width": "20%", "targets": 3 }
      { "width": "30%", "targets": 4 }
    ],
    order: [[ 0, 'des' ]]
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

  oKaishaTable = $('#kaisha-table-modal').DataTable({
    "pagingType": "full_numbers"
    , "oLanguage": {
      "sUrl": "../../assets/resource/dataTable_ja.txt"
    }
  })

  $('#kaisha-table-modal tbody').on 'click', 'tr', (event) ->
    d = oKaishaTable.row(this).data()
    $('#setsubiyoyaku_相手先').val(d[0])
    $('#kaisha-name').text(d[1])

    if ( $(this).hasClass('selected') )
      $(this).removeClass('selected')
      $(this).removeClass('success')
    else
      oKaishaTable.$('tr.selected').removeClass('selected')
      oKaishaTable.$('tr.success').removeClass('success')
      $(this).addClass('selected')
      $(this).addClass('success')

  $(document).on 'click', '.refer-kaisha', (event) ->
    $('#kaisha-search-modal').modal('show')
    event.preventDefault()
