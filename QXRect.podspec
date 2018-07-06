Pod::Spec.new do |s|

s.name         = "QXRect"
s.version      = "0.0.2"
s.summary      = "A super easy use frame tool for iOS views."
s.description  = <<-DESC
Based on rects relations such as left right top bottom center offset etc. Enjoy!
DESC
s.homepage     = "https://github.com/labi3285/QXRect"
s.license      = "MIT"
s.author       = { "labi3285" => "766043285@qq.com" }
s.platform     = :ios, "8.0"
s.source       = { :git => "https://github.com/labi3285/QXRect.git", :tag => "#{s.version}" }
s.source_files  = "QXRect/QXRect/*.swift"
s.requires_arc = true

end
