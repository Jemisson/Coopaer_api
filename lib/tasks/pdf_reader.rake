namespace :pdf do
  desc "Extract data from PDF"
  task :extract, [:filename] => :environment do |task, args|
    file_path = args[:filename]
   
    if file_path.blank?
      raise ArgumentError, "O parâmetro 'filename' não pode estar vazio."
    end

    output = `python3 lib/tasks/read_pdf.py #{file_path}`
    SenarReportService.save_data(output)
  end
end
