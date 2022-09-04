class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user) # current_userが@userをフォロー
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def create_all
    users_id_list = params[:users].keys # チェックされたユーザのidを配列に格納

    users_id_list.each |id| do # 配列に含まれるユーザを1人ずつフォロー
      user = User.find(id)
      #current_user.follow(User.find(params[:id]))
      current_user.active_relationships.build(followed_id: user.id)
    end

    redirect_to users_path
  end
end
