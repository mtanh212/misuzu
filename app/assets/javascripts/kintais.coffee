# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('.date-search').datetimepicker({
    format: 'YYYY/MM',
    viewMode: 'months',
    keyBinds: false,
    focusOnShow: false
  })

  $('.date-edit').datetimepicker({
    format: 'YYYY/MM/DD',
#   //inline: true,
#   //widgetParent: 'container-fluid',
    showTodayButton: true,
#   //showClear: true,
#   //,daysOfWeekDisabled:[0,6]
#   //calendarWeeks: true,
    keyBinds: false,
    focusOnShow: false
  })

  $('#kintai_出勤時刻').datetimepicker({
    format: 'YYYY/MM/DD HH:mm',
    showClear: true,
    showTodayButton: true,
    sideBySide: true,
#  //,daysOfWeekDisabled:[0,6]
    calendarWeeks: true,
#  //allowInputToggle: true,
    toolbarPlacement: 'top',
    keyBinds: false,
    focusOnShow: false
  })
  
  $('#kintai_退社時刻').datetimepicker({
    format: 'YYYY/MM/DD HH:mm',
    showClear: true,
    showTodayButton: true,
    sideBySide: true,
#  //,daysOfWeekDisabled:[0,6]
    calendarWeeks: true,
#  //allowInputToggle: true,
    toolbarPlacement: 'top',
    keyBinds: false,
    focusOnShow: false
  })

  status = 0
  $(document).on 'click', '.status1', (event) ->
    $('#joutai_search_modal').modal('show')
    status = 1
    event.preventDefault()

  $(document).on 'click', '.status2', (event) ->
    $('#joutai_search_modal').modal('show')
    status = 2
    event.preventDefault()

  $(document).on 'click', '.status3', (event) ->
    $('#joutai_search_modal').modal('show')
    status = 3
    event.preventDefault()

  oJoutai_search_modal = $('#joutai_table').DataTable({
    "pagingType": "simple_numbers"
    ,"oLanguage":{
      "sUrl": "../../assets/resource/dataTable_ja.txt"
    }})

  $('#joutai_table tbody').on 'click', 'tr', (event) ->
    d = oJoutai_search_modal.row(this).data()
    switch status
      when 1 then $('.status1-code').val(d[0])
      when 2 then $('.status2-code').val(d[0])
      when 3 then $('.status3-code').val(d[0])

    if ( $(this).hasClass('selected') )
      $(this).removeClass('selected')
      $(this).removeClass('success')
    else
      oJoutai_search_modal.$('tr.selected').removeClass('selected')
      oJoutai_search_modal.$('tr.success').removeClass('success')
      $(this).addClass('selected')
      $(this).addClass('success')

#  $('.kintai-sum').click () ->
#    jQuery.ajax({
#      url: '/kintais/summary_kintai',
#      data: {id: 'kintaisum'},
#      type: "POST",
#      success: (data) ->
#        $('.sum1').text(data.sum1)
#        $('.sum2').text(data.sum2)
#        $('.sum3').text(data.sum3)
#        $('.sum4').text(data.sum4)
#        $('.sum5').text(data.sum5)
#        $('.sum6').text(data.sum6)
#      failure: () ->
#    })

  $.getJSON('/kintais/matching_date_return', (data) ->
    $('.sum1').text(data.summary.sum1)
    $('.sum2').text(data.summary.sum2)
    $('.sum3').text(data.summary.sum3)
    $('.sum4').text(data.summary.sum4)
    $('.sum5').text(data.summary.sum5)
    $('.sum6').text(data.summary.sum6)
  )

  $('#finish-input').click () ->
    date = $('#kintai_日付').val()
    jQuery.ajax({
      url: '/kintais/finish_input',
      data: {id: 'finish_input', date: date, checked: $(this).prop('checked')},
      type: "POST",
      success: (data) ->
        $('.finish-message').text(data.message)
      failure: () ->
    })
