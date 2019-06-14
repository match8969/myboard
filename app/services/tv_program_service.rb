class TvProgramService

  def fetch_tv_programs
    # TODO: hashのarrayを返す
    #
    # URLにアクセスするためのライブラリの読み込み
    require 'open-uri'
    # Nokogiriライブラリの読み込み
    require 'nokogiri'
    # html解析の読み込み
    require 'uri'


    # Website
    # URL = "https://tv.so-net.ne.jp/chart/" 23.actionにリダイレクトされる
    base_url = "https://tv.so-net.ne.jp/chart/23.action"
    # QUERY ="?head=#{}" # https://tv.so-net.ne.jp/chart/23.action?head=201906130000

    # SERACH_URL = BASE_URL + QUERY

    # test
    puts "---#{Time.now}"


  end

end