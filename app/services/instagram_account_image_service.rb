class InstagramAccountImageService

  attr_reader :instagram_account_name

  def initialize(instagram_account_name)
    @instagram_account_name = instagram_account_name
  end

  def fetch_avatar_path
    url = "https://inkphy.com/user/#{@instagram_account_name}"
    # reg_exp_inkphy_image = '//div[@class="item"]//div[@class="media"]//a[@class="mask"]//@style'
    # reg_exp_inkphy_image = '//div[@class="profile"]//div[@class="userinfo text-center"]//div[@class="detail"]//img[@class="avatar"]//@source'
    reg_exp_inkphy_image = '//div[@class="profile"]//div[@class="userinfo text-center"]//div[@class="detail"]//img[@class="avatar"]//@src'

    # Htmlの取得
    charset = nil
    html = open(url) do |f|
      charset = f.charset # 文字種別を取得
      f.read # htmlを読み込んで変数htmlに渡す
    end
    # htmlをパース(解析)してオブジェクトを生成
    doc = Nokogiri::HTML.parse(html, nil, charset)
    img_path = doc.xpath(reg_exp_inkphy_image)
  end
end