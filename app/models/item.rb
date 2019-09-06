class Item < ApplicationRecord
    def test(keyword)
        objs = Amazon::Ecs.item_search(
            keyword,
            search_index:  'All',
            dataType: 'script',
            response_group: 'ItemAttributes, Images, OfferFull',
            country:  'jp',
            availability: 'Available'
        )

        first_item = objs.items.first
        puts "first_item : #{first_item} "

        # test    
        # title = first_item.get('ItemAttributes/Title')
        # image_url = first_item.get('LargeImage/URL')
        # url = first_item.get('DetailPageURL')
        # asin = first_item.get('ASIN')
        # brand = first_item.get('ItemAttributes/Brand')
        # price = first_item.get('OfferSummary/LowestNewPrice/Amount')
        # product_group = first_item.get('ItemAttributes/ProductGroup') # ProductGroup # OK
        # similar_products = first_item.get('SimilarProducts') # SimilarProducts

        # puts "title : #{title}"
        # puts "image_url : #{image_url}"
        # puts "url : #{url}"
        # puts "asin : #{asin}"
        # puts "brand : #{brand}"
        # puts "price : #{price}"
        # puts "product_group : #{product_group}"

    end


    def test_similarity_lookup(asin)
        res = Amazon::Ecs.similarity_lookup(
            asin,
            response_group: 'ItemAttributes, Similarities',
            country:  'jp'
        )
        puts "--- res : #{res} --- "
        item = res.get_element("Item")    
        sleep(2)
        puts "--- item : #{item} --- "
    end

    def binding(asin)
        # 
    end

    def test_relateditems(asin)
        # res = Amazon::Ecs.item_search(
        #     keyword,
        #     search_index:  'All',
        #     dataType: 'script',
        #     response_group: 'RelatedItems',
        #     country:  'jp',
        #     availability: 'Available'
        # )

        res = Amazon::Ecs.item_lookup(
            asin, # test : B01BCTCKTQ
            response_group: 'ItemAttributes',
            country:  'jp'
        )

        item = res.items.first
        puts "--- item : #{item} --- "
    end

    def item_search(asin)
        Amazon::Ecs.debug = true

        objs = Amazon::Ecs.item_search(
            asin,
            search_index:  'All',
            dataType: 'script',
            item_page: 1,
            response_group: 'ItemAttributes',
            country:  'jp'
        )

        objs.items.each do |amazon_item|
            puts "amazon_item : #{amazon_item}"
        end

    end

    def test_cart()
        res = Amazon::Ecs.send_request(:operation => '[CartGet]'
            
        )
    end

    def test_browsenode(asin)
        res = Amazon::Ecs.item_lookup(
            asin,
            response_group: 'ItemAttributes',
            country:  'jp'
        )

        item = res.items.first
        
        puts "--- #{__method__} ---"
        puts "item : #{item}-"
    end

    def item_lookup(asin)
        Amazon::Ecs.debug = true
        res = Amazon::Ecs.item_lookup(
            asin,
            response_group: 'ItemAttributes, BrowseNodes',
            country:  'jp'
        )
        item = res.items.first
        puts "item : #{item}-"

        # 在庫ないASIN
        # ASIN: B01BCTCKTQ
        # Request: http://webservices.amazon.co.jp/onca/xml?AWSAccessKeyId=AKIAJNXFKCYX7QKX2WPQ&AssociateTag=sl01tn-22&ItemId=B01BCTCKTQ&Operation=ItemLookup&ResponseGroup=ItemAttributes&Service=AWSECommerceService&Timestamp=2019-08-30T11%3A00%3A59Z&Version=2013-08-01&Signature=vtB6wL%2BIel1EjxjfKYGmFvlqdeffiA%2F%2BKvW2MVFKarI%3D

        # 在庫あるASIN
        # ASIN: B019GNUT0C
        # Request: http://webservices.amazon.co.jp/onca/xml?AWSAccessKeyId=AKIAJNXFKCYX7QKX2WPQ&AssociateTag=sl01tn-22&ItemId=B019GNUT0C&Operation=ItemLookup&ResponseGroup=ItemAttributes&Service=AWSECommerceService&Timestamp=2019-08-30T11%3A03%3A21Z&Version=2013-08-01&Signature=H7A8TQzwU6SbKysa6EAMAac7mz6pB8y7H0ameOJXXOo%3D

        # <ProductGroup>CE</ProductGroup>
        # <ProductTypeName>PHONE_ACCESSORY</ProductTypeName>

    end

    def item_search_browsenode(keyword)
        # i.item_search_browsenode('机')
        # Amazon::Ecs.debug = true

        # Amazon::Ecs::Responceオブジェクトの取得
        objs = Amazon::Ecs.item_search(
            keyword,
            search_index:  'All',
            dataType: 'script',
            item_page: 1,
            response_group: 'ItemAttributes, Images, OfferFull, BrowseNodes',
            country:  'jp',
            availability: 'Available'
        #power: "Not kindle"
        )

        if objs.items.present?
            objs.items.each do |amazon_item|
                asin = amazon_item.get('ASIN')
                browsenodes = amazon_item.get_elements('BrowseNodes/BrowseNode')
                browsenodeid = amazon_item.get('BrowseNodes/BrowseNode/BrowseNodeId')
                browsenode_name = amazon_item.get('BrowseNodes/BrowseNode/Name')

                # puts "#{asin} has no browsenodeid"if browsenodeid.nil?

                # puts "----------"
                # puts "asin : #{asin}"
                # if browsenodes.present?
                #     puts "browsenodes.length : #{browsenodes.length}"
                #     browsenodes.each do |browsenode|                        
                #         b_id = browsenode.get('BrowseNodeId')
                #         b_name = browsenode.get('Name')
                #         puts "b_id : #{b_id}"
                #         puts "b_name : #{b_name}"
                #     end 
                # end
                
                puts "asin : #{asin}"
                puts "browsenodeid : #{browsenodeid}"
                puts "browsenode_name : #{browsenode_name}"
            end
        end
        return
    end

    def browse_node_lookup(browsenodeid)
        Amazon::Ecs.debug = true
        res = Amazon::Ecs.browse_node_lookup(
            browsenodeid,
            response_group: 'TopSellers',
            country:  'jp'
        )
        item = res.items.first
        puts "item : #{item}-"
    end

    def item_lookup_for_newpath(asin)
        # i.item_lookup_for_newpath('')
        # https://www.amazon.co.jp/s?k=#{item.title}&rh=n:#{browsenode_id},p_89:#{item.brand}
        Amazon::Ecs.debug = true
        res = Amazon::Ecs.item_lookup(
            asin,
            response_group: 'ItemAttributes, BrowseNodes',
            country:  'jp'
        )
        item = res.items.first

        title = item.get('ItemAttributes/Title')
        brand = item.get('ItemAttributes/Brand')
        browsenode_id = ""
        browsenode_name =""
        
        # browsenode_id = item.get('BrowseNodes/BrowseNode/BrowseNodeId')
        # browsenode_name = item.get('BrowseNodes/BrowseNode/Name')
        browsenodes = item.get_elements('BrowseNodes/BrowseNode')
        browsenodes.each do |browsenode|     
            if browsenode.get('Name') != "カテゴリー別" && browsenode.get('Name') != "By Brands"
                browsenode_id = browsenode.get('BrowseNodeId') if browsenode_id.blank?
                browsenode_name = browsenode.get('Name') if browsenode_name.blank?
                puts "browsenode_id : #{browsenode_id}"
                puts "browsenode_name : #{browsenode_name}"
            end
        end

        # v0.6
        words = title.split(" ")
        puts "words : #{words}"
        # words = words[0..3] # ver.6.0
        words = words[0..2]

        puts "after words : #{words}"
        title = words.join(" ")
        
        search_url = "https://www.amazon.co.jp/s?" 
        query = URI.encode_www_form({k: title, rh: "n:#{browsenode_id},p_89:#{brand}", tag:"sl01tn-22"})
        puts "query : #{query}"
        new_path = search_url + query

        # new_path = "https://www.amazon.co.jp/s?k=#{title}&rh=n:#{browsenode_id},p_89:#{brand}&tag=sl01tn-22"
        puts "title : #{title}"
        puts "brand : #{brand}"
        puts "browsenode_id : #{browsenode_id}"
        puts "browsenode_name : #{browsenode_name}"
        puts "new_path : #{new_path}"
        # puts "url : #{URI.encode(new_path)}" # 動作OK。[]が変換されない問題はある。 正規表現でやれば解決はできそう。
        # https://www.amazon.co.jp/s?k=【大容量】ULTRA+Downy+(ウルトラダウニー)+柔軟剤+サンブロッサム+3830ml&rh=n:170665011,p_89:DOWNY(ダウニー)&tag=sl01tn-22
    end

    def item_search_unavalable(keyword)
        objs = Amazon::Ecs.item_search(
            keyword,
            search_index:  'All',
            dataType: 'script',
            response_group: 'ItemAttributes, Images, OfferFull',
            country:  'jp',
            availability: 'Available'
        )

        first_item = objs.items.first
        puts "first_item : #{first_item} "
    end


end
