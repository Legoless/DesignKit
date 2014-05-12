Pod::Spec.new do |s|

  s.name         = "DesignKit"
  s.version      = "0.1.0"
  s.summary      = "A collection of simple iOS classes and categories that fit in almost every project."

  s.description  = <<-DESC
                   DesignKit contains a collection of simple iOS classes and small libraries that fit in almost every project. Most of these classes are not large or structured enough to fit in a special library or framework, but are regurarely needed throughout the most projects you are working on.
                   DESC

  s.homepage     = "http://github.com/Legoless/DesignKit"
  s.license      = 'MIT'
  s.author       = { "Dal Rupnik" => "legoless@gmail.com" }
  s.platform     = :ios, '7.0'
  s.source       = { :git => "https://github.com/Legoless/DesignKit.git", :tag => "0.1.0" }

  s.source_files = 'DesignKit/**/*.{h,m}'
  s.requires_arc = true
end
