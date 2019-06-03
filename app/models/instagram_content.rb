# == Schema Information
#
# Table name: instagram_contents
#
#  id                   :integer          not null, primary key
#  instagram_account_id :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  images               :string
#

class InstagramContent < ApplicationRecord
  #mount_uploaders :images, ImageUploader
  #serialize :avatars, JSON # If you use SQLite, add this line.
  belongs_to :instagram_account

  def fetch_images

    # URLにアクセスするためのライブラリの読み込み
    require 'open-uri'
    # Nokogiriライブラリの読み込み
    require 'nokogiri'
    # html解析の読み込み
    require 'uri'

    puts "-----"
    puts "#{Dir.pwd}"

    output_dir = "#{Dir.pwd}/app/assets/images"
    #output_dir = "/Users/match/Desktop/GitHub/myboard/app/assets/images"


    output_file_pref = "example"
    reg_exp_inkphy_image = '//div[@class="item"]//div[@class="media"]//a[@class="mask"]//@style'

    url = "https://inkphy.com/user/"+self.instagram_account.account_name

    # Htmlの取得
    charset = nil
    html = open(url) do |f|
      charset = f.charset # 文字種別を取得
      f.read # htmlを読み込んで変数htmlに渡す
    end

    # htmlをパース(解析)してオブジェクトを生成
    doc = Nokogiri::HTML.parse(html, nil, charset)

    # タイトルを表示
    p doc.title

    # 画像保管先のURL格納用
    img_paths = []

    # 画像保管先のURL格納処理
    doc.xpath(reg_exp_inkphy_image).each do |node|
      img_path = URI.extract(node.to_s.to_s.gsub!(/\);/, '') , ["https"])
      img_paths.push(img_path[0])
    end

    # 保存用ファイルネーム
    output_name = "#{output_dir}/#{output_file_pref}"

    # 保存先ファイルパス用
    output_image_local_paths = []

    # Webから画像を取得し、JPGとして保存
    img_paths.each_with_index do |img_path, i|
      open(img_path) do |file|
        file_name = "#{output_name}_#{i}.jpg"
        open(file_name, "w+b") do |out|
          out.write(file.read)
        end
        output_image_local_paths.push file_name
      end
    end

    return output_image_local_paths.first
  end
end
