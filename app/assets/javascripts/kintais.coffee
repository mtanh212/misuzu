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
  $(document).on 'click', '.refer-joutai', (event) ->
    $('#joutai_search_modal').modal('show')
#    status = 1
    event.preventDefault()

#  $(document).on 'click', '.status2', (event) ->
#    $('#joutai_search_modal').modal('show')
#    status = 2
#    event.preventDefault()
#
#  $(document).on 'click', '.status3', (event) ->
#    $('#joutai_search_modal').modal('show')
#    status = 3
#    event.preventDefault()

  oJoutai_search_modal = $('#joutai_table').DataTable({
    "pagingType": "simple_numbers"
    ,"oLanguage":{
      "sUrl": "../../assets/resource/dataTable_ja.txt"
    }})

  $('#joutai_table tbody').on 'click', 'tr', (event) ->
    d = oJoutai_search_modal.row(this).data()
    $('#kintai_状態1').val(d[0])
    $('.joutai-code-hint').text(d[1])
    if d[1] == '振休'
      $('#joutai_search_modal').modal('hide')
      $('#daikyu_search_modal').modal('show')

    #    switch status
#      when 1 then $('.status1-code').val(d[0])
#      when 2 then $('.status2-code').val(d[0])
#      when 3 then $('.status3-code').val(d[0])

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
    $('.sum7').text(data.summary.sum7)
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

  $('#kintai_勤務タイプ').on('change',() ->
    selected_val = $(this).val()
    start_time = ' '
    end_time = ' '
    switch (selected_val)
      when '001'
        start_time += '07:00'
        end_time += '16:00'
      when '002'
        start_time += '07:30'
        end_time += '16:30'
      when '003'
        start_time += '08:00'
        end_time += '17:00'
      when '004'
        start_time += '08:30'
        end_time += '17:30'
      when '005'
        start_time += '09:00'
        end_time += '18:00'
      when '006'
        start_time += '09:30'
        end_time += '18:30'
      when '007'
        start_time += '10:00'
        end_time += '19:00'
      when '008'
        start_time += '10:30'
        end_time += '19:30'
      when '009'
        start_time += '11:00'
        end_time += '20:00'
    $('#kintai_出勤時刻').val(moment().format('YYYY/MM/DD') + start_time)
    $('#kintai_退社時刻').val(moment().format('YYYY/MM/DD') + end_time)
  )

  oDaikyuTable = $('.daikyutable').DataTable({
    "pagingType": "simple_numbers"
    ,"oLanguage":{
      "sUrl": "../../assets/resource/dataTable_ja.txt"
    }
  })

  $('.daikyutable tbody').on 'click', 'tr', (event) ->
    d = oDaikyuTable.row(this).data()
    $('#kintai_代休相手日付').val(d[0])
    $('#kintai_代休取得区分').val('1')
    $('#kintai_備考').val(d[0] + 'の振休')

    if ( $(this).hasClass('selected') )
      $(this).removeClass('selected')
      $(this).removeClass('success')
    else
      oDaikyuTable.$('tr.selected').removeClass('selected')
      oDaikyuTable.$('tr.success').removeClass('success')
      $(this).addClass('selected')
      $(this).addClass('success')