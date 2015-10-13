json.events @all_events do |event|
  json.extract! event, :id
  description = ''
  description = event.jobmaster.try(:job名) if event.jobmaster
  json.description description
  # json.title event.bashomaster.try :場所名
  kisha_flag = ''
  case event.try(:kisha)
    when '帰社'
      kisha_flag = '　◯'
    when '直帰'
      kisha_flag = '　☓'
    when '連続'
      kisha_flag = '　△'
  end
  title =''
  title = event.joutaimaster.try(:name) << kisha_flag if event.joutaimaster
  json.title title
  json.start event.try(:start_time)
  json.end event.try(:end_time)
  json.url edit_event_url(event, format: :html)
  json.resourceId event.shainmaster.id if event.shainmaster
  json.color event.joutaimaster.try(:色) if event.joutaimaster
  json.textColor event.joutaimaster.try(:text_color)  if event.joutaimaster
end

json.my_events @events do |my_event|
  json.extract! my_event, :id
  description = ''
  description = my_event.jobmaster.try(:job名) if my_event.jobmaster
  json.description description 
  # json.title event.bashomaster.try :場所名
  json.title my_event.joutaimaster.try(:name) if my_event.joutaimaster
  json.start my_event.try(:start_time)
  json.end my_event.try(:end_time)
  json.url edit_event_url(my_event, format: :html)
  json.resourceId my_event.shainmaster.id if my_event.shainmaster
  json.color my_event.joutaimaster.try(:color) if my_event.joutaimaster
  json.textColor my_event.joutaimaster.try(:text_color)  if my_event.joutaimaster
end

json.shains @shains do |shain|
  json.extract! shain, :id
  json.shain shain.try(:氏名)
  # json.joutai shain.events.first.shozai.try(:所在名) if shain.events.first
  event = shain.events.where("開始 < ? AND 終了 > ?",Time.now, Time.now).first
  joutai = ''
  joutai = event.shozai.try(:name) if event
  json.joutai joutai
  
  # json.joutai shain.events.where("開始 < ? AND 終了 > ?", Time.now, Time.now).first.joutaimaster.try(:状態名) if shain.events.where("開始 < ? AND 終了 > ?",Time.now, Time.now).first
  json.shozoku shain.shozokumaster.try(:所属名) if shain.shozokumaster
  json.yakushoku shain.yakushokumaster.try(:役職名) if shain.yakushokumaster
  # json.eventColor shain.events.first.joutaimaster.色 if shain.events.first
end

json.holidays @holidays do |holiday|
  json.extract! holiday, :id
  json.title holiday.try(:title)
  json.description holiday.try(:description)
  json.start holiday.try(:event_date)
  json.end holiday.try(:event_date)
  json.color 'red'
end