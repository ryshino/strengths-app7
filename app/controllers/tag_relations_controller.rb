class TagRelationsController < ApplicationController

  def create
    @episode = Episode.find(params[:user][:episode_id])
    @tag_ids = params[:user][:tag_ids]
    # 空文字を除いてeach文を回している
    current_user.tag_relations.delete_all
    @tag_ids.reject { |id| id.blank? }.each do |tag_id|
      tag_relation = TagRelation.new(tag_id: tag_id, episode_id: @episode.id, user_id: current_user.id)
      tag_relation.save
    end
    redirect_to episode_path(@episode)
  end

  private
    
    def tag_params
      params.require(:user).permit(:episode_id, tag_ids: [])
    end
end
