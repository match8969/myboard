class InstagramContentImageService

  attr_reader :instagram_account_name

  def initialize(instagram_account_name)
    @instagram_account_name = instagram_account_name
  end


  def fetch_image_paths
    # FIXME: raise and return if no user instagram account exists for the instance name.
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
      img_paths.unshift(img_path[0]) # 古いインスタ写真を先頭にすることで、モデルのidの新しさと写真の新しさを取得時に一致させる。
    end
    img_paths
  end
end