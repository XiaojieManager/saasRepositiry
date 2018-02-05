Pod::Spec.new do |s|
s.name     = 'saasRepositiry'
s.version  = '0.0.2'
s.license  = 'MIT'
s.summary  = 'Progress Bar Design with Percentage values.'
s.description  = <<-DESC
this project provide all kinds of categories for iOS developer   //描述
DESC

s.homepage = 'https://github.com/XiaojieManager/saasRepositiry.git'
s.author   = { "xiaozhao" => "xiaojie__zhao@163.com" }
s.source  = { :git => "https://github.com/XiaojieManager/saasRepositiry.git", :tag => "0.0.2" }
s.platform = :ios

s.source_files = 'saasRepositiry','XZUtils/**/*.{h,m}'
s.requires_arc = true
end
