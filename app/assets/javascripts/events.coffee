jQuery ->
  kousu = []
  countup = 0
  until countup > 1000
    kousu.push(countup)
    countup += 0.25

  $('.kousu-keisan').click (event) ->
    start_time = $('#event_開始').val()
    end_time = $('#event_終了').val()
    diff = moment(end_time,'YYYY/MM/DD HH:mm').diff(moment(start_time,'YYYY/MM/DD HH:mm'),'hours', true)
#    check refresh time
#    if diff > 4 && diff < 5
#      diff = 4
#    if diff >= 5 && diff <= 9
#      diff -= 1
#    if diff > 9 && diff < 10
#      diff = 8
#    if diff >= 10
#      diff -= 2
    for num in kousu
      if num > diff && num > 0
        $('#event_工数').val(num-0.25)
        break

#  保留中 →
  $('.add-row').click () ->
    val = []
    val.push($('#basho-code').val())
    val.push($('#basho-name').val())

    jQuery.ajax({
      url: '/events/event_basho_add',
      data: {id: 'event_basho_add', data: val},
      type: "POST",
#    // processData: false,
#    // contentType: 'application/json',
      success: (data) ->
        oBashoTable.row.add(val).draw(false)
      ,failure: () ->
        console.log("場所 追加 失敗")
    })

#  $('#save_kinmu_type').click () ->
  $('#shainmaster_勤務タイプ').on('change', () ->
#    val = $('#shainmaster_勤務タイプ').val()
    val = $(this).val()
    jQuery.ajax({
      url: '/events/ajax',
      data: {id: 'save_kinmu_type', data: val},
      type: "POST",
      success: (data) ->
#        alert('勤務タイプ保存！')
      failure: () ->
        console.log("save-kinmu-type field")
    }))

  $('#shainmaster_所在コード').on('change', () ->
    val = $(this).val()
    jQuery.ajax({
      url: '/events/ajax',
      data: {id: 'change_shozai', data: val},
      type: "POST",
      success: (data) ->
        location.reload()
      failure: () ->
        console.log("change_shozai field")
    }))