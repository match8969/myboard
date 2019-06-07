class InstagramContentImageService

  attr_reader :instagram_account_name

  def initialize(instagram_account_name)
    @instagram_account_name = instagram_account_name
  end


  def fetch_image_paths
    url = "https://inkphy.com/user/#{@instagram_account_name}"
    reg_exp_inkphy_image = '//div[@class="item"]//div[@class="media"]//a[@class="mask"]//@style'

    # Htmlの取得
    charset = nil
    html = open(url) do |f|
      charset = f.charset # 文字種別を取得
      f.read # htmlを読み込んで変数htmlに渡す
    end
    # htmlをパース(解析)してオブジェクトを生成
    doc = Nokogiri::HTML.parse(html, nil, charset)

    # 画像保管先のURL格納用
    img_paths = []

    # 画像保管先のURL格納処理
    doc.xpath(reg_exp_inkphy_image).each do |node|
      img_path = URI.extract(node.to_s.to_s.gsub!(/\);/, ''), ["https"])
      img_paths.push(img_path[0])
    end
  end
end