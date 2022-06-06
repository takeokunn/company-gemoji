require 'gemoji'

names = Emoji.all.flat_map do |emoji|
  emoji.aliases.map { |name| name }
end

jisyo_path = File.join(__dir__, 'company-gemoji-data.el')

File.open(jisyo_path, 'w') do |f|
  f << ";;; company-gemoji-data.el --- Terraform documentation as elisp lists and hashes\n"
  f << "\n"
  f << ";;; THIS FILE WAS AUTOMATICALLY GENERATED. DO NOT EDIT.\n"
  f << "\n"
  f << ";;; Code:\n"
  f << "\n"
  f << "(defconst company-gemoji-data-keywords\n"
  f << "  \'(\n"
  names.each do |name|
    f << "    \":#{name}:\"\n"
  end
  f << "    )\n"
  f << "  \"Keywords of the gemoji.\")\n"
  f << "\n"
  f << "(provide \'company-gemoji-data)"
end
