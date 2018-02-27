
Pod::Spec.new do |s|
  s.name         = "SRTableView"
  s.version      = "1.0.0"
  s.summary      = "A TableView more conveniently"
  s.description  = <<-DESC
                    A TableView more conveniently，Use the language is Objective - C
                   DESC
  s.homepage     = "https://github.com/suoxiaoxiao/SRTableView"
  s.license      = "MIT"
  s.author             = { "suoxiaoxiao" => "sxiao1229@sina.com" }
  s.source       = { :git => "https://github.com/suoxiaoxiao/SRTableView.git", :tag => "1.0.0" }
  s.platform            = :ios, '8.0'
  s.source_files        = "SRTableView/*.{h,m}"
  s.public_header_files = "SRTableView/*.h"
  s.frameworks          = "Foundation", "UIKit"
  s.requires_arc        = true

end
