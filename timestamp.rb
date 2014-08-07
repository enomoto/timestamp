#! ruby -Ku
# coding: windows-31j
require 'csv'

files = []
Dir.glob('**/*') do |f|
  fs = File::Stat.new(f)
  if fs.size == 0
    name = f
    size = ''
    timestamp = ''
  else
    name = f.split('/')[-1]
    size = fs.size.to_s
    timestamp = fs.mtime.strftime('%Y/%m/%d %X').to_s
  end
  files << [name, size, timestamp]
end

headers = %w(ファイル名 タイムスタンプ サイズ(バイト) フルパス)
csv_string = CSV.generate('', write_headers: true, headers: headers) do |csv|
  files.each do |file|
    csv << file
  end
end

csv = File.new('out.csv', 'w')
csv.write(csv_string)
csv.close
