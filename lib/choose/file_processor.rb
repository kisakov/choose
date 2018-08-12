require 'fileutils'

module FileProcessor
  def self.move!(original_dir, choosen_dir)
    original_files = Dir["#{original_dir}/*"].map { |file| filename(file) }
    choosen_files = Dir["#{choosen_dir}/*"].map { |file| filename(file) }
    extra_files = original_files - choosen_files

    dst_dir = "extra"
    FileUtils.mkdir_p(dst_dir)

    Dir["#{original_dir}/*"].select do |original_file|
      extra_files.include?(File.basename(original_file, '.*'))
    end.tap do |files|
      if files.any?
        puts "Moving files:"
      else
        puts "Nothing to move!"
      end
    end.each do |file|
      dst = "#{dst_dir}/#{File.basename(file)}"
      puts "  #{file} -> #{Dir.pwd}/#{dst}"
      FileUtils.mv(file, dst)
    end.tap do |files|
      puts "#{files.size} file(s) mooved to #{Dir.pwd}/extra folder" if files.any?
    end
  end

  private

  def self.filename(file)
    File.basename(file, '.*')
  end
end
