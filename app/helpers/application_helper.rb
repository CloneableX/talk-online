module ApplicationHelper
  def javascript_pack_tag_if_exists(filename, *options)
    file_path = "#{Webpacker.config.source_entry_path}/#{filename}.js"
    javascript_pack_tag(filename, *options) if File.exists?(file_path)
  end
end
