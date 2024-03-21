# frozen_string_literal: true

class SenarReportService
  class << self
    def save_data(data)
      parsed_data = JSON.parse(data)

      parsed_data.each do |entry|
        save_senar_report(entry)
      end
    end

    def save_senar_report(entry)
      name = entry['name']
      event = entry['event']
      event_init_date = entry['event_init_date']
      event_finish_date = entry['event_finish_date']
      amount = entry['amount']

      profile_member = find_profile_member(name)

      if profile_member.present?
        create_senar_report(profile_member, name, event, event_init_date, event_finish_date, amount)
      else
        puts "Profile member with name '#{name}' not found."
      end
    end

    def find_profile_member(name)
      ProfileMember.where('LOWER(name) = ?', name.downcase).first
    end

    def create_senar_report(profile_member, name, event, event_init_date, event_finish_date, amount)
      senar_report = SenarReport.new(
        profile_member_id: profile_member.id,
        name: name,
        event: event,
        event_init_date: event_init_date,
        event_finish_date: event_finish_date,
        amount: amount
      )

      if senar_report.save
        puts "Senar report saved for profile member: #{name}"
      else
        puts "Error saving Senar report for profile member: #{name}"
        puts "Errors: #{senar_report.errors.full_messages}"
      end
    end
  end
end
