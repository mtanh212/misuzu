json.events @all_events do |event|
  json.extract! event, :id
  json.description event.jobmaster.try(:job名).presence || event.joutaimaster.try(:状態名)
  # json.title event.bashomaster.try :場所名
  json.title event.joutaimaster.try(:状態名)
  json.start event.try(:開始)
  json.end event.try(:終了)
  json.url edit_event_url(event, format: :html)
  json.resourceId event.shainmaster.id if event.shainmaster
  json.color event.joutaimaster.色 if event.joutaimaster
  # json.textColor 'red' 
end

json.shains @shains do |shain|
  json.extract! shain, :id
  json.shain shain.try(:氏名)
  json.joutai shain.events.first.shozai.try(:所在名) if shain.events.first
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