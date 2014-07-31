#! ruby -Ku
# coding: windows-31j
file = File.new("out.csv","w")
file.write("ファイル名,タイムスタンプ,サイズ(バイト),フルパス\n")
# カレントじゃなくて絶対パスを指定したい場合は？？？
Dir.glob("**/*") do |f|
  fs = File::Stat.new(f)
  if fs.size == 0
    print_path = f
    print_size = ""
    print_timestamp = ""
  elsif
    print_path = f.split("/")[-1]
    print_size = fs.size.to_s 
    print_timestamp = fs.mtime.strftime("%Y/%m/%d %X").to_s
  end
  file.write(print_path + "," + print_timestamp + "," + print_size  + "," + f + "\n")
end
file.close
