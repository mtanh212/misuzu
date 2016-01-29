jQuery ->
  kousu = []
  countup = 0
  until countup > 10
    kousu.push(countup)
    countup += 0.25

  $('.kousu-keisan').click (event) ->
    start_time = $('#event_開始').val()
    end_time = $('#event_終了').val()
    diff = moment(end_time,'YYYY/MM/DD HH:mm').diff(moment(start_time,'YYYY/MM/DD HH:mm'),'hours', true)
    for num in kousu
      if num > diff && num > 0
        $('#event_工数').val(num-0.25)
        break