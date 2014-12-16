Pod::Spec.new do |s|

  s.name         = "FZImageUtilCategory"
  s.version      = "0.0.1"
  s.summary      = "Some useful methods for UIImage, written in category. Like scaling, cropping."

  s.description  = <<-DESC
			It is very easy to use this lib to :
			1.create thumbnails.
			2.generate single color image
			3.scale image
			4.crop image
                   DESC

  s.homepage     = "https://github.com/jiecao-fm/FZImageUtilCategory.git"

  s.license      = "MIT"

  s.author             = { "Shannon" => "shannonchou@126.com" }
  s.social_media_url   = "https://twitter.com/shannonchou1988"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.platform     = :ios, "6.0"

  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.source       = { :git => "https://github.com/jiecao-fm/FZImageUtilCategory.git", :tag => s.version.to_s }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.source_files  = "FZImageUtilCategory/**/*.*"
  s.requires_arc = true
end
