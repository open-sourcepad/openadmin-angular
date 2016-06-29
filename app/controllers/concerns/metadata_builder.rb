module MetadataBuilder
  extend ActiveSupport::Concern

  #
  # converts the query string into a json hash
  # note: passing a hash into rspec http tests, does not need any form of converion
  # note: because browser automatically makes a URL safe for all objects passed into a hash
  #
  def query_params
    @query_params ||= params[:query].present? ? JSON.parse(params[:query].gsub('=>', ':')) : {}
  end

  def query_limit
    @query_limit ||= params[:limit].present? ? params[:limit].to_i : 5
  end

  def current_page
    params[:page].present? ? params[:page] : 1
  end

  def render_with_meta_data collection=nil,count=nil
    collection ||= @collection
    render json: {collection: collection, count: count || collection.total_count, page: current_page}
  end

end
