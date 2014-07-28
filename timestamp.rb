csv = File.new("out.csv","w")
csv.write("'ファイル名','更新時刻','ファイルサイズ(バイト)'\r\n")
Dir.glob("/Users/enomoto/Desktop/code/ruby/**/*") do |f|
  fs = File::Stat.new(f)
  csv.write("'" + f + "','" + fs.mtime.strftime("%Y/%m/%d %X").to_s + "','" + f.size.to_s + "'\r\n")
  if /\/*\./ =~ f
    p f
  end
end
