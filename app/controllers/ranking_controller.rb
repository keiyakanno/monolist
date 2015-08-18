class RankingController < ApplicationController
  
  def want
    ranking_want = Want.group(:item_id).order("count_item_id desc").limit(10).count("item_id")
    query_ranked_items(ranking_want)
  end
  
  def have
    ranking_have = Have.group(:item_id).order("count_item_id desc").limit(10).count("item_id")
    query_ranked_items(ranking_have)
  end
  
  private
  
  def query_ranked_items(ranking)
    @ranked_items =[]
    for ranked_item in ranking do
      @ranked_items << Item.find(ranked_item[0])
    end
  end
  
end