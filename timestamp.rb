#! ruby -Ku
# coding: windows-31j
file = File.new("out.csv","w")
file.write("ファイル名,タイムスタンプ,サイズ(バイト),フルパス\n")
# カレントじゃなくて絶対パスを指定したい場合は？？？
Dir.glob("**/*") do |f|
  fs = File::Stat.new(f)
  if fs.size == 0
    name = f
    size = ""
    timestamp = ""
  elsif
    name = f.split("/")[-1]
    size = fs.size.to_s
    timestamp = fs.mtime.strftime("%Y/%m/%d %X").to_s
  end
  file.write(name + "," + timestamp + "," + size  + "," + f + "\n")
end
file.close
