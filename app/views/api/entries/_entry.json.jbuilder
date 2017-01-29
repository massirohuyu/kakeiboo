json.extract! entry,
              :id,
              :action_date,
              :amount,
              :description,
              :created_at,
              :updated_at

json.action_date  l(entry.action_date)
json.created_at   l(entry.created_at)
json.updated_at   l(entry.updated_at)

json.book       entry.book, :id, :name
json.item       entry.item,   :id, :name
json.detail     entry.detail, :id, :name
json.input_user entry.input_user.name
