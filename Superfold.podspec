Pod::Spec.new do |s|

  s.name         = "SuperFold"
  s.version      = "1.1.3"
  s.summary      = "A clever category for folding and unfolding UIViews"
  s.homepage     = "https://github.com/rbobbins/animation-demo"
  s.author             = { "Rachel Bobbins" => "rachelheidi@gmail.com" }
  s.platform     = :ios
  s.ios.deployment_target = "7.0"
  s.source       = { :git => "https://github.com/rbobbins/animation-demo.git" }
  s.source_files = "Superfold", "Superfold/**/*.{h,m}"

end
