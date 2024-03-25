# frozen_string_literal: true

class SenarReportSerializer
  include JSONAPI::Serializer
  attributes :id, :profile_member_id, :name, :event, :event_init_date, :event_finish_date, :amount,
             :invoice, :receipt, :created_at
end
1
