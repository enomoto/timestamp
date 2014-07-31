#! ruby -Ku
# coding: windows-31j
file = File.new("out.csv","w")
file.write("�t�@�C����,�^�C���X�^���v,�T�C�Y(�o�C�g),�t���p�X\n")
# �J�����g����Ȃ��Đ�΃p�X���w�肵�����ꍇ�́H�H�H
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
