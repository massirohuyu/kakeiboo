json.extract! entry,
              :action_date,
              :item_id,
              :detail_id,
              :amount,
              :description,
              :input_user_id,
              :ownership_id,
              :created_at,
              :updated_at

json.url entry_url(entry, format: :json)
